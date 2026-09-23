{ Componente desenvolvido por Eurico Júnior
}

unit ULiberacao_Client;

interface
uses
 system.Classes,system.SysUtils,
 vcl.forms,windows,Registry,vcl.dialogs;

 type
   TStatus=(Liberado,Bloqueado);
  Type
   TBeforeValidate = procedure (sender:TObject) of Object;
   TAfterValidate  = procedure (sender:TObject) of Object;


 type
   TLockClient=class(Tcomponent)
  private
    FOwner:TPersistent;
    //eventos
    FBeforeValidate:TBeforeValidate;

    FData_Liberado: Tdate;
    FData_Vecto: TDate;
    FID_Cliente: integer;
    FID_Sitema: integer;
    FStatus: TStatus;
    FAfterValidate: TAfterValidate;
    FBloquearChave_data_menor: boolean;
    procedure SetData_Liberado(const Value: Tdate);
    procedure SetData_Vecto(const Value: TDate);
    procedure SetID_Cliente(const Value: integer);
    procedure SetID_Sitema(const Value: integer);
    procedure SetStatus(const Value: TStatus);
    procedure SetBeforeValidate(const Value: TBeforeValidate);
    procedure SetAfterValidate(const Value: TAfterValidate);
    function CheckLiberado :Boolean;
    procedure SetBloquearChave_data_menor(const Value: boolean);
  published
        property BeforeValidate:TBeforeValidate read FBeforeValidate write SetBeforeValidate;
        property AfterValidate:TAfterValidate read FAfterValidate write SetAfterValidate;
        property Status:TStatus read FStatus write SetStatus;

        //id do seu sistema
        property ID_Sitema:integer read FID_Sitema write SetID_Sitema;
        //id do cliente no seu sistema
        Property ID_Cliente:integer read FID_Cliente write SetID_Cliente;
        //data de vencimento da liberacao
        Property Data_Vecto:TDate read FData_Vecto write SetData_Vecto;
        //data limite de liberacao
        Property Data_Liberado:Tdate read FData_Liberado write SetData_Liberado;
        //validar data vencida
        Property BloquearChave_data_menor:boolean read FBloquearChave_data_menor write SetBloquearChave_data_menor;
        //função para verificar a liberacao
        //Liberar o Aplicativo
        function Liberar(Chave:String):boolean;
        function ValidarAplicacao:boolean;
        //Construtor
        constructor Create(Aowner:TComponent);

     end;

procedure Register;
function Crypt(Action, Src: String): String;

implementation

function Crypt(Action, Src: String): String;
Label Fim;
var KeyLen : Integer;
  KeyPos : Integer;
  OffSet : Integer;
  Dest, Key : String;
  SrcPos : Integer;
  SrcAsc : Integer;
  TmpSrcAsc : Integer;
  Range : Integer;
begin
  if (Src = '') Then
  begin
    Result:= '';
    Goto Fim;
  end;
  Key := 'YUQL23KL23DF90WI5E1JAS467NMCXXL6JAOAUWWMCL0AOMM4A4VZYW9KHJUI2347EJHJKDF3424SKL K3LAKDJSL9RTIKJ';
  Dest := '';
  KeyLen := Length(Key);
  KeyPos := 0;
  SrcPos := 0;
  SrcAsc := 0;
  Range := 256;
  if (Action = UpperCase('C')) then
  begin
    Randomize;
    OffSet := Random(Range);
    Dest := Format('%1.2x',[OffSet]);
    for SrcPos := 1 to Length(Src) do
    begin
      Application.ProcessMessages;
      SrcAsc := (Ord(Src[SrcPos]) + OffSet) Mod 255;
      if KeyPos < KeyLen then KeyPos := KeyPos + 1 else KeyPos := 1;
      SrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
      Dest := Dest + Format('%1.2x',[SrcAsc]);
      OffSet := SrcAsc;
    end;
  end
  Else if (Action = UpperCase('D')) then
  begin
    OffSet := StrToInt('$'+ copy(Src,1,2));
    SrcPos := 3;
  repeat
    SrcAsc := StrToInt('$'+ copy(Src,SrcPos,2));
    if (KeyPos < KeyLen) Then KeyPos := KeyPos + 1 else KeyPos := 1;
    TmpSrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
    if TmpSrcAsc <= OffSet then TmpSrcAsc := 255 + TmpSrcAsc - OffSet
    else TmpSrcAsc := TmpSrcAsc - OffSet;
    Dest := Dest + Chr(TmpSrcAsc);
    OffSet := SrcAsc;
    SrcPos := SrcPos + 2;
  until (SrcPos >= Length(Src));
  end;
  Result:= Dest;
  Fim:
end;

procedure Register;
begin
  RegisterComponents('Kophex',[TLockClient]);
end;
{ TLib }

constructor TLockClient.Create(Aowner:TComponent);
begin
  inherited create(Aowner);
  FOwner := Aowner;
  FID_Sitema :=10;
  CheckLiberado;
end;

function TLockClient.CheckLiberado: Boolean;
begin
  result:= date < FData_Vecto;
  if date < FData_Vecto then
  begin
    Status := TStatus.Liberado ;
  end;
end;

function TLockClient.Liberar(Chave: String): boolean;
var
  dd,mm,yyyy:integer;
  strdias,strmes,strano,StrIDCLiente,StrIDSistema,StrDIGMes,StrDIGDia:String;
  IIdSistema,IIdias,IIano,IImes,IIdcliente,IDIG_Mes,IDIG_dia:Double;
  StrData:String;
  DData:TDate;
  Registro:Tregistry;
