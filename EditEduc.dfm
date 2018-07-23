object EditEdu: TEditEdu
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'EditEdu'
  ClientHeight = 270
  ClientWidth = 170
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lbZaklad: TLabel
    Left = 8
    Top = 5
    Width = 51
    Height = 19
    Caption = #1047#1072#1082#1083#1072#1076
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbSpecial: TLabel
    Left = 8
    Top = 144
    Width = 121
    Height = 19
    Caption = #1054#1089#1086#1073#1083#1080#1074#1110'  '#1091#1084#1086#1074#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbYear: TLabel
    Left = 100
    Top = 72
    Width = 21
    Height = 19
    Caption = #1056#1110#1082
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbClassNum: TLabel
    Left = 8
    Top = 72
    Width = 34
    Height = 19
    Caption = #1050#1083#1072#1089
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object edYear: TEdit
    Left = 100
    Top = 97
    Width = 61
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 216
    Width = 154
    Height = 41
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 3
  end
  object DBLookupComboBox2: TDBLookupComboBox
    Left = 8
    Top = 31
    Width = 153
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    KeyField = 'ID'
    ListField = 'ZAKLAD'
    ListSource = DataSource2
    ParentFont = False
    TabOrder = 0
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 8
    Top = 169
    Width = 153
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    KeyField = 'ID'
    ListField = 'INFO'
    ListSource = DataSource1
    ParentFont = False
    TabOrder = 1
  end
  object edNumClass: TEdit
    Left = 8
    Top = 97
    Width = 73
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    Text = 'edNumClass'
  end
  object FDQuery1: TFDQuery
    Active = True
    Connection = DataModule1.FDConnection
    Transaction = DataModule1.TrRead
    SQL.Strings = (
      'SELECT * FROM SPECIAL')
    Left = 256
    Top = 128
  end
  object FDQuery2: TFDQuery
    Active = True
    Connection = DataModule1.FDConnection
    Transaction = DataModule1.TrRead
    SQL.Strings = (
      'SELECT * FROM SCHOOLS')
    Left = 320
    Top = 128
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 256
    Top = 192
  end
  object DataSource2: TDataSource
    DataSet = FDQuery2
    Left = 320
    Top = 192
  end
end
