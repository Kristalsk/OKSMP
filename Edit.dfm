object EditForm: TEditForm
  Left = 0
  Top = 0
  Caption = #1056#1077#1076#1072#1075#1091#1074#1072#1085#1085#1103' '#1079#1072#1087#1080#1089#1091
  ClientHeight = 371
  ClientWidth = 407
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
  object lbNumHouseAdd: TLabel
    Left = 224
    Top = 198
    Width = 41
    Height = 13
    Caption = #8470' '#1076#1086#1084#1072
  end
  object lbSchoolAdd: TLabel
    Left = 224
    Top = 256
    Width = 34
    Height = 13
    Caption = #1064#1082#1086#1083#1072
  end
  object lbBirthdayAdd: TLabel
    Left = 8
    Top = 256
    Width = 80
    Height = 13
    Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
  end
  object lbStreetAdd: TLabel
    Left = 8
    Top = 198
    Width = 98
    Height = 13
    Caption = #1040#1076#1088#1077#1089' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080
  end
  object lbLastNameAdd: TLabel
    Left = 8
    Top = 136
    Width = 49
    Height = 13
    Caption = #1054#1090#1095#1077#1089#1090#1074#1086
  end
  object lbFirstNameAdd: TLabel
    Left = 8
    Top = 72
    Width = 23
    Height = 16
    Caption = #1048#1084#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbSurnameAdd: TLabel
    Left = 8
    Top = 8
    Width = 53
    Height = 16
    Caption = #1060#1072#1084#1080#1083#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object TDBLookupComboBox
    Left = 224
    Top = 275
    Width = 145
    Height = 21
    KeyField = 'ID'
    ListField = 'SCHOOL_NAME'
    ListSource = DataSource2
    TabOrder = 0
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 8
    Top = 217
    Width = 145
    Height = 21
    KeyField = 'ID'
    ListField = 'STREET'
    ListSource = DataSource1
    TabOrder = 1
  end
  object DBEdit4: TDBEdit
    Left = 224
    Top = 217
    Width = 81
    Height = 21
    TabOrder = 2
  end
  object DBEdit3: TDBEdit
    Left = 8
    Top = 155
    Width = 187
    Height = 21
    DataField = 'LASTNAME'
    TabOrder = 3
  end
  object DBEdit2: TDBEdit
    Left = 8
    Top = 94
    Width = 187
    Height = 21
    DataField = 'FIRSTNAME'
    TabOrder = 4
  end
  object DBEdit1: TDBEdit
    Left = 8
    Top = 30
    Width = 187
    Height = 21
    Hint = #1042#1074#1077#1076#1110#1090#1100' '#1087#1088#1110#1079#1074#1080#1097#1077
    ParentCustomHint = False
    DataField = 'SURNAME'
    ParentShowHint = False
    ShowHint = False
    TabOrder = 5
  end
  object Button2: TButton
    Left = 112
    Top = 320
    Width = 75
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 6
    OnClick = Button2Click
  end
  object Button1: TButton
    Left = 8
    Top = 320
    Width = 75
    Height = 25
    Caption = #1047#1084#1110#1085#1080#1090#1080
    TabOrder = 7
  end
  object DBEdit5: TDBEdit
    Left = 8
    Top = 275
    Width = 121
    Height = 21
    TabOrder = 8
    Visible = False
  end
  object DateTimePicker1: TDateTimePicker
    Left = 72
    Top = 275
    Width = 186
    Height = 21
    Date = 43207.751646319450000000
    Time = 43207.751646319450000000
    TabOrder = 9
  end
  object FDQuery2: TFDQuery
    SQL.Strings = (
      'select * from SCHOOLS')
    Left = 280
    Top = 88
  end
  object DataSource2: TDataSource
    DataSet = FDQuery2
    Left = 216
    Top = 88
  end
  object FDQuery1: TFDQuery
    SQL.Strings = (
      'select * from STREETS')
    Left = 280
    Top = 16
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 216
    Top = 16
  end
end
