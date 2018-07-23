object AddForm: TAddForm
  Left = 0
  Top = 0
  ParentCustomHint = False
  BorderStyle = bsDialog
  ClientHeight = 242
  ClientWidth = 611
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbSurnameAdd: TLabel
    Left = 8
    Top = 8
    Width = 69
    Height = 19
    Caption = #1055#1088#1110#1079#1074#1080#1097#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbFirstNameAdd: TLabel
    Left = 208
    Top = 8
    Width = 27
    Height = 19
    Caption = #1030#1084#39#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbLastNameAdd: TLabel
    Left = 409
    Top = 11
    Width = 87
    Height = 19
    Caption = #1055#1086' '#1073#1072#1090#1100#1082#1086#1074#1110
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbBirthdayAdd: TLabel
    Left = 8
    Top = 63
    Width = 130
    Height = 19
    Caption = #1044#1072#1090#1072' '#1085#1072#1088#1086#1076#1078#1077#1085#1085#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbGenderAdd: TLabel
    Left = 8
    Top = 120
    Width = 42
    Height = 19
    Caption = #1057#1090#1072#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 208
    Top = 63
    Width = 67
    Height = 19
    Caption = #1055#1088#1080#1084#1110#1090#1082#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object DateTimePicker1: TDateTimePicker
    Left = 8
    Top = 89
    Width = 187
    Height = 27
    Date = 43261.566488599530000000
    Time = 43261.566488599530000000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object ComboBox1: TComboBox
    Left = 8
    Top = 145
    Width = 121
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Text = #1086#1073#1077#1088#1110#1090#1100' '#1089#1090#1072#1090#1100
    Items.Strings = (
      #1046#1110#1085#1086#1095#1072
      #1063#1086#1083#1086#1074#1110#1095#1072)
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 187
    Width = 588
    Height = 38
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    Kind = bkOK
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 2
  end
  object edtSurname: TEdit
    Left = 8
    Top = 30
    Width = 187
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object edtFirstname: TEdit
    Left = 208
    Top = 30
    Width = 187
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object edtLastname: TEdit
    Left = 409
    Top = 30
    Width = 187
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object edtPrimitka: TEdit
    Left = 208
    Top = 89
    Width = 388
    Height = 83
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    Text = 'edtPrimitka'
  end
end
