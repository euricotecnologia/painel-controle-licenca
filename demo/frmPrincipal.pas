unit frmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.ExtCtrls, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  FireDAC.Phys.IBBase, Vcl.StdCtrls, ULiberacao_Client, UniProvider,
  MySQLUniProvider, MemDS, DBAccess, Uni, InterBaseUniProvider, dateutils, Registry, Winsock, shellapi, WiniNet,
  Util.Dialog, NB30, System.IniFiles;

type
  TuPrincipal = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    LockClient1: TLockClient;
    lblCNPJ: TLabel;
    Conn_servidor: TUniConnection;
    SQL_Con_Liberacao: TUniQuery;
    SQL_Con_Liberacaoid: TIntegerField;
    SQL_Con_Liberacaonome_razao: TStringField;
    SQL_Con_Liberacaonome_fantasia: TStringField;
    SQL_Con_Liberacaocnpj: TStringField;
    SQL_Con_Liberacaoendereco: TStringField;
    SQL_Con_Liberacaocomplemento: TStringField;
    SQL_Con_Liberacaobairro: TStringField;
    SQL_Con_Liberacaonumero: TStringField;
    SQL_Con_Liberacaomunicipio: TStringField;
    SQL_Con_Liberacaoestado: TStringField;
    SQL_Con_Liberacaotelefone: TStringField;
    SQL_Con_Liberacaoemail: TStringField;
    SQL_Con_Liberacaoregime: TStringField;
    SQL_Con_Liberacaostatus: TIntegerField;
    SQL_Con_Liberacaodata_limite_liberacao: TDateField;
    SQL_Con_Liberacaolimita_nota: TIntegerField;
    SQL_Con_Liberacaolimita_nota_qtde: TIntegerField;
    SQL_Con_Liberacaocnpj_revenda: TStringField;
    SQL_Con_Liberacaoultimo_acesso: TDateField;
    SQL_Con_Liberacaoultimo_acesso_hora: TTimeField;
    SQL_Con_Liberacaoin_estadual: TStringField;
    SQL_Con_Liberacaovalidacao: TStringField;
    SQL_Con_Maquina: TUniQuery;
    SQL_Con_Maquinacodigo: TIntegerField;
    SQL_Con_Maquinaterminal: TStringField;
    SQL_Con_Maquinaip: TStringField;
    SQL_Con_MaquinanomePC: TStringField;
    SQL_Con_Maquinacnpj: TStringField;
    SQL_Con_Maquinadata: TDateTimeField;
    SQL_Con_Maquinadataalt: TDateTimeField;
    SQL_Con_Maquinastatus: TIntegerField;
    SQL_Con_Maquinaid: TIntegerField;
    SQL_Con_Maquinamaquina: TStringField;
    SQL_Con_Aux: TUniQuery;
    SQL_Con_Auxcodigo: TIntegerField;
    SQL_Con_Auxterminal: TStringField;
    SQL_Con_Auxip: TStringField;
    SQL_Con_AuxnomePC: TStringField;
    SQL_Con_Auxcnpj: TStringField;
    SQL_Con_Auxdata: TDateTimeField;
    SQL_Con_Auxdataalt: TDateTimeField;
    SQL_Con_Auxstatus: TIntegerField;
    SQL_Con_Auxid: TIntegerField;
    SQL_Con_Auxmaquina: TStringField;
    MySQLUniProvider1: TMySQLUniProvider;
    conexao: TUniConnection;
    qrEmpresa: TUniQuery;
    InterBaseUniProvider1: TInterBaseUniProvider;
    qrEmpresaCODIGO: TStringField;
    qrEmpresaRAZAO_SOCIAL: TStringField;
    qrEmpresaFANTASIA: TStringField;
    qrEmpresaENDERECO: TStringField;
    qrEmpresaCIDADE: TStringField;
    qrEmpresaUF: TStringField;
    qrEmpresaCEP: TStringField;
    qrEmpresaBAIRRO: TStringField;
    qrEmpresaTELEFONE: TStringField;
    qrEmpresaCOMPLEMENTO: TStringField;
    qrEmpresaNUMERO: TStringField;
    qrEmpresaCNPJ: TStringField;
    qrEmpresaIE: TStringField;
    qrEmpresaCNPJ_REVENDA: TStringField;
    qrEmpresaEMAIL: TStringField;
    qrEmpresaVALIDADE: TStringField;
    qrEmpresaID_CLIENTE: TIntegerField;
    qrEmpresaFILIAL: TStringField;
    label11: TLabel;
    LdataVenc: TLabel;
    query: TUniQuery;
    qrEmpresaTERMINAL: TStringField;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Conn_servidorBeforeConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function somenteNumero(sNum: string): string;
    function ConectadoInternet(): boolean;
    function GetIP: string;


  end;

