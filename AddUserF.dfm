object addUserForm: TaddUserForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1044#1086#1076#1072#1090#1080' '#1082#1086#1088#1080#1089#1090#1091#1074#1072#1095#1072
  ClientHeight = 254
  ClientWidth = 171
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 19
  object lbLogin: TLabel
    Left = 8
    Top = 24
    Width = 40
    Height = 19
    Alignment = taCenter
    Caption = #1051#1086#1075#1110#1085
  end
  object lbPassword: TLabel
    Left = 8
    Top = 104
    Width = 54
    Height = 19
    Alignment = taCenter
    Caption = #1055#1072#1088#1086#1083#1100
  end
  object edLogin: TEdit
    Left = 8
    Top = 49
    Width = 155
    Height = 27
    TabOrder = 0
  end
  object edPassword: TEdit
    Left = 8
    Top = 129
    Width = 155
    Height = 27
    PasswordChar = '*'
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 176
    Width = 155
    Height = 49
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 2
  end
end
