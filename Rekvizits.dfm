object AddRekvizitForm: TAddRekvizitForm
  Left = 0
  Top = 0
  Caption = ' '#1056#1077#1082#1074#1110#1079#1080#1090#1080
  ClientHeight = 537
  ClientWidth = 500
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Visible = True
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 19
  object GroupBox1: TGroupBox
    Left = 0
    Top = 40
    Width = 500
    Height = 217
    Align = alTop
    Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1110#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    object lbEDRPOU: TLabel
      Left = 368
      Top = 23
      Width = 48
      Height = 16
      Caption = #1028#1044#1056#1055#1054#1059
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbNazvaOrg: TLabel
      Left = 10
      Top = 21
      Width = 105
      Height = 16
      Caption = #1053#1072#1079#1074#1072' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1110#1111
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbDirector: TLabel
      Left = 10
      Top = 71
      Width = 51
      Height = 16
      Caption = #1050#1077#1088#1110#1074#1085#1080#1082
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbSubDirector: TLabel
      Left = 10
      Top = 118
      Width = 90
      Height = 16
      Caption = #1042#1110#1076#1087#1086#1074#1110#1076#1072#1083#1100#1085#1080#1081
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbTel: TLabel
      Left = 10
      Top = 167
      Width = 53
      Height = 16
      Caption = #1058#1077#1083#1077#1092#1086#1085
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbFax: TLabel
      Left = 141
      Top = 167
      Width = 29
      Height = 16
      Caption = #1060#1072#1082#1089
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbMail: TLabel
      Left = 285
      Top = 167
      Width = 36
      Height = 16
      Caption = 'E-mail'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edEDRPOU: TEdit
      Left = 368
      Top = 40
      Width = 121
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object edNazvaOrg: TEdit
      Left = 10
      Top = 40
      Width = 324
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object edDirector: TEdit
      Left = 10
      Top = 88
      Width = 324
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object edSubDirector: TEdit
      Left = 10
      Top = 137
      Width = 324
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object edTel: TEdit
      Left = 10
      Top = 185
      Width = 121
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object edFax: TEdit
      Left = 141
      Top = 185
      Width = 121
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object edMail: TEdit
      Left = 285
      Top = 185
      Width = 204
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
  end
  object grbYurAdr: TGroupBox
    Left = 0
    Top = 257
    Width = 500
    Height = 152
    Align = alTop
    Caption = #1070#1088#1080#1076#1080#1095#1085#1072' '#1072#1076#1088#1077#1089#1072
    TabOrder = 0
    object lbZipcode: TLabel
      Left = 10
      Top = 26
      Width = 37
      Height = 16
      Caption = #1030#1085#1076#1077#1082#1089
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbObl: TLabel
      Left = 133
      Top = 26
      Width = 49
      Height = 16
      Caption = #1054#1073#1083#1072#1089#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbGorod: TLabel
      Left = 368
      Top = 26
      Width = 99
      Height = 16
      Caption = #1053#1072#1089#1077#1083#1077#1085#1080#1081' '#1087#1091#1085#1082#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbStreet: TLabel
      Left = 133
      Top = 77
      Width = 129
      Height = 16
      Caption = #1042#1091#1083#1080#1094#1103' ('#1087#1088#1086#1089#1087'. '#1087#1088#1086#1074'.)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbNumHouse: TLabel
      Left = 320
      Top = 76
      Width = 147
      Height = 16
      Caption = #8470' ('#1076#1086#1084', '#1082#1074#1072#1088#1090#1080#1088#1072', '#1086#1092#1110#1089')'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edZipcode: TEdit
      Left = 10
      Top = 43
      Width = 89
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object edObl: TEdit
      Left = 133
      Top = 43
      Width = 201
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object edGorod: TEdit
      Left = 368
      Top = 43
      Width = 125
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object edStreet: TEdit
      Left = 133
      Top = 99
      Width = 149
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object edNimHouse: TEdit
      Left = 320
      Top = 99
      Width = 57
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object cbFizAddress: TCheckBox
      Left = 133
      Top = 129
      Width = 272
      Height = 17
      Caption = #1060#1072#1082#1090#1080#1095#1085#1072' '#1072#1076#1088#1077#1089#1072' '#1079#1073#1110#1075#1072#1108#1090#1100#1089#1103' '#1079' '#1102#1088#1080#1076#1080#1095#1085#1086#1102
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = cbFizAddressClick
    end
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 500
    Height = 40
    ButtonHeight = 33
    ButtonWidth = 33
    Caption = 'ToolBar1'
    Images = DataModule1.ImageList1
    TabOrder = 1
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Hint = #1047#1073#1077#1088#1077#1075#1090#1080' '#1079#1084#1110#1085#1080
      Caption = 'ToolButton1'
      ImageIndex = 7
      ParentShowHint = False
      ShowHint = True
      OnClick = ToolButton1Click
    end
    object ToolButton2: TToolButton
      Left = 33
      Top = 0
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 1
      Style = tbsSeparator
    end
    object ToolButton3: TToolButton
      Left = 41
      Top = 0
      Hint = #1042#1080#1093#1110#1076
      Caption = 'ToolButton3'
      ImageIndex = 4
      ParentShowHint = False
      ShowHint = True
      OnClick = ToolButton3Click
    end
  end
  object grbFactAddress: TGroupBox
    Left = 0
    Top = 409
    Width = 500
    Height = 136
    Align = alTop
    Caption = #1060#1110#1079#1080#1095#1085#1072' '#1072#1076#1088#1077#1089#1072
    TabOrder = 2
    object lbFactINDEX: TLabel
      Left = 8
      Top = 26
      Width = 37
      Height = 16
      Caption = #1030#1085#1076#1077#1082#1089
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbFactOblast: TLabel
      Left = 133
      Top = 26
      Width = 49
      Height = 16
      Caption = #1054#1073#1083#1072#1089#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbFactGorod: TLabel
      Left = 368
      Top = 26
      Width = 99
      Height = 16
      Caption = #1053#1072#1089#1077#1083#1077#1085#1080#1081' '#1087#1091#1085#1082#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbFactStreet: TLabel
      Left = 133
      Top = 73
      Width = 129
      Height = 16
      Caption = #1042#1091#1083#1080#1094#1103' ('#1087#1088#1086#1089#1087'. '#1087#1088#1086#1074'.)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbFactNumhouse: TLabel
      Left = 320
      Top = 72
      Width = 147
      Height = 16
      Caption = #8470' ('#1076#1086#1084', '#1082#1074#1072#1088#1090#1080#1088#1072', '#1086#1092#1110#1089')'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edFactIndex: TEdit
      Left = 8
      Top = 43
      Width = 89
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object edFactOblast: TEdit
      Left = 133
      Top = 43
      Width = 201
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object edFactGorod: TEdit
      Left = 368
      Top = 43
      Width = 125
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object edFactStreet: TEdit
      Left = 133
      Top = 95
      Width = 149
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object edFactNumHouse: TEdit
      Left = 320
      Top = 95
      Width = 57
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
  end
end