var
  uPrincipal: TuPrincipal;
  vfil_cnpj: string;

implementation

uses
  FrmLiberacao_F;

{$R *.dfm}

function TuPrincipal.GetIP: string;
// --> Declare a Winsock na clausula uses da unit
var
  WSAData: TWSAData;
  HostEnt: PHostEnt;
  Name: string;
begin
  WSAStartup(2, WSAData);
  SetLength(Name, 255);
  Gethostname(PAnsiChar(Name), 255);
  SetLength(Name, StrLen(PAnsiChar(Name)));
  HostEnt := gethostbyname(PAnsiChar(Name));
  with HostEnt^ do
  begin
    result := Format('%d.%d.%d.%d', [Byte(h_addr^[0]), Byte(h_addr^[1]), Byte(h_addr^[2]), Byte(h_addr^[3])]);
  end;
  WSACleanup;
end;

procedure TuPrincipal.Conn_servidorBeforeConnect(Sender: TObject);
begin
  Conn_servidor.Password         := 'senha banco';
  Conn_servidor.DataBase         := 'banco de dados';
  Conn_servidor.UserName         := 'usuario';
  Conn_servidor.server           := 'servidor';
end;

function GetAdapterInfo(Lana: Ansichar): String;
var
      Adapter: TAdapterStatus;
      NCB: TNCB;
begin
      FillChar(NCB, SizeOf(NCB), 0);
      NCB.ncb_command := Char(NCBRESET);
      NCB.ncb_lana_num := Lana;
    if Netbios(@NCB) <> Char(NRC_GOODRET) then
      begin
        Result := 'mac not found';
        Exit;
      end;
      FillChar(NCB, SizeOf(NCB), 0);
      NCB.ncb_command := Char(NCBASTAT);
      NCB.ncb_lana_num := Lana;
      NCB.ncb_callname := '*';
      FillChar(Adapter, SizeOf(Adapter), 0);
      NCB.ncb_buffer := @Adapter;
      NCB.ncb_length := SizeOf(Adapter);
    if Netbios(@NCB) <> Char(NRC_GOODRET) then
      begin
        Result := 'mac not found';
        Exit;
      end;
    Result :=
    IntToHex(Byte(Adapter.adapter_address[0]), 2) + '-' +
    IntToHex(Byte(Adapter.adapter_address[1]), 2) + '-' +
    IntToHex(Byte(Adapter.adapter_address[2]), 2) + '-' +
    IntToHex(Byte(Adapter.adapter_address[3]), 2) + '-' +
    IntToHex(Byte(Adapter.adapter_address[4]), 2) + '-' +
    IntToHex(Byte(Adapter.adapter_address[5]), 2);
end;

function GetMACAddress: string;
var
    AdapterList: TLanaEnum;
    NCB: TNCB;
begin
    FillChar(NCB, SizeOf(NCB), 0);
    NCB.ncb_command := Char(NCBENUM);
    NCB.ncb_buffer := @AdapterList;
    NCB.ncb_length := SizeOf(AdapterList);
    Netbios(@NCB);
    if Byte(AdapterList.length) > 0 then
        Result := GetAdapterInfo(AdapterList.lana[0])
    else
        Result := 'mac not found';
