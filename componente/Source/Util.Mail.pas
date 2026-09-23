{ Componente desenvolvido por Eurico Júnior
}

unit Util.Mail;


interface

uses
   IdComponent // Units Genéricas do Indy para envio de email
, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL
  // Objeto SSL
, IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase, IdMessageClient,
  IdSMTPBase, IdSMTP // Objeto SMTP
, IdMessage // Objeto de Mensagem
, IdAttachmentFile ,// Objeto de Arquivos Anexos;
 system.Classes,system.SysUtils,
 vcl.forms,windows,Registry,vcl.Dialogs;


function EnviarEmail(
  aHost: string;
  aPort: Integer;
  aLogin, aSenha, aListaEmail,
  aAssunto, aCorpo, Anexo: string;
  aAuth, aAuthSSL,TLS: Boolean): Boolean;

implementation

function EnviarEmail(
  aHost: string;
  aPort: Integer;
  aLogin, aSenha, aListaEmail,
  aAssunto, aCorpo, Anexo: string;
  aAuth, aAuthSSL,TLS: Boolean): Boolean;
var
  AuthSSL: TIdSSLIOHandlerSocketOpenSSL;
  IdSMTP: TIdSMTP;
  IdMessage: TIdMessage;
const
  ArqTeste = 'c:\teste.txt';
begin
  Result := False;
  IdSMTP := TIdSMTP.Create(nil);
  IdMessage := TIdMessage.Create(nil);
  try
    IdSMTP.Host := aHost;
    IdSMTP.Port := aPort;
    IdSMTP.AuthType := satDefault;
    IdSMTP.Username := aLogin;
    IdSMTP.Password := aSenha;

    if aAuthSSL then
    begin
      AuthSSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
      IdSMTP.IOHandler := AuthSSL;
      IdSMTP.UseTLS := utUseExplicitTLS;
      AuthSSL.SSLOptions.Method := sslvSSLv2;
      AuthSSL.SSLOptions.SSLVersions:=[sslvSSLv2,sslvSSLv23,sslvSSLv3,sslvTLSv1_2, sslvTLSv1_1, sslvTLSv1];
      AuthSSL.SSLOptions.Mode := sslmClient;
    end;

    if aAuth then
      IdSMTP.AuthType := satDefault

    else
      IdSMTP.AuthType := satNone;
    try
      IdSMTP.Connect;
      IdMessage.From.Address := aLogin;
      IdMessage.Recipients.EMailAddresses := aListaEmail;
      IdMessage.Subject := aAssunto;
      IdMessage.Body.Text := 'Data/Hora: ' + FormatDateTime('dd/MM/yyyy HH:mm:ss', Now) + #13#10#13#10 + aCorpo;
      IdMessage.Body.SaveToFile(ArqTeste);
      IdMessage.MessageParts.Clear; // Limpa os anexos da lista
      if Anexo <> '' then
        TIdAttachmentFile.Create(IdMessage.MessageParts, TFileName(Anexo)); // adiciona anexo na lista, pode ser utilizado com looping
      IdSMTP.Send(IdMessage);
      ShowMessage('E-Mail Enviado com sucesso para: ' + aListaEmail);
    except
      on E: Exception do
      begin
        ShowMessage('Erro ao enviar E-Mail:' + #13#10 + e.Message);
        Exit;
      end;
    end;
  finally
    IdSMTP.Disconnect;
    FreeAndNil(IdSMTP);
    FreeAndNil(IdMessage);
    if AuthSSL <> nil then
      FreeAndNil(AuthSSL);
  end;
  Result := True;
end;

end.