begin
  Status := Bloqueado;

  if Assigned(FBeforeValidate) then
   FBeforeValidate(self);

  StrIDSistema := Copy(Chave,1,4);
  strano       := Copy(Chave,5,4);
  strdias      := Copy(Chave,9,4);
  strmes       := Copy(chave,13,4);
  StrIDCLiente := Copy(Chave,17,4);

  StrDIGMes    := Copy(Chave,21,2);
  StrDIGDia    := Copy(Chave,23,2);
  try
  IDIG_Mes     := StrToInt('$'+StrDIGMes);
  except
  end;
  try
  IDIG_dia     := StrToInt('$'+StrDIGDia);
  except
  end;
  try
  IIdSistema  := StrToInt('$'+StrIDSistema)/100;
  except
  end;
  try
  IIano       := StrToInt('$'+strano);
  except
  end;
  try
  IIdias      := StrToInt('$'+strdias);
  if IDIG_dia=11 then //digitos do ano
  IIdias      := IIdias/1000 else IIdias:= IIdias/100;
  except
  end;
  try
  IImes       := StrToInt('$'+strmes);
  if IDIG_Mes=11 then
  IImes       := IImes/1000 else IImes  := iimes/100;
  except
  end;
 // IImes       := StrToInt('$'+strmes)/1000;
  try
  IIdcliente  := StrToInt('$'+StrIDCLiente)/100;
  except
  end;
  StrData := FormatFloat('00',IIdias)+'/';
  StrData := StrData+ FormatFloat('00',IImes)+'/';
  StrData := StrData + FormatFloat('0000',IIano);
  try
    DData := StrToDate(StrData);
  except
    showmessage('Atenção: Data Invalida!');
  end;
  if DateToStr(self.Data_Vecto)='30/12/1899' then
  self.Data_Vecto :=date;

  if DData<= self.Data_Vecto then
  begin
   if self.BloquearChave_data_menor then
   showmessage('Atenção: Chave Vencida!');
   FData_Vecto:=date;
  end;

  if IIdcliente<>self.ID_Cliente then
  begin
    showmessage('Atenção: Chave não pertence a sua empresa!');
    FData_Vecto:=date;
  end;

  if IIdSistema<>self.ID_Sitema then
  begin
    showmessage('Atenção: Chave não pertence a esse sistema!');
    FData_Vecto:=date;
  end;
  {salvar os dados da liberação no registro}
  Registro := TRegistry.Create;
  Registro.RootKey := HKEY_CURRENT_USER;
  Registro.OpenKey(ExtractFileName(Application.ExeName)+self.ID_Sitema.ToString,true);
  Registro.WriteString('Data_Vecto',Crypt('C',DateToStr(DData)));
  Registro.WriteString('Data_Liberado',Crypt('C',DateToStr(date)));
  Registro.WriteString('Chave',Crypt('C',chave));
  Registro.WriteString('Cliente',Crypt('C',self.ID_Cliente.ToString));
  Registro.CloseKey;
  Registro.Free;

  FData_Vecto := DData;
  FData_Liberado :=date;


  result := CheckLiberado;
  if result then
  if Assigned(AfterValidate) then
  AfterValidate(self);

end;



procedure TLockClient.SetAfterValidate(const Value: TAfterValidate);
begin
  FAfterValidate := Value;
end;

procedure TLockClient.SetBeforeValidate(const Value: TBeforeValidate);
begin
  FBeforeValidate := Value;
end;

procedure TLockClient.SetBloquearChave_data_menor(const Value: boolean);
begin
  FBloquearChave_data_menor := Value;
end;

procedure TLockClient.SetData_Liberado(const Value: Tdate);
begin
  FData_Liberado := Value;
end;

procedure TLockClient.SetData_Vecto(const Value: TDate);
begin
  FData_Vecto := Value;
end;

procedure TLockClient.SetID_Cliente(const Value: integer);
begin
  FID_Cliente := Value;
end;

procedure TLockClient.SetID_Sitema(const Value: integer);
begin
  if (Value<10)or (Value>99) then
  begin
    FID_Sitema :=10;
    raise Exception.Create('Atenção: ID Sistema deve ser entre 10 e menor que 99');
  end;
  FID_Sitema := Value;

end;

procedure TLockClient.SetStatus(const Value: TStatus);
begin
  FStatus := Value;
end;



function TLockClient.ValidarAplicacao:boolean;
var
  Registro :TRegistry;
begin
  result:=false;
  Status := Bloqueado;

  {salvar os dados da liberação no registro}
  try
  Registro := TRegistry.Create;
  Registro.RootKey := HKEY_CURRENT_USER;
  Registro.OpenKey(ExtractFileName(Application.ExeName)+self.ID_Sitema.ToString,true);
  self.Data_Vecto    := StrToDate( Crypt('D',Registro.ReadString('Data_Vecto')));
  self.Data_Liberado :=StrToDate( Crypt('D', Registro.ReadString('Data_Liberado')));
  if self.ID_Cliente<>StrToIntDef( Crypt('D', Registro.ReadString('Cliente')),0) then
  Self.Data_Vecto :=date;
  Registro.CloseKey;
  Registro.Free;
  except on E:Exception do
  begin
    Application.MessageBox('Liberação VIOLADA do SISTEMA!!!','Contate o Suporte',MB_OK+MB_ICONWARNING);
    Self.Data_Vecto :=date;
  end;
  end;

  if (Self.Data_Vecto<=date ) or (self.Data_Liberado>date)then
  Self.Status :=TStatus.Bloqueado else
  self.Status:=TStatus.Liberado;

  result := status=TStatus.Liberado;
end;

end.

