object AddTypeZaklad: TAddTypeZaklad
  Left = 0
  Top = 0
  Caption = #1058#1080#1087#1080' '#1079#1072#1082#1083#1072#1076#1110#1074
  ClientHeight = 299
  ClientWidth = 635
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
    Width = 635
    Height = 35
    ButtonHeight = 33
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
  object DBGrid1: TDBGrid
    Left = 0
    Top = 35
    Width = 635
    Height = 264
    Align = alClient
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'TYPE_EDU'
        Title.Alignment = taCenter
        Title.Caption = #1058#1080#1087' '#1085#1072#1074#1095#1072#1083#1100#1085#1086#1075#1086' '#1079#1072#1082#1083#1072#1076#1091
        Width = 500
        Visible = True
      end>
  end
  object qryTypeZakl: TFDQuery
    Active = True
    Connection = DataModule1.FDConnection
    Transaction = trTypeZakl
    SQL.Strings = (
      'select * from types_education')
    Left = 456
    Top = 224
  end
  object DataSource1: TDataSource
    DataSet = qryTypeZakl
    Left = 360
    Top = 240
  end
  object trTypeZakl: TFDTransaction
    Options.AutoStop = False
    Connection = DataModule1.FDConnection
    Left = 240
    Top = 232
  end
  object FDQuery2: TFDQuery
    Connection = DataModule1.FDConnection
    Transaction = trTypeZakl
    Left = 544
    Top = 232
  end
end