end;




function TuPrincipal.ConectadoInternet: boolean;
var
  estado: DWord;
begin
  if not InternetGetConnectedState(@estado, 0) then
    result := false
  else
  begin
    if (estado and INTERNET_CONNECTION_LAN <> 0) OR (estado and INTERNET_CONNECTION_MODEM <> 0) or (estado and INTERNET_CONNECTION_PROXY <> 0) then
      result := true;
  end;
end;

procedure TuPrincipal.FormShow(Sender: TObject);
var
  InserindoOnline : boolean;
  Registro        : TRegistry;
  d, i            : integer;
begin
  vfil_cnpj       := uPrincipal.qrEmpresaCNPJ.asString;
  lblCNPJ.caption := 'CNPJ: ' + vfil_cnpj;
      try
        Registro         := TRegistry.Create;
        Registro.RootKey := HKEY_CURRENT_USER;
        if not Registro.OpenKey('DemoPlataforma', false) then
        begin
          Registro.CreateKey('DemoPlataforma');
          Registro.OpenKey('DemoPlataforma', true);
          Registro.writeString('Terminal', inputbox('Config. Terminal.', 'Nº Terminal (3 Digitos)', '000'));
        end
        else
        begin
          if ((Registro.ReadString('Terminal') = '') or (Registro.ReadString('Terminal') = '000')) then
          begin
            Registro.writeString('Terminal', inputbox('Config. Terminal', 'Nº Terminal (3 Digitos)', '000'));
          end;
        end;

      finally
        Registro.free;
      end;
          // verificação online  pega o id
{$REGION'VALIDAÇÃO Online'}
    if (vfil_cnpj <> '') then
    begin
      LockClient1.ID_Cliente := uPrincipal.qrEmpresaid_cliente.AsInteger;
      if ConectadoInternet then
      begin
        WaitShowProgress('Aguarde validando aplicação...',
          procedure
          var
            Reg: TRegistry;
            procedure ExtrairDLL(const NomeResource, NomeArquivo: String);
            var
              RStream: TResourceStream;
            begin
              RStream := TResourceStream.Create(HInstance, NomeResource, RT_RCDATA);
              try
                RStream.Seek(0, soFromBeginning);
                RStream.SaveToFile(NomeArquivo);
              finally
                RStream.free;
              end;
            end;

          begin
            if not FileExists(ExtractFilePath(application.exename) + 'libmysql.dll') then
            begin
              ExtrairDLL('libmysql', ExtractFilePath(application.exename) + 'libmysql.dll');
            end;
            try
              Conn_servidor.Connected := false;

              Conn_servidor.Connected := true;
            except
            end;
            if Conn_servidor.Connected then
            begin
              with SQL_Con_Liberacao do
              begin
                close;
                params[0].asString := somenteNumero(vfil_cnpj);
                open;
                if recordcount = 0 then // se não estiver cadastrado pela franquia o sistema vai cadastrar
                  insert
                else
                  edit;

                InserindoOnline := SQL_Con_Liberacao.state = dsInsert;

                SQL_Con_Liberacaonome_razao.asString          := uPrincipal.qrEmpresaFILIAL.asString;
                SQL_Con_Liberacaonome_fantasia.asString       := uPrincipal.qrEmpresaFANTASIA.asString;
                SQL_Con_Liberacaocnpj.asString                := somenteNumero(uPrincipal.qrEmpresaCNPJ.asString);
                SQL_Con_Liberacaoin_estadual.asString         := uPrincipal.qrEmpresaIE.asString;
                SQL_Con_Liberacaoendereco.asString            := uPrincipal.qrEmpresaENDERECO.asString;
                SQL_Con_Liberacaocomplemento.asString         := uPrincipal.qrEmpresaCOMPLEMENTO.asString;
                SQL_Con_Liberacaobairro.asString              := uPrincipal.qrEmpresaBAIRRO.asString;
                SQL_Con_Liberacaonumero.asString              := uPrincipal.qrEmpresaNUMERO.asString;
                SQL_Con_Liberacaomunicipio.asString           := uPrincipal.qrEmpresaCIDADE.asString;
                SQL_Con_Liberacaocnpj_revenda.asString        := uPrincipal.qrEmpresacnpj_revenda.asString;
                SQL_Con_Liberacaoestado.asString              := uPrincipal.qrEmpresaUF.asString;
                SQL_Con_Liberacaotelefone.asString            := uPrincipal.qrEmpresaTELEFONE.asString;
                SQL_Con_Liberacaoemail.asString               := uPrincipal.qrEmpresaEMAIL.asString;
                SQL_Con_Liberacaoregime.asString              := 'Não Definido Cadastro Empresa';
                SQL_Con_Liberacaoultimo_acesso.AsDateTime     := date;
                SQL_Con_Liberacaoultimo_acesso_hora.asString  := timetostr(time);

                SQL_Con_Liberacaodata_limite_liberacao.asDateTime := LockClient1.Data_Vecto;
                if InserindoOnline then
                  SQL_Con_Liberacaostatus.AsInteger := 1;

                SQL_Con_Liberacao.post;
                // guarda o limite de nota no registro

                if (InserindoOnline) or (uPrincipal.qrEmpresaid_cliente.AsInteger = 0) or (uPrincipal.qrEmpresaid_cliente.AsInteger <> SQL_Con_Liberacaoid.AsInteger) then
                begin
                  uPrincipal.qrEmpresa.edit;
                  uPrincipal.qrEmpresaid_cliente.AsInteger := SQL_Con_Liberacaoid.AsInteger;
                  LockClient1.ID_Cliente := SQL_Con_Liberacaoid.AsInteger;
                  uPrincipal.qrEmpresa.post;
                end;
                // se estiver bloquado o cadsatro no servidor online
                if SQL_Con_Liberacaostatus.AsInteger = 0 then
                begin
                  showmessage('Atenção: Seu cadastro encontra-se indisponivel no Sistema' + #13 + 'Contate a Franquia !');
                  Reg := TRegistry.Create;
                  Reg.RootKey := HKEY_CURRENT_USER;
                  if Reg.KeyExists(ExtractFileName(application.exename) + LockClient1.ID_Sitema.ToString) then
                    Reg.DeleteKey(ExtractFileName(application.exename) + LockClient1.ID_Sitema.ToString);
                  Reg.CloseKey;
                  Reg.free;
                    close;
                  abort;
                end;

              end;
              //////////////////////// CONTROLE DE MAQUINAS - INICIO ////////////////////////

                        with SQL_Con_Maquina do
              begin
                close;
                Params[0].AsString:= GetMACAddress;     //deve ser validado pelo cnpj tb
                Params[1].AsString:= somenteNumero(vfil_cnpj);
                open;
                if RecordCount=0 then //se não estiver cadastrado pela franquia o sistema vai cadastrar
                insert else
                edit;

                InserindoOnline:= SQL_Con_Maquina.state=dsInsert;

                SQL_Con_Maquinaterminal.AsString      := 'terminal';
                SQL_Con_Maquinaip.AsString            := GetIP;
                SQL_Con_Maquinacnpj.AsString          := somenteNumero(uPrincipal.qrEmpresaCNPJ.AsString);
                SQL_Con_MaquinanomePC.AsString        := GetMACAddress;
                SQL_Con_Maquinamaquina.AsString       := label11.caption;
                if SQL_Con_Maquina.state=dsInsert then
                   SQL_Con_Maquinadata.AsDateTime := date;

                   if SQL_Con_Maquina.state=dsEdit then
                      SQL_Con_Maquinadataalt.AsDateTime := date;

                if SQL_Con_Maquina.state=dsInsert then
                  SQL_Con_Maquinastatus.AsInteger :=1;

                 if SQL_Con_Maquina.state=dsInsert then
                 SQL_Con_Maquinaid.AsInteger:= SQL_Con_Liberacaoid.AsInteger;

                  with SQL_Con_Aux do
                  begin
                    close;
                    Params[0].AsInteger       := SQL_Con_Liberacaoid.AsInteger;
                    open;
                  end;

                 if SQL_Con_Maquina.state=dsInsert then
                   begin
                         if  (SQL_Con_Aux.RecordCount >= SQL_Con_Liberacaolimita_nota_qtde.AsInteger) then
                        begin
                           showmessage('Atenção: Limite de maquinas para a licença excedido '+#13+
                          'Contate a Franquia !');
                           Reg := TRegistry.Create;
                           Reg.RootKey := HKEY_CURRENT_USER;
                           if Reg.KeyExists(ExtractFileName(Application.ExeName)+LockClient1.ID_Sitema.ToString) then
                           reg.DeleteKey(ExtractFileName(Application.ExeName)+LockClient1.ID_Sitema.ToString);
                           reg.CloseKey;
                           reg.Free;
                            SQL_Con_Maquinastatus.AsInteger :=0;

                            SQL_Con_Maquina.Post;
                            close;
                           abort;

                        end
                        else
                           SQL_Con_Maquina.Post;
                   end;

                 //se estiver bloquado o cadsatro no servidor online
                if (SQL_Con_Maquinastatus.AsInteger = 0) then
                begin
                   showmessage('Atenção: Seu cadastro encontra-se indisponivel no Sistema'+#13+
                  'Contate a Franquia !');
                   Reg := TRegistry.Create;
                   Reg.RootKey := HKEY_CURRENT_USER;
                   if Reg.KeyExists(ExtractFileName(Application.ExeName)+LockClient1.ID_Sitema.ToString) then
                   reg.DeleteKey(ExtractFileName(Application.ExeName)+LockClient1.ID_Sitema.ToString);
                   reg.CloseKey;
                   reg.Free;
                    close;
                   abort;



                end;


              end;

            end;
          end
          );
      end ;
              //////////////////////// CONTROLE DE MAQUINAS - FIM ////////////////////////
      repeat
        inc(i);
        if not LockClient1.ValidarAplicacao then
        begin
          if ConectadoInternet then
          begin
            if Conn_servidor.Connected then
            begin
              if SQL_Con_Liberacaovalidacao.asString <> '' then
              begin
                if LockClient1.Liberar(SQL_Con_Liberacaovalidacao.asString) then
                begin
                  showmessage('Sistema liberado com sucesso!' + #13 + 'Até ' + DateToStr(LockClient1.Data_Vecto));
                end
                else
                begin
                  FrmLiberacao := TFrmLiberacao.Create(nil);
                  FrmLiberacao.showmodal;
                  FrmLiberacao.free;
                end;
              end
              else
              begin
                FrmLiberacao := TFrmLiberacao.Create(nil);
                FrmLiberacao.showmodal;
                FrmLiberacao.free;
              end;
            end
            else
            begin
              FrmLiberacao := TFrmLiberacao.Create(nil);
              FrmLiberacao.showmodal;
              FrmLiberacao.free;
            end;
          end
          else
          begin
            FrmLiberacao := TFrmLiberacao.Create(nil);
            FrmLiberacao.showmodal;
            FrmLiberacao.free;
          end;
        end;
        LdataVenc.caption := 'Liberado: ' + DateToStr(LockClient1.Data_Vecto);
        if i >= 3 then
        begin
          showmessage('Limite de Tentativas ultrapassada!');
           close;
          abort
        end;
      until LockClient1.ValidarAplicacao;


    end;

{$ENDREGION}


end;

function TuPrincipal.somenteNumero(sNum: string): string;
var
  S1, S2: string;
  i: integer;
begin
  S1    := sNum;
  S2    := '';
  for i := 1 to Length(S1) do
    if S1[i] in ['0' .. '9'] then
      S2 := S2 + S1[i];
  result := S2;
end;

procedure TuPrincipal.Button1Click(Sender: TObject);
begin
  FrmLiberacao.ShowModal;
end;

end.
