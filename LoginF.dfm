﻿object LoginForm: TLoginForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1040#1074#1090#1086#1088#1080#1079#1072#1094#1110#1103
  ClientHeight = 245
  ClientWidth = 221
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Логін: TLabel
    Left = 88
    Top = 23
    Width = 40
    Height = 19
    Alignment = taCenter
    Caption = #1051#1086#1075#1110#1085
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Пароль: TLabel
    Left = 83
    Top = 95
    Width = 54
    Height = 19
    Alignment = taCenter
    Caption = #1055#1072#1088#1086#1083#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 8
    Top = 48
    Width = 201
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 8
    Top = 120
    Width = 201
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 190
    Width = 201
    Height = 37
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 2
  end
  object chbSaveLog: TCheckBox
    Left = 8
    Top = 160
    Width = 137
    Height = 17
    Caption = #1047#1072#1087#1072#1084#39#1103#1090#1072#1090#1080' '#1084#1077#1085#1077
    TabOrder = 3
  end
  object FDQuery1: TFDQuery
    Connection = DataModule1.FDConnection
    Transaction = FDTransaction1
    UpdateTransaction = FDTransaction1
    SQL.Strings = (
      'Select * from usersdb where login = :edLog and password= :edPass')
    Left = 264
    Top = 64
    ParamData = <
      item
        Name = 'EDLOG'
        DataType = ftString
        ParamType = ptInput
        Value = 'superadmin'
      end
      item
        Name = 'EDPASS'
        DataType = ftString
        ParamType = ptInput
        Value = 'superadmin'
      end>
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 264
    Top = 120
  end
  object FDTransaction1: TFDTransaction
    Options.AutoStop = False
    Connection = DataModule1.FDConnection
    Left = 264
    Top = 168
  end
end
