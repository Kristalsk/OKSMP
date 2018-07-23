object editZaklForm: TeditZaklForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1056#1077#1076#1072#1075#1091#1074#1072#1085#1085#1103' '#1085#1072#1074#1095#1072#1083#1100#1085#1086#1075#1086' '#1079#1072#1082#1083#1072#1076#1091
  ClientHeight = 200
  ClientWidth = 342
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
  object lbZakladName: TLabel
    Left = 8
    Top = 9
    Width = 142
    Height = 19
    Caption = #1053#1072#1074#1095#1072#1083#1100#1085#1080#1081' '#1079#1072#1082#1083#1072#1076
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbTypeEdu: TLabel
    Left = 8
    Top = 72
    Width = 71
    Height = 19
    Caption = #1050#1072#1090#1077#1075#1086#1088#1110#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object cmbTypeEdu: TDBLookupComboBox
    Left = 8
    Top = 97
    Width = 323
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    KeyField = 'ID'
    ListField = 'TYPE_EDU'
    ListSource = DataSource1
    ParentFont = False
    TabOrder = 0
  end
  object edZaklad: TEdit
    Left = 8
    Top = 34
    Width = 323
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Text = 'edZaklad'
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 145
    Width = 323
    Height = 33
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 2
  end
  object FDQuery1: TFDQuery
    Active = True
    Connection = DataModule1.FDConnection
    Transaction = DataModule1.TrRead
    SQL.Strings = (
      'select * from types_education')
    Left = 152
    Top = 240
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 104
    Top = 240
  end
end
