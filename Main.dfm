object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'Osvita DB'
  ClientHeight = 413
  ClientWidth = 784
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object mdiChildrenTabs: TTabSet
    Left = 0
    Top = 0
    Width = 784
    Height = 30
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    SoftTop = True
    Style = tsSoftTabs
    OnChange = mdiChildrenTabsChange
  end
  object MainMenu1: TMainMenu
    Left = 168
    Top = 256
    object mnFile: TMenuItem
      Caption = #1060#1072#1081#1083
      object mnFileDataBase: TMenuItem
        Caption = #1041#1072#1079#1072' '#1076#1072#1085#1085#1080#1093
        OnClick = mnFileDataBaseClick
      end
      object mnFileExit: TMenuItem
        Caption = #1042#1080#1093#1110#1076
        OnClick = mnFileExitClick
      end
    end
    object mnReports: TMenuItem
      Caption = #1047#1074#1110#1090#1080
      object mnReportsView: TMenuItem
        Caption = #1047#1074#1110#1090' 77-'#1056#1042#1050
        OnClick = mnReportsViewClick
      end
    end
    object mnSettings: TMenuItem
      Caption = #1053#1072#1083#1072#1096#1090#1091#1074#1072#1085#1085#1103
      object mnSetItems: TMenuItem
        Caption = #1056#1077#1082#1074#1110#1079#1080#1090#1080' '#1086#1088#1075'-'#1094#1110#1111
        OnClick = mnSetItemsClick
      end
      object mnSetSprav: TMenuItem
        Caption = #1044#1086#1074#1110#1076#1085#1080#1082#1080
        object mnSetSpravSchools: TMenuItem
          Caption = #1053#1072#1074#1095#1072#1083#1100#1085#1110' '#1079#1072#1082#1083#1072#1076#1080
          OnClick = mnSetSpravSchoolsClick
        end
        object mnSetSpravCategEdu: TMenuItem
          Caption = #1057#1087#1077#1094'. '#1091#1084#1086#1074#1080
          OnClick = mnSetSpravCategEduClick
        end
        object mnSetTypeZakl: TMenuItem
          Caption = #1058#1080#1087#1080' '#1079#1072#1082#1083#1072#1076#1110#1074
          OnClick = mnSetTypeZaklClick
        end
      end
      object mnUsers: TMenuItem
        Caption = #1050#1086#1088#1080#1089#1090#1091#1074#1072#1095#1110
        OnClick = mnUsersClick
      end
    end
    object N1: TMenuItem
    end
  end
end
