unit FrmLiberacao_F;

interface

uses
  Winapi.Windows, SysUtils, Classes, Controls, Forms,
  StdCtrls, Buttons, dialogs, FireDAC.Stan.Param,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,registry,
  ExtCtrls, Variants, Messages, Vcl.Menus, dxGDIPlusClasses;

type
  TFrmLiberacao = class(TForm)
    Label1: TLabel;
    PopupMenu1: TPopupMenu;
    S1: TMenuItem;
    Image1: TImage;
    LblIDCLiente: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    lib001: TBitBtn;
    BtnConfirmar: TBitBtn;
    Label2: TLabel;
    ECodigo: TEdit;
    Panel4: TPanel;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnConfirmarClick(Sender: TObject);
    procedure ECodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
        procedure Label2Click(Sender: TObject);
    procedure lib001Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    Liberado:boolean;
    ID_Cliente:integer;

  end;

var
  FrmLiberacao: TFrmLiberacao;

implementation

{$R *.dfm}

uses frmPrincipal;



procedure TFrmLiberacao.ECodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=VK_RETURN then
  begin
    BtnConfirmar.Click;
  end;
end;

procedure TFrmLiberacao.FormCreate(Sender: TObject);
begin
  Liberado:=false;
end;

procedure TFrmLiberacao.FormShow(Sender: TObject);
begin
  LblIDCLiente.Caption := FormatFloat('000000', uPrincipal.qrEmpresaid_cliente.AsInteger);
  LblIDCLiente.Caption := LblIDCLiente.Caption +' '+uPrincipal.qrEmpresaFILIAL.AsString;
end;

procedure TFrmLiberacao.Label2Click(Sender: TObject);
begin
  close;
end;

procedure TFrmLiberacao.lib001Click(Sender: TObject);
var
  URL,StrJson: string;
  JsonStreamRetorno : TStringStream;
  I:integer;
  InserindoOnline:boolean;
  Reg : TRegistry ;
begin
  uPrincipal.Conn_servidor.Connected:=false;
  try
    uPrincipal.Conn_servidor.Connected:=true;
  except
  end;
  if uPrincipal.Conn_servidor.Connected then
  begin
    if uPrincipal.Conn_servidor.Connected then
    begin
      with uPrincipal.SQL_Con_Liberacao do
      begin
        close;
       // Params[0].AsString:= uPrincipal.somenteNumero(uPrincipal.vfil_cnpj);
        open;
        if RecordCount=0 then //se não estiver cadastrado pela franquia o sistema vai cadastrar
        insert else
        edit;

        InserindoOnline                                               := uPrincipal.SQL_Con_Liberacao.state=dsInsert;

        uPrincipal.SQL_Con_Liberacaonome_razao.AsString               := uPrincipal.qrEmpresaFILIAL.AsString;
        uPrincipal.SQL_Con_Liberacaonome_fantasia.AsString            := uPrincipal.qrEmpresaFANTASIA.AsString;
        uPrincipal.SQL_Con_Liberacaocnpj.AsString                     := uPrincipal.somenteNumero(uPrincipal.qrEmpresaCNPJ.AsString);
        uPrincipal.SQL_Con_Liberacaoin_estadual.AsString              := uPrincipal.qrEmpresaIE.AsString;
        uPrincipal.SQL_Con_Liberacaoendereco.AsString                 := uPrincipal.qrEmpresaENDERECO.AsString;
        uPrincipal.SQL_Con_Liberacaocomplemento.AsString              := uPrincipal.qrEmpresaCOMPLEMENTO.AsString;
        uPrincipal.SQL_Con_Liberacaobairro.AsString                   := uPrincipal.qrEmpresaBAIRRO.AsString;
        uPrincipal.SQL_Con_Liberacaonumero.AsString                   := uPrincipal.qrEmpresaNUMERO.AsString;
        uPrincipal.SQL_Con_Liberacaomunicipio.AsString                := uPrincipal.qrEmpresaCIDADE.AsString;
        uPrincipal.SQL_Con_Liberacaocnpj_revenda.asString             := uPrincipal.qrEmpresacnpj_revenda.asString;
        uPrincipal.SQL_Con_Liberacaoestado.AsString                   := uPrincipal.qrEmpresaUF.AsString;
        uPrincipal.SQL_Con_Liberacaotelefone.AsString                 := uPrincipal.qrEmpresaTELEFONE.AsString;
        uPrincipal.SQL_Con_Liberacaoemail.AsString                    := uPrincipal.qrEmpresaEMAIL.AsString;
        uPrincipal.SQL_Con_Liberacaoregime.AsString                   :='Não Definido Cadastro Empresa' ;
        uPrincipal.SQL_Con_Liberacaoultimo_acesso.AsDateTime          := date;
        uPrincipal.SQL_Con_Liberacaodata_limite_liberacao.AsDateTime  := uPrincipal.LockClient1.Data_Vecto;
        if InserindoOnline then
        uPrincipal.SQL_Con_Liberacaostatus.AsInteger                  :=1;

        uPrincipal.SQL_Con_Liberacao.Post;
        //guarda o limite de nota no registro

        if( InserindoOnline) or (uPrincipal.qrEmpresaid_cliente.AsInteger=0) or (uPrincipal.qrEmpresaid_cliente.AsInteger <>
         uPrincipal.SQL_Con_Liberacaoid.AsInteger) then
        begin
          uPrincipal.qrEmpresa.edit;
          uPrincipal.qrEmpresaid_cliente.AsInteger                    := uPrincipal.SQL_Con_Liberacaoid.AsInteger;
          uPrincipal.qrEmpresa.post;
        end;

         uPrincipal.LockClient1.ID_Cliente                            := uPrincipal.SQL_Con_Liberacaoid.AsInteger;
         ECodigo.Text                                                 := uPrincipal.SQL_Con_Liberacaovalidacao.AsString;
        //se estiver bloquado o cadsatro no servidor online
        if uPrincipal.SQL_Con_Liberacaostatus.AsInteger = 0 then
        begin
           showmessage('Atenção: Seu cadastro encontra-se indisponivel no Sistema'+#13+
          'Contate a Franquia !');
           Reg := TRegistry.Create;
           Reg.RootKey := HKEY_CURRENT_USER;
           if Reg.KeyExists(ExtractFileName(Application.ExeName)+uPrincipal.LockClient1.ID_Sitema.ToString) then
           reg.DeleteKey(ExtractFileName(Application.ExeName)+uPrincipal.LockClient1.ID_Sitema.ToString);
           reg.CloseKey;
           reg.Free;
           application.Terminate;
           abort;
        end;


      end;
    end;
  end;

end;


procedure TFrmLiberacao.BtnConfirmarClick(Sender: TObject);
begin

    if uPrincipal.LockClient1.Liberar(ECodigo.Text) then
    begin
      Liberado:=true;
      showmessage('Sistema liberado com sucesso!'+#13+
      'Até '+DateToStr(uPrincipal.LockClient1.Data_Vecto));
      close;
    end else
    begin
      showmessage('Atenção: Chave invalida!');
    end;

end;

end.
