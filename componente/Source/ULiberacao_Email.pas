{ Componente desenvolvido por Eurico Júnior
}

unit ULiberacao_Email;

interface

uses
 system.Classes,system.SysUtils,
 vcl.forms,windows,Registry,vcl.Dialogs, WiniNet,ULiberacao_Client,util.mail;


  type
   TLockEmail=class(Tcomponent)
  private
    FHost_smtp: string;
    FaAuthSSL: Boolean;
    FaAuth: boolean;
    FSenha: string;
    FPort_smtp: Integer;
    FUsuario: string;
    FEmail_Envio: String;
    FMensagemComplementar: String;
    FLockCLient: TLockClient;
    FAssunto: String;
    FOwner:TPersistent;
    FTLS: boolean;
    procedure SetaAuth(const Value: boolean);
    procedure SetaAuthSSL(const Value: Boolean);
    procedure SetHost_smtp(const Value: string);
    procedure SetPort_smtp(const Value: Integer);
    procedure SetSenha(const Value: string);
    procedure SetUsuario(const Value: string);
    procedure SetAssunto(const Value: String);
    procedure SetEmail_Envio(const Value: String);
    procedure SetLockCLient(const Value: TLockClient);
    procedure SetMensagemComplementar(const Value: String);
    procedure SetTLS(const Value: boolean);

  published
     Property Host_smtp: string read FHost_smtp write SetHost_smtp;
     Property Port_smtp: Integer read FPort_smtp write SetPort_smtp;
     Property Usuario:string read FUsuario write SetUsuario;
     Property Senha:string read FSenha write SetSenha;
     Property aAuth :boolean read FaAuth write SetaAuth;
     Property aAuthSSL: Boolean read FaAuthSSL write SetaAuthSSL;
     property TLS:boolean read FTLS write SetTLS;
     Property Email_Envio:String read FEmail_Envio write SetEmail_Envio;
     Property Assunto:String read FAssunto write SetAssunto;
     Property MensagemComplementar:String read FMensagemComplementar write SetMensagemComplementar;
     Property LockCLient:TLockClient read FLockCLient write SetLockCLient;
     function SendEmail(Destinatario:string='';Assunto:string='';Corpo:string=''):boolean;
     constructor Create(Aowner:TComponent);
   end;

   procedure Register;


 function TemInternet: boolean;

implementation

 procedure Register;
 begin
   RegisterComponents('Kophex',[TlockEmail]);
 end;

function TemInternet:boolean;
var estado : Dword;
begin
  if not InternetGetConnectedState(@estado, 0) then
  result := False
  else
  begin
    if (estado and INTERNET_CONNECTION_LAN <> 0) OR (estado and INTERNET_CONNECTION_MODEM <> 0) or (Estado and INTERNET_CONNECTION_PROXY <> 0) then
    result := True;
  end;

end;



{ TlockEmail }

constructor TlockEmail.Create(Aowner: TComponent);
begin
 inherited create(Aowner);
 FOwner := Aowner;

end;

function TlockEmail.SendEmail(Destinatario:string='';Assunto:string='';Corpo:string=''): boolean;
var
 i:integer;
 function IIF(Vcondicao:boolean;vtrue,vfalse:variant):variant;
 begin
   if Vcondicao then
   Result := vtrue else Result := vfalse;
 end;
begin
  if not TemInternet then
  raise Exception.Create('Você não possui uma conexao com a internet valida!!!');

 try
  if self.LockCLient<>nil then
  result:= util.mail.EnviarEmail(
    Self.Host_smtp,
    self.Port_smtp,
    self.FUsuario,
    self.FSenha,
    iif(Destinatario<>'',Destinatario,self.Email_Envio),
    iif(Assunto<>'',Assunto,self.Assunto),
    iif(Corpo<>'',corpo,
     iif( self.FLockCLient<>nil,
    'Cliente ID '+self.LockCLient.ID_Cliente.ToString+' está solicitando '+
    'Liberação para o sistema '+self.LockCLient.ID_Sitema.ToString,'')),
    '',
    self.FaAuth,
    self.aAuthSSL,
    self.TLS)
  else
   result:= util.mail.EnviarEmail(
    Self.Host_smtp,
    self.Port_smtp,
    self.FUsuario,
    self.FSenha,
    iif(Destinatario<>'',Destinatario,self.Email_Envio),
    iif(Assunto<>'',Assunto,self.Assunto),
    Corpo,
    '',
    self.FaAuth,
    self.aAuthSSL,
    self.TLS);

 finally

 end;
end;



procedure TlockEmail.SetaAuth(const Value: boolean);
begin
  FaAuth := Value;
end;

procedure TlockEmail.SetaAuthSSL(const Value: Boolean);
begin
  FaAuthSSL := Value;
end;

procedure TlockEmail.SetAssunto(const Value: String);
begin
  FAssunto := Value;
end;

procedure TlockEmail.SetEmail_Envio(const Value: String);
begin
  FEmail_Envio := Value;
end;

procedure TlockEmail.SetHost_smtp(const Value: string);
begin
  FHost_smtp := Value;
end;

procedure TlockEmail.SetLockCLient(const Value: TLockClient);
begin
  FLockCLient := Value;
end;

procedure TlockEmail.SetMensagemComplementar(const Value: String);
begin
  FMensagemComplementar := Value;
end;

procedure TlockEmail.SetPort_smtp(const Value: Integer);
begin
  FPort_smtp := Value;
end;

procedure TlockEmail.SetSenha(const Value: string);
begin
  FSenha := Value;
end;

procedure TLockEmail.SetTLS(const Value: boolean);
begin
  FTLS := Value;
end;

procedure TlockEmail.SetUsuario(const Value: string);
begin
  FUsuario := Value;
end;

end.
