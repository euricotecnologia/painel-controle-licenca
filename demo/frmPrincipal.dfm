object uPrincipal: TuPrincipal
  Left = 0
  Top = 0
  Caption = 'uPrincipal'
  ClientHeight = 794
  ClientWidth = 1199
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 745
    Width = 1199
    Height = 49
    Align = alBottom
    BevelOuter = bvNone
    Color = 9986560
    ParentBackground = False
    TabOrder = 0
    ExplicitLeft = 152
    ExplicitTop = 296
    ExplicitWidth = 561
    object lblCNPJ: TLabel
      Left = 144
      Top = 16
      Width = 35
      Height = 13
      Caption = 'lblCNPJ'
    end
    object label11: TLabel
      Left = 424
      Top = 16
      Width = 34
      Height = 13
      Caption = 'label11'
    end
    object LdataVenc: TLabel
      Left = 720
      Top = 24
      Width = 50
      Height = 13
      Caption = 'LdataVenc'
    end
  end
  object Button1: TButton
    Left = 1000
    Top = 40
    Width = 169
    Height = 41
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
  object LockClient1: TLockClient
    Status = Liberado
    ID_Sitema = 35
    ID_Cliente = 0
    BloquearChave_data_menor = False
    Left = 648
    Top = 656
  end
  object Conn_servidor: TUniConnection
    ProviderName = 'MySQL'
    LoginPrompt = False
    BeforeConnect = Conn_servidorBeforeConnect
    Left = 80
    Top = 663
  end
  object SQL_Con_Liberacao: TUniQuery
    Connection = Conn_servidor
    SQL.Strings = (
      'select * from clientes where clientes.cnpj=:cnpj')
    Left = 192
    Top = 655
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cnpj'
        Value = nil
      end>
    object SQL_Con_Liberacaoid: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
    end
    object SQL_Con_Liberacaonome_razao: TStringField
      FieldName = 'nome_razao'
      Required = True
      Size = 100
    end
    object SQL_Con_Liberacaonome_fantasia: TStringField
      FieldName = 'nome_fantasia'
      Required = True
      Size = 100
    end
    object SQL_Con_Liberacaocnpj: TStringField
      FieldName = 'cnpj'
      Required = True
    end
    object SQL_Con_Liberacaoendereco: TStringField
      FieldName = 'endereco'
      Required = True
      Size = 100
    end
    object SQL_Con_Liberacaocomplemento: TStringField
      FieldName = 'complemento'
      Required = True
      Size = 50
    end
    object SQL_Con_Liberacaobairro: TStringField
      FieldName = 'bairro'
      Required = True
      Size = 100
    end
    object SQL_Con_Liberacaonumero: TStringField
      FieldName = 'numero'
      Required = True
      Size = 10
    end
    object SQL_Con_Liberacaomunicipio: TStringField
      FieldName = 'municipio'
      Required = True
    end
    object SQL_Con_Liberacaoestado: TStringField
      FieldName = 'estado'
      Required = True
      Size = 50
    end
    object SQL_Con_Liberacaotelefone: TStringField
      FieldName = 'telefone'
      Required = True
    end
    object SQL_Con_Liberacaoemail: TStringField
      FieldName = 'email'
      Required = True
      Size = 100
    end
    object SQL_Con_Liberacaoregime: TStringField
      FieldName = 'regime'
      Required = True
      Size = 100
    end
    object SQL_Con_Liberacaostatus: TIntegerField
      FieldName = 'status'
      Required = True
    end
    object SQL_Con_Liberacaodata_limite_liberacao: TDateField
      FieldName = 'data_limite_liberacao'
      Required = True
    end
    object SQL_Con_Liberacaolimita_nota: TIntegerField
      FieldName = 'limita_nota'
    end
    object SQL_Con_Liberacaolimita_nota_qtde: TIntegerField
      FieldName = 'limita_nota_qtde'
    end
    object SQL_Con_Liberacaocnpj_revenda: TStringField
      FieldName = 'cnpj_revenda'
      Required = True
    end
    object SQL_Con_Liberacaoultimo_acesso: TDateField
      FieldName = 'ultimo_acesso'
    end
    object SQL_Con_Liberacaoultimo_acesso_hora: TTimeField
      FieldName = 'ultimo_acesso_hora'
    end
    object SQL_Con_Liberacaoin_estadual: TStringField
      FieldName = 'in_estadual'
      Required = True
    end
    object SQL_Con_Liberacaovalidacao: TStringField
      FieldName = 'validacao'
      Size = 100
    end
  end
  object SQL_Con_Maquina: TUniQuery
    Connection = Conn_servidor
    SQL.Strings = (
      'select * from terminais where nomePC =:nome and'
      'cnpj =:cnpj')
    Left = 320
    Top = 655
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nome'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'cnpj'
        Value = nil
      end>
    object SQL_Con_Maquinacodigo: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'codigo'
    end
    object SQL_Con_Maquinaterminal: TStringField
      FieldName = 'terminal'
      Required = True
      Size = 3
    end
    object SQL_Con_Maquinaip: TStringField
      FieldName = 'ip'
      Required = True
    end
    object SQL_Con_MaquinanomePC: TStringField
      FieldName = 'nomePC'
      Required = True
      Size = 40
    end
    object SQL_Con_Maquinacnpj: TStringField
      FieldName = 'cnpj'
      Required = True
      Size = 14
    end
    object SQL_Con_Maquinadata: TDateTimeField
      FieldName = 'data'
    end
    object SQL_Con_Maquinadataalt: TDateTimeField
      FieldName = 'dataalt'
    end
    object SQL_Con_Maquinastatus: TIntegerField
      FieldName = 'status'
      Required = True
    end
    object SQL_Con_Maquinaid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object SQL_Con_Maquinamaquina: TStringField
      FieldName = 'maquina'
      Required = True
      Size = 50
    end
  end
  object SQL_Con_Aux: TUniQuery
    Connection = Conn_servidor
    SQL.Strings = (
      'select * from terminais where id =:id and status = 1')
    Left = 440
    Top = 655
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        Value = nil
      end>
    object SQL_Con_Auxcodigo: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'codigo'
    end
    object SQL_Con_Auxterminal: TStringField
      FieldName = 'terminal'
      Required = True
      Size = 3
    end
    object SQL_Con_Auxip: TStringField
      FieldName = 'ip'
      Required = True
    end
    object SQL_Con_AuxnomePC: TStringField
      FieldName = 'nomePC'
      Required = True
      Size = 40
    end
    object SQL_Con_Auxcnpj: TStringField
      FieldName = 'cnpj'
      Required = True
      Size = 14
    end
    object SQL_Con_Auxdata: TDateTimeField
      FieldName = 'data'
    end
    object SQL_Con_Auxdataalt: TDateTimeField
      FieldName = 'dataalt'
    end
    object SQL_Con_Auxstatus: TIntegerField
      FieldName = 'status'
      Required = True
    end
    object SQL_Con_Auxid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object SQL_Con_Auxmaquina: TStringField
      FieldName = 'maquina'
      Required = True
      Size = 50
    end
  end
  object MySQLUniProvider1: TMySQLUniProvider
    Left = 544
    Top = 663
  end
  object conexao: TUniConnection
    ProviderName = 'InterBase'
    Database = 'BANCO.FDB'
    Username = 'SYSDBA'
    Server = 'localhost'
    Connected = False
    LoginPrompt = False
    Left = 32
    Top = 40
  end
  object qrEmpresa: TUniQuery
    Connection = conexao
    SQL.Strings = (
      'select * from empresa')
    Active = True
    Left = 104
    Top = 40
    object qrEmpresaCODIGO: TStringField
      FieldName = 'CODIGO'
      Required = True
      Size = 6
    end
    object qrEmpresaRAZAO_SOCIAL: TStringField
      FieldName = 'RAZAO_SOCIAL'
      Size = 100
    end
    object qrEmpresaFANTASIA: TStringField
      FieldName = 'FANTASIA'
      Size = 60
    end
    object qrEmpresaENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 60
    end
    object qrEmpresaCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object qrEmpresaUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object qrEmpresaCEP: TStringField
      FieldName = 'CEP'
      Size = 15
    end
    object qrEmpresaBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 30
    end
    object qrEmpresaTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 25
    end
    object qrEmpresaCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 50
    end
    object qrEmpresaNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 10
    end
    object qrEmpresaCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 25
    end
    object qrEmpresaIE: TStringField
      FieldName = 'IE'
      Size = 14
    end
    object qrEmpresaCNPJ_REVENDA: TStringField
      FieldName = 'CNPJ_REVENDA'
      Size = 25
    end
    object qrEmpresaEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 60
    end
    object qrEmpresaVALIDADE: TStringField
      FieldName = 'VALIDADE'
    end
    object qrEmpresaID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
    end
    object qrEmpresaFILIAL: TStringField
      FieldName = 'FILIAL'
      Size = 50
    end
    object qrEmpresaTERMINAL: TStringField
      FieldName = 'TERMINAL'
      FixedChar = True
      Size = 3
    end
  end
  object InterBaseUniProvider1: TInterBaseUniProvider
    Left = 216
    Top = 40
  end
  object query: TUniQuery
    Connection = conexao
    Left = 328
    Top = 40
  end
end
