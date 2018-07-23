object usersForm: TusersForm
  Left = 0
  Top = 0
  Caption = #1050#1086#1088#1080#1089#1090#1091#1074#1072#1095#1110
  ClientHeight = 281
  ClientWidth = 418
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 19
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 418
    Height = 35
    ButtonHeight = 35
    ButtonWidth = 33
    Caption = 'ToolBar1'
    Images = DataModule1.ImageList1
    TabOrder = 0
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Hint = #1044#1086#1076#1072#1090#1080
      Caption = 'ToolButton1'
      ImageIndex = 0
      ParentShowHint = False
      ShowHint = True
      OnClick = ToolButton1Click
    end
    object ToolButton3: TToolButton
      Left = 33
      Top = 0
      Hint = #1042#1080#1076#1072#1083#1080#1090#1080
      Caption = 'ToolButton3'
      ImageIndex = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = ToolButton3Click
    end
    object ToolButton2: TToolButton
      Left = 66
      Top = 0
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 1
      Style = tbsSeparator
    end
    object ToolButton4: TToolButton
      Left = 74
      Top = 0
      Width = 22
      Caption = 'ToolButton4'
      ImageIndex = 2
      Style = tbsSeparator
    end
    object ToolButton5: TToolButton
      Left = 96
      Top = 0
      Hint = #1042#1080#1093#1110#1076
      Caption = 'ToolButton5'
      ImageIndex = 4
      ParentShowHint = False
      ShowHint = True
      OnClick = ToolButton5Click
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 35
    Width = 418
    Height = 246
    Align = alClient
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'LOGIN'
        Title.Alignment = taCenter
        Title.Caption = #1050#1086#1088#1080#1089#1090#1091#1074#1072#1095#1110
        Width = 120
        Visible = True
      end>
  end
  object FDQuery1: TFDQuery
    Active = True
    Connection = DataModule1.FDConnection
    Transaction = DataModule1.TrRead
    SQL.Strings = (
      'select * from usersdb where admin_flag<1')
    Left = 352
    Top = 192
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 280
    Top = 128
  end
  object FDQuery2: TFDQuery
    Connection = DataModule1.FDConnection
    Transaction = FDTransaction1
    Left = 352
    Top = 136
  end
  object FDTransaction1: TFDTransaction
    Connection = DataModule1.FDConnection
    Left = 280
    Top = 200
  end
end
