object EduDecriptForm: TEduDecriptForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'EduDecriptForm'
  ClientHeight = 225
  ClientWidth = 190
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbTypeEdu: TLabel
    Left = 16
    Top = 8
    Width = 69
    Height = 13
    Caption = #1058#1080#1087' '#1085#1072#1074#1095#1072#1085#1085#1103
  end
  object lbSchool: TLabel
    Left = 16
    Top = 69
    Width = 100
    Height = 13
    Caption = #1053#1072#1074#1095#1072#1083#1100#1085#1080#1081' '#1079#1072#1082#1083#1072#1076
  end
  object lbDateFrom: TLabel
    Left = 16
    Top = 122
    Width = 97
    Height = 13
    Caption = #1044#1072#1090#1072' '#1085#1072#1074#1095#1072#1085#1085#1103' '#1079'...'
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 16
    Top = 32
    Width = 156
    Height = 21
    DataField = 'ID_TYPE_EDU'
    DataSource = DBForm.dsEDU
    KeyField = 'ID'
    ListField = 'EDU_TYPE'
    ListSource = DataSource1
    TabOrder = 0
  end
  object DBLookupComboBox2: TDBLookupComboBox
    Left = 16
    Top = 90
    Width = 156
    Height = 21
    DataField = 'ID_SCHOOL'
    DataSource = DBForm.dsEDU
    KeyField = 'ID'
    ListField = 'SCHOOL_NAME'
    ListSource = DataSource2
    TabOrder = 1
  end
  object DateTimePicker1: TDateTimePicker
    Left = 16
    Top = 141
    Width = 156
    Height = 21
    Date = 43280.607473136570000000
    Time = 43280.607473136570000000
    TabOrder = 2
    OnChange = DateTimePicker1Change
  end
  object DBEdit1: TDBEdit
    Left = 178
    Top = 157
    Width = 121
    Height = 21
    DataField = 'DATE_FROM'
    DataSource = DBForm.dsEDU
    TabOrder = 3
    Visible = False
  end
  object BitBtn1: TBitBtn
    Left = 16
    Top = 184
    Width = 75
    Height = 25
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 4
  end
  object BitBtn2: TBitBtn
    Left = 97
    Top = 184
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 5
  end
  object FDQuery1: TFDQuery
    Active = True
    Connection = DataModule1.FDConnection
    Transaction = DataModule1.TrRead
    SQL.Strings = (
      'select * from TYPES_EDUCATION')
    Left = 80
    Top = 216
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 152
    Top = 216
  end
  object DataSource2: TDataSource
    DataSet = FDQuery2
    Left = 48
    Top = 216
  end
  object FDQuery2: TFDQuery
    Active = True
    Connection = DataModule1.FDConnection
    Transaction = DataModule1.TrRead
    SQL.Strings = (
      'SELECT * FROM SCHOOLS')
    Left = 8
    Top = 216
  end
end
