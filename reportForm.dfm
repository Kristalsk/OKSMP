object ReportF: TReportF
  Left = 0
  Top = 0
  Caption = #1047#1074#1110#1090
  ClientHeight = 299
  ClientWidth = 635
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
  object lbNavchRik: TLabel
    Left = 8
    Top = 49
    Width = 245
    Height = 19
    Caption = #1047#1074#1110#1090' 77-'#1056#1042#1050' '#1089#1090#1072#1085#1086#1084' '#1085#1072' 1 '#1074#1077#1088#1077#1089#1085#1103' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 315
    Top = 49
    Width = 34
    Height = 19
    Caption = #1088#1086#1082#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
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
      Hint = #1047#1072#1087#1086#1074#1085#1080#1090#1080' '#1079#1074#1110#1090
      Caption = 'ToolButton1'
      ImageIndex = 6
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
    end
  end
  object edit1: TEdit
    Left = 254
    Top = 41
    Width = 57
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object qryCombo: TFDQuery
    Connection = DataModule1.FDConnection
    Transaction = DataModule1.TrRead
    SQL.Strings = (
      'select distinct years, years as yea from education')
    Left = 576
    Top = 240
  end
  object DataSource1: TDataSource
    DataSet = qryCombo
    Left = 512
    Top = 240
  end
  object qryReport: TFDQuery
    Connection = DataModule1.FDConnection
    Transaction = DataModule1.TrRead
    SQL.Strings = (
      'select '
      '   Sum( iIf(mzaklad is null or sc.id_type<2, 1, 0 )) as Kol,'
      
        '   Sum( iIf((mzaklad is null or sc.id_type<2) and  ChYear = 6 , ' +
        '1, 0 )) as old6,'
      
        '   Sum( iIf((mzaklad is null or sc.id_type<2) and  ChYear in ( 7' +
        ',8,9) , 1, 0 )) as old7_9, '
      
        '   Sum( iIf((mzaklad is null or sc.id_type<2) and  ChYear in ( 1' +
        '0,11,12,13,14) , 1, 0 )) as old10_14, '
      
        '   Sum( iIf((mzaklad is null or sc.id_type<2) and  ChYear = 15 ,' +
        ' 1, 0 )) as old15, '
      
        '   Sum( iIf((mzaklad is null or sc.id_type<2) and  ChYear in (16' +
        ',17,18) , 1, 0 )) as old16_18,'
      '   Sum( iIf(mclass=4 and scCur.id_type = 0, 1, 0 )) as onlyML,'
      
        '   Sum( iIf(mclass=4 and scCur.id_type = 0 and  ChYear in ( 7,8,' +
        '9), 1, 0 )) as onlyML7_9, '
      
        '   Sum( iIf(mclass=4 and scCur.id_type = 0 and  ChYear in (10,11' +
        ',12,13,14), 1, 0 )) as onlyML10_14, '
      
        '   Sum( iIf(mclass=4 and scCur.id_type = 0 and  ChYear = 15 , 1,' +
        ' 0 )) as onlyML15, '
      
        '   Sum( iIf(mclass=4 and scCur.id_type = 0 and  ChYear in (16,17' +
        ',18) , 1, 0 )) as onlyML16_18,'
      '   Sum( iIf(mclass=9 and scCur.id_type = 0, 1, 0 )) as onlyOsn,'
      
        '   Sum( iIf(mclass=9 and scCur.id_type = 0 and  ChYear in (10,11' +
        ',12,13,14), 1, 0 )) as onlyOsn10_14, '
      
        '   Sum( iIf(mclass=9 and scCur.id_type = 0 and  ChYear = 15 , 1,' +
        ' 0 )) as onlyOsn15, '
      
        '   Sum( iIf(mclass=9 and scCur.id_type = 0 and  ChYear in (16,17' +
        ',18) , 1, 0 )) as onlyOsn16_18,'
      
        '   Sum( iIf(mclass>0 and mclass<4 and scCur.id_type=0, 1, 0 )) a' +
        's noMl,'
      
        '   Sum( iIf(mclass>0 and mclass<4 and scCur.id_type=0 and  ChYea' +
        'r = 6 , 1, 0 )) as noMl6,'
      
        '   Sum( iIf(mclass>0 and mclass<4 and scCur.id_type=0 and  ChYea' +
        'r in ( 7,8,9) , 1, 0 )) as noMl7_9, '
      
        '   Sum( iIf(mclass>0 and mclass<4 and scCur.id_type=0 and  ChYea' +
        'r in ( 10,11,12,13,14) , 1, 0 )) as noMl10_14, '
      
        '   Sum( iIf(mclass>0 and mclass<4 and scCur.id_type=0 and  ChYea' +
        'r = 15 , 1, 0 )) as noMl15, '
      
        '   Sum( iIf(mclass>0 and mclass<4 and scCur.id_type=0 and  ChYea' +
        'r in (16,17,18) , 1, 0 )) as noMl16_18,'
      
        '   Sum( iIf(mclass>4 and mclass<9 and scCur.id_type=0, 1, 0 )) a' +
        's noOsn,'
      
        '   Sum( iIf(mclass>4 and mclass<9 and scCur.id_type=0 and  ChYea' +
        'r = 6 , 1, 0 )) as noOsn6,'
      
        '   Sum( iIf(mclass>4 and mclass<9 and scCur.id_type=0 and  ChYea' +
        'r in ( 7,8,9) , 1, 0 )) as noOsn7_9, '
      
        '   Sum( iIf(mclass>4 and mclass<9 and scCur.id_type=0 and  ChYea' +
        'r in ( 10,11,12,13,14) , 1, 0 )) as noOsn10_14, '
      
        '   Sum( iIf(mclass>4 and mclass<9 and scCur.id_type=0 and  ChYea' +
        'r = 15 , 1, 0 )) as noOsn15, '
      
        '   Sum( iIf(mclass>4 and mclass<9 and scCur.id_type=0 and  ChYea' +
        'r in (16,17,18) , 1, 0 )) as noOsn16_18,'
      
        '   Sum( iIf((mzaklad is null or sc.id_type<2) and gen=0, 1, 0 ))' +
        ' as Kol,'
      
        '   Sum( iIf((mzaklad is null or sc.id_type<2) and gen=0 and  ChY' +
        'ear = 6 , 1, 0 )) as old6,'
      
        '   Sum( iIf((mzaklad is null or sc.id_type<2) and gen=0 and  ChY' +
        'ear in ( 7,8,9) , 1, 0 )) as old7_9, '
      
        '   Sum( iIf((mzaklad is null or sc.id_type<2) and gen=0 and  ChY' +
        'ear in ( 10,11,12,13,14) , 1, 0 )) as old10_14, '
      
        '   Sum( iIf((mzaklad is null or sc.id_type<2) and gen=0 and  ChY' +
        'ear = 15 , 1, 0 )) as old15, '
      
        '   Sum( iIf((mzaklad is null or sc.id_type<2) and gen=0 and  ChY' +
        'ear in (16,17,18) , 1, 0 )) as old16_18'
      
        '   from (select id as Ch_id, gender as gen, DATEDIFF( YEAR ,birt' +
        'hday,:DatStart ) AS ChYear From children  where DATEDIFF( YEAR ,' +
        'birthday,:DatStart ) Between 6 and 18 ) ( Ch_id, gen, ChYear )'
      
        '   left outer join (select id_child as Ech, max(id_zaklad) as mZ' +
        'aklad, max(classnum) as mClass from education group by id_child ' +
        ') ( ech, mzaklad, mclass) on Ech =  ch_id'
      '   Left outer Join Schools Sc On mzaklad = sc.id'
      
        '   left outer join education edCur on edcur.id_child = ch_id and' +
        ' edCur.years = :years'
      '   left outer join schools scCur on scCur.Id = edCur.id_zaklad'
      ' '
      ' ')
    Left = 408
    Top = 96
    ParamData = <
      item
        Name = 'DATSTART'
        DataType = ftDate
        ParamType = ptInput
        Value = 43344d
      end
      item
        Name = 'YEARS'
        DataType = ftString
        ParamType = ptInput
        Value = '2018'
      end>
  end
end
