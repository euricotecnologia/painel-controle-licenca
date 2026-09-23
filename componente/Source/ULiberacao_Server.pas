{ Componente desenvolvido por Eurico Júnior
}

unit ULiberacao_Server;

interface
  uses
 system.Classes,system.SysUtils,vcl.forms;


  Type TLockServer=class(Tcomponent)
  private
    FOwner:TPersistent;
    FID_Cliente: integer;
    FID_Sistema: integer;
    procedure SetID_Cliente(const Value: integer);
    procedure SetID_Sistema(const Value: integer);
  published
     Property ID_Sistema:integer read FID_Sistema write SetID_Sistema;
     Property ID_Cliente:integer read FID_Cliente write SetID_Cliente;
     function GerarCodigo(data_vecto:TDate):String;
     constructor Create(AOwner:TComponent);
  end;
Procedure Register;

implementation
Procedure Register;
begin
  RegisterComponents('Kophex',[TLockServer]);
end;
{ TLockServer }

constructor TLockServer.Create(AOwner: TComponent);
begin
  inherited create(AOwner);
  FOwner := Aowner;
  self.ID_Sistema :=35;
end;

function TLockServer.GerarCodigo(data_vecto: TDate): String;
var
  dd,mm,yyyy:integer;
  strdias,strmes,strano,StrIDCLiente,StrIDSistema:String;
  StrDigDias,StrDIGMes:String;
  iIDCliente,IIDsistema:integer;
  digitosdias:integer;
  digitosmes:integer;
begin
  dd:= StrToInt(FormatDateTime('dd',data_vecto));
  //obtem os digitos da data  1 digito da data ou 2 dias da data
  digitosdias := dd;
  if Length(IntToStr(digitosdias))=1 then
  StrDigDias:='11' else StrDigDias:='22';

  //obtem os digitos do mes
  mm:= StrToInt(FormatDateTime('mm',data_vecto));
  digitosmes:=mm;
  if Length(IntToStr(digitosmes))=1 then
  StrDIGMes:='11' else StrDIGMes:='22';

  yyyy:= StrToInt(FormatDateTime('yyyy',data_vecto));
  dd:=dd*1000;
  mm:=mm*1000;
  iIDCliente := self.ID_Cliente*1000;
  IIDsistema := self.ID_Sistema*1000;

  if Length(IntToStr(dd))>4 then
  begin
    strdias :=IntToStr(dd);
    dd:=StrToInt(copy(strdias,1,4));
  end;
  if Length(IntToStr(mm))>4 then
  begin
    strmes :=IntToStr(mm);
    mm:=StrToInt(copy(strmes,1,4));
  end;
  if Length(IntToStr(iIDCliente))>4 then
  begin
    StrIDCLiente :=IntToStr(iIDCliente);
    iIDCliente:=StrToInt(copy(StrIDCLiente,1,4));
  end;
  if Length(IntToStr(IIDsistema))>4 then
  begin
    StrIDSistema :=IntToStr(IIDsistema);
    IIDsistema:=StrToInt(copy(StrIDSistema,1,4));
  end;

  strdias           := IntToHex(dd,4);
  strmes            := IntToHex(mm,4);
  strano            := IntToHex(yyyy,4);

  StrIDCLiente      := IntToHex(iIDCliente,4);
  StrIDSistema      := IntToHex(IIDsistema,4);
  StrDigDias        := IntToHex(StrToInt(StrDigDias),2);
  StrDIGMes         := IntToHex(StrToInt(StrDIGMes),2);
  //ordem de Montagem
  result:= StrIDSistema+strano+strdias+strmes+StrIDCLiente+StrDIGMes+StrDigDias;

end;

procedure TLockServer.SetID_Cliente(const Value: integer);
begin
  FID_Cliente := Value;
end;

procedure TLockServer.SetID_Sistema(const Value: integer);
begin
  if (Value<10)or (Value>99) then
  begin
    FID_Sistema :=10;
    raise Exception.Create('Atenção: ID Sistema deve ser entre 10 e menor que 99');
  end;
  FID_Sistema := Value;
end;

end.
