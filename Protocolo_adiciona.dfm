object Form1: TForm1
  Left = 192
  Top = 124
  Width = 928
  Height = 558
  Caption = 'Salva e Adiciona Protocolo V2'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 200
    Top = 96
    Width = 39
    Height = 13
    Caption = 'Destino:'
  end
  object Label2: TLabel
    Left = 256
    Top = 432
    Width = 400
    Height = 65
    Caption = 
      'UTILITARIO PARA EXPORTAR PROTOCOLOS DE NOTAS AUTORIZADAS NFCE'#13#10#13 +
      #10'LEMBRETE PRA MIM: ADICIONAR FILTRO PARA DATA, POIS EST'#193' '#13#10'DENTR' +
      'O DA QUERY'#13#10'COMO PERIODO FIXO'
  end
  object Button1: TButton
    Left = 24
    Top = 8
    Width = 145
    Height = 65
    Caption = 'Gera Lista Protocolos Salvos'
    TabOrder = 0
    OnClick = Button1Click
  end
  object DBGrid1: TDBGrid
    Left = 24
    Top = 160
    Width = 409
    Height = 217
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object BitBtn1: TBitBtn
    Left = 24
    Top = 80
    Width = 145
    Height = 65
    Caption = 'Exporta Lista de Protocolos'
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object Button2: TButton
    Left = 688
    Top = 72
    Width = 145
    Height = 65
    Caption = 'Atualiza Banco'
    TabOrder = 3
    OnClick = Button2Click
  end
  object btnConectar: TBitBtn
    Left = 24
    Top = 424
    Width = 177
    Height = 41
    Caption = 'Conectar'
    TabOrder = 4
    OnClick = btnConectarClick
    Kind = bkOK
  end
  object edBancoNome: TEdit
    Left = 24
    Top = 384
    Width = 289
    Height = 21
    TabOrder = 5
    Text = 'localhost:C:\Syspdv\syspdv_srv.fdb'
  end
  object edProtocoloNome: TEdit
    Left = 200
    Top = 120
    Width = 185
    Height = 21
    TabOrder = 6
    Text = 'protocolo.txt'
  end
  object btnDesconectar: TBitBtn
    Left = 24
    Top = 472
    Width = 177
    Height = 41
    Caption = 'Desconectar'
    Enabled = False
    TabOrder = 7
    OnClick = btnDesconectarClick
    Kind = bkCancel
  end
  object Button3: TButton
    Left = 336
    Top = 384
    Width = 49
    Height = 33
    Caption = '...'
    TabOrder = 8
    OnClick = Button3Click
  end
  object Button5: TButton
    Left = 512
    Top = 72
    Width = 137
    Height = 65
    Caption = 'Importa  Texto'
    TabOrder = 9
    OnClick = Button5Click
  end
  object edProtocoloOrigem: TEdit
    Left = 512
    Top = 160
    Width = 185
    Height = 21
    TabOrder = 10
    Text = 'protocolo.txt'
  end
  object Button6: TButton
    Left = 712
    Top = 160
    Width = 49
    Height = 33
    Caption = '...'
    TabOrder = 11
    OnClick = Button3Click
  end
  object Memo1: TMemo
    Left = 512
    Top = 208
    Width = 361
    Height = 169
    ScrollBars = ssBoth
    TabOrder = 12
  end
  object dtpInicial: TDateTimePicker
    Left = 192
    Top = 16
    Width = 186
    Height = 21
    Date = 42670.547580243050000000
    Time = 42670.547580243050000000
    TabOrder = 13
  end
  object dtpFinal: TDateTimePicker
    Left = 192
    Top = 56
    Width = 186
    Height = 21
    Date = 42670.548698645830000000
    Time = 42670.548698645830000000
    TabOrder = 14
  end
  object IBDatabase1: TIBDatabase
    DatabaseName = 'localhost:C:\Syspdv\syspdv_srv.fdb'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    Left = 712
    Top = 8
  end
  object IBQuery1: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      
        'select trnseq,cxanum,trndat,trnnfcechvnfe,trnnfcenumprot from tr' +
        'ansacao'
      'where trndat>='#39'03/21/2016'#39' and trndat<='#39'03/31/2016'#39
      'and (trnnfcechvnfe is not null and trnnfcechvnfe<>'#39#39')'
      'and (trnnfcenumprot is not null and trnnfcenumprot<>'#39#39')')
    Left = 760
    Top = 8
    object IBQuery1TRNSEQ: TIBStringField
      FieldName = 'TRNSEQ'
      Origin = '"TRANSACAO"."TRNSEQ"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 6
    end
    object IBQuery1CXANUM: TIBStringField
      FieldName = 'CXANUM'
      Origin = '"TRANSACAO"."CXANUM"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 3
    end
    object IBQuery1TRNDAT: TDateTimeField
      FieldName = 'TRNDAT'
      Origin = '"TRANSACAO"."TRNDAT"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBQuery1TRNNFCECHVNFE: TIBStringField
      FieldName = 'TRNNFCECHVNFE'
      Origin = '"TRANSACAO"."TRNNFCECHVNFE"'
      Size = 50
    end
    object IBQuery1TRNNFCENUMPROT: TIBStringField
      FieldName = 'TRNNFCENUMPROT'
      Origin = '"TRANSACAO"."TRNNFCENUMPROT"'
    end
  end
  object IBTransaction1: TIBTransaction
    DefaultDatabase = IBDatabase1
    Left = 808
    Top = 8
  end
  object DataSource1: TDataSource
    DataSet = IBQuery1
    Left = 856
    Top = 8
  end
  object IBQuery2: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction2
    SQL.Strings = (
      
        'update transacao set trnnfcenumprot=:prot where cxanum=:cxanum a' +
        'nd trnseq=:trnseq and trndat=:trndat')
    Left = 816
    Top = 168
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'prot'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cxanum'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'trnseq'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'trndat'
        ParamType = ptUnknown
      end>
  end
  object IBTransaction2: TIBTransaction
    DefaultDatabase = IBDatabase1
    Left = 864
    Top = 168
  end
  object OpenDialog1: TOpenDialog
    Filter = 'firebird (*.gdb;*.fdb)|*.gdb;*.fdb'
    InitialDir = 'c:\syspdv'
    Left = 648
    Top = 8
  end
  object odProtocolo: TOpenDialog
    Left = 776
    Top = 168
  end
  object IBQuery3: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction3
    SQL.Strings = (
      'update transacao_xmlnota '
      'set trnsta='
      'case'
      '  when trnsta='#39'PE'#39' then '#39'AU'#39
      '  when trnsta='#39'PC'#39' THEN '#39'CA'#39
      '  when trnsta='#39'AU'#39' then '#39'AU'#39
      '  when trnsta='#39'CA'#39' then '#39'CA'#39
      'end'
      'where cxanum=:cxanum and trnseq=:trnseq and trndat=:trndat'
      'and (trnsta<>'#39'PC'#39' or trnsta<>'#39'CA'#39')')
    Left = 736
    Top = 392
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cxanum'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'trnseq'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'trndat'
        ParamType = ptUnknown
      end>
  end
  object IBTransaction3: TIBTransaction
    DefaultDatabase = IBDatabase1
    Left = 792
    Top = 392
  end
end
