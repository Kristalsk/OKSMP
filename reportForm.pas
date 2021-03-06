unit reportForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Vcl.ComCtrls,
  Vcl.ToolWin, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls,
  Vcl.DBCtrls,ShellAPI, LibXL, inifiles, DateUtils;

type
  TReportF = class(TForm)
    qryCombo: TFDQuery;
    DataSource1: TDataSource;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    qryReport: TFDQuery;
    edit1: TEdit;
    lbNavchRik: TLabel;
    Label1: TLabel;
    procedure ToolButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ReportF: TReportF;


implementation

{$R *.dfm}

uses DModule;



procedure TReportF.FormCreate(Sender: TObject);
begin

edit1.Text := IntToStr(YearOf(now));
end;

procedure TReportF.ToolButton1Click(Sender: TObject);
var
  Book: TBook;
  Sheet: TSheet;
  xAppPath, scells, Years: string;
  pth : pAnsichar;
  xIniFile: TIniFile;
  I,j: Integer;


begin

  years := '����� ������ ���� ������ �� 01.09.'+ trim(Edit1.Text) + ' ����:';
  qryReport.Close;
  qryReport.SQL.Text :=
    'select '+
    'Sum( Case When ch.Birthday <= :Start_D5 and te.id =1 then 1 else 0 end ) as Kol, '+
    'Sum( Case When ch.Birthday <= :Start_D5 and te.id =1 and ch.gender =0 then 1 else 0 end ) as Girls, ' +
    'Sum( Case When ch.Birthday <= :Start_D5 and te.id =1 and sp.id =4 then 1 else 0 end ) as Spec, ' +
    'Sum( Case When ch.Birthday <= :Start_D5 and te.id =1 and ch.gender =0 and sp.id =4 then 1 else 0 end) as SpecG, ' +
    'Sum( Case When ch.Birthday >= :Start_d5 then 1 else 0 end) as fiveold, ' +
    'Sum( Case When ch.Birthday >= :Start_d5 and ch.gender =0 then 1 else 0 end) as fiveoldG, ' +
    'Sum( Case When ch.Birthday >= :Start_d5 and sp.id =4 then 1 else 0 end) as fiveoldSpec, ' +
    'Sum( Case When ch.Birthday >= :Start_d5 and ch.gender =0 and sp.id =4 then 1 else 0 end) as fiveoldSpecG, ' +
    'Sum( Case When ch.Birthday >= :Start_d5 and te.id =2 then 1 else 0 end) as fiveoldSCH, ' +
    'Sum( Case When ch.Birthday >= :Start_d5 and te.id =2 and ch.gender =0 then 1 else 0 end) as fiveoldGSCH, ' +
    'Sum( Case When ch.Birthday >= :Start_d5 and te.id =2 and sp.id =4 then 1 else 0 end) as fiveoldSpecSCH, ' +
    'Sum( Case When ch.Birthday >= :Start_d5 and te.id =2 and ch.gender =0 and sp.id =4 then 1 else 0 end) as fiveoldSpecGSCH, ' +
    'Sum( Case When ch.Birthday <= :Start_D5 and te.id =3 then 1 else 0 end) as PTU, ' +
    'Sum( Case When ch.Birthday <= :Start_D5 and te.id =3 and ch.gender =0 then 1 else 0 end) as PtuG, ' +
    'Sum( Case When ch.Birthday <= :Start_D5 and te.id =3 and sp.id =4 then 1 else 0 end) as PtuSpec, ' +
    'Sum( Case When ch.Birthday <= :Start_D5 and te.id =3 and ch.gender =0 and sp.id =4 then 1 else 0 end) as PtuSpecG, ' +
    'Sum( Case When ch.Birthday <= :Start_D5 and te.id =4 then 1 else 0 end) as VNZ, ' +
    'Sum( Case When ch.Birthday <= :Start_D5 and te.id =4 and ch.gender =0 then 1 else 0 end) as VNZG, ' +
    'Sum( Case When ch.Birthday <= :Start_D5 and te.id =4 and sp.id =4 then 1 else 0 end) as VNZSpec, ' +
    'Sum( Case When ch.Birthday <= :Start_D5 and te.id =4 and ch.gender =0 and sp.id =4 then 1 else 0 end) as VNZSpecG, ' +
    'Sum( Case When ch.Birthday <= :Start_D5 and te.id =0 then 1 else 0 end) as NotEdu, ' +
    'Sum( Case When ch.Birthday <= :Start_D5 and te.id =0 and ch.gender =0 then 1 else 0 end) as NotEduG, ' +
    'Sum( Case When ch.Birthday <= :Start_D5 and te.id =0 and sp.id =4 then 1 else 0 end) as NotEduSpec, ' +
    'Sum( Case When ch.Birthday <= :Start_D5 and te.id =0 and ch.gender =0 and sp.id =4 then 1 else 0 end) as NotEduSpecG ' +
    'from education ed ' +
    'Left outer join Children ch on ch.id = ed.id_child ' +
    'Left outer Join Schools Sc On ed.Id_zaklad = sc.id ' +
    'Left outer Join Types_education te On Sc.id_Type = te.id ' +
    'left outer Join Special Sp on ed.Id_Special = Sp.id ' +
    'where ed.Years = :Years and ch.Birthday BETWEEN :Start_d and :End_d';

  qryReport.ParamByName('End_d').AsDate :=
    EncodeDate(word( Strtoint(trim(Edit1.Text))) - 5, 09, 01);
  qryReport.ParamByName('Start_d5').AsDate :=
    EncodeDate(word(strtoint(trim(Edit1.Text))) - 6, 09, 01);
  qryReport.ParamByName('Start_d').AsDate :=
    EncodeDate(word(strtoint(trim(Edit1.Text))) - 19, 09, 01);
  qryReport.ParamByName('Years').Asstring := trim(Edit1.Text);
  qryReport.open;

  Book := TBinBook.Create;
  Book.setKey('Yuri Komarov', 'windows-2f212f080fceeb086db46562acrbgct2');
  xAppPath := ExtractFileDir(Application.ExeName) + PathDelim;
  Book.load( PAnsiChar(AnsiString(xAppPath + 'Excel\�������\shablon1.xls')));
//  Book.addSheet('111');
  Sheet := Book.getSheet(0);
  xIniFile := TIniFile.Create(xAppPath + 'config.ini');
  sCells:= xIniFile.ReadString('Rekvizits', 'EDRPOU','');

  for j := 1 to scells.Length do  Sheet.writeStr(0,27+j, PAnsiChar(AnsiString(sCells[j])));

    sCells:= xIniFile.ReadString('Rekvizits', 'NazvaOrg','');
    Sheet.writeStr(15, 6, PAnsiChar(AnsiString(sCells)));

    sCells:= xIniFile.ReadString('Rekvizits', 'INDEX','') + ', ' +
    xIniFile.ReadString('Rekvizits', 'OBLAST','')+ ', ' +
    xIniFile.ReadString('Rekvizits', 'GOROD','')+ ', ' +
    xIniFile.ReadString('Rekvizits', 'STREET','')+ ', ' +
    xIniFile.ReadString('Rekvizits', 'NUMHOUSE','');
    Sheet.writeStr(19, 1, PAnsiChar(AnsiString(sCells)));

    sCells:= xIniFile.ReadString('Rekvizits', 'FactINDEX','') + ', ' +
    xIniFile.ReadString('Rekvizits', 'FactOBLAST','')+ ', ' +
    xIniFile.ReadString('Rekvizits', 'FactGOROD','')+ ', ' +
    xIniFile.ReadString('Rekvizits', 'FactSTREET','')+ ', ' +
    xIniFile.ReadString('Rekvizits', 'FactNUMHOUSE','');
    Sheet.writeStr(25, 1, PAnsiChar(AnsiString(sCells)));

    Sheet.writeStr(72, 21, PAnsiChar(AnsiString(xIniFile.ReadString('Rekvizits', 'Director',''))));
    Sheet.writeStr(75, 21, PAnsiChar(AnsiString(xIniFile.ReadString('Rekvizits', 'Vidpovida4',''))));
    Sheet.writeStr(78, 4, PAnsiChar(AnsiString(xIniFile.ReadString('Rekvizits', 'tel',''))));
    Sheet.writeStr(78, 17, PAnsiChar(AnsiString(xIniFile.ReadString('Rekvizits', 'fax',''))));
    Sheet.writeStr(78, 28, PAnsiChar(AnsiString(xIniFile.ReadString('Rekvizits', 'mail',''))));



  xIniFile.Free;
  qryReport.First;

// while not qryReport.Eof do
// Begin
//   case qryReport.FieldByName('Typ').Value of
//   1: Begin
// //     sheet.insertRow(1,42);

      Sheet.writeNum(41,14,qryReport.FieldByName('Kol').Value);
      Sheet.writeNum(41,17,qryReport.FieldByName('Girls').Value);
      Sheet.writeNum(41,26,qryReport.FieldByName('Spec').Value);
      Sheet.writeNum(41,30,qryReport.FieldByName('Specg').Value);

      Sheet.writeNum(36,14,qryReport.FieldByName('fiveold').Value);
      Sheet.writeNum(36,17,qryReport.FieldByName('fiveoldG').Value);
      Sheet.writeNum(36,26,qryReport.FieldByName('fiveoldSpec').Value);
      Sheet.writeNum(36,30,qryReport.FieldByName('fiveoldSpecG').Value);

      Sheet.writeNum(37,14,qryReport.FieldByName('fiveoldSCH').Value);
      Sheet.writeNum(37,17,qryReport.FieldByName('fiveoldGSCH').Value);
      Sheet.writeNum(37,26,qryReport.FieldByName('fiveoldSpecSCH').Value);
      Sheet.writeNum(37,30,qryReport.FieldByName('fiveoldSpecGSCH').Value);

      Sheet.writeNum(44,14,qryReport.FieldByName('PTU').Value);
      Sheet.writeNum(44,17,qryReport.FieldByName('PTUG').Value);
      Sheet.writeNum(44,26,qryReport.FieldByName('PTUSpec').Value);
      Sheet.writeNum(44,30,qryReport.FieldByName('PTUSpecG').Value);

      Sheet.writeNum(45,14,qryReport.FieldByName('VNZ').Value);
      Sheet.writeNum(45,17,qryReport.FieldByName('VNZG').Value);
      Sheet.writeNum(45,26,qryReport.FieldByName('VNZSpec').Value);
      Sheet.writeNum(45,30,qryReport.FieldByName('VNZSpecG').Value);

      Sheet.writeNum(46,14,qryReport.FieldByName('NotEdu').Value);
      Sheet.writeNum(46,17,qryReport.FieldByName('NotEduG').Value);
      Sheet.writeNum(46,26,qryReport.FieldByName('NotEduSpec').Value);
      Sheet.writeNum(46,30,qryReport.FieldByName('NotEduSpecG').Value);

      qryReport.Close;
     qryReport.SQL.Text :=
    'select '+
    'Sum( Case When  (Sp.id =3 or sp.id =4) and te.id = 0 then 1 else 0 end ) as Kol, '+
    'Sum( Case When  (Sp.id =3 or sp.id =4) and te.id = 0 and ch.gender =0 then 1 else 0 end ) as Girls, ' +
    'Sum( Case When  sp.id =4 and te.id = 0 then 1 else 0 end ) as Spec, ' +
    'Sum( Case When  sp.id =4 and te.id = 0 and ch.gender =0 then 1 else 0 end) as SpecG, ' +
    'Sum( Case When  te.id =0 then 1 else 0 end ) as BezPri4, '+
    'Sum( Case When  te.id =0 and ch.gender =0 then 1 else 0 end ) as BezPri4G, ' +
    'Sum( Case When  sp.Id =4 and te.id = 0 then 1 else 0 end ) as BezPri4Spec, ' +
    'Sum( Case When  sp.Id =4 and te.id = 0 and ch.gender =0 then 1 else 0 end) as BezPri4SpecG, ' +
    'Sum( Case When  te.id =6 then 1 else 0 end )  as EduBezOS, ' +
    'Sum( Case When  te.id =6 and ch.gender =0 then 1 else 0 end)  as EduBezOSG, ' +
    'Sum( Case When  sp.id =4 and te.id = 6 then 1 else 0 end ) as EduBezOSSpec, ' +
    'Sum( Case When  sp.id =4 and te.id = 6 and ch.gender =0 then 1 else 0 end ) as EduBezOSSpecG, ' +
    'Sum( Case When  te.id = 7 then 1 else 0 end )  as Spec, ' +
    'Sum( Case When  te.id = 7 and ch.gender =0 then 1 else 0 end)  as SpecG ' +
    'from education ed ' +
    'Left outer join Children ch on ch.id = ed.id_child ' +
    'Left outer Join Schools Sc On ed.Id_zaklad = sc.id ' +
    'Left outer Join Types_education te On Sc.id_Type = te.id ' +
    'left outer Join Special Sp on ed.Id_Special = Sp.id ' +
    'where ed.Years = :Years and (te.id = 0 or te.id = 6 or te.id =7) and ch.Birthday BETWEEN :Start_d and :End_d';

  qryReport.ParamByName('End_d').AsDate :=  EncodeDate(word( Strtoint(trim(Edit1.Text))) - 6, 09, 01);
  qryReport.ParamByName('Start_d').AsDate := EncodeDate(word(strtoint(trim(Edit1.Text))) - 19, 09, 01);
  qryReport.ParamByName('Years').Asstring := trim(Edit1.Text);
  qryReport.open;

      Sheet.writeNum(55,14,qryReport.FieldByName('Kol').Value);
      Sheet.writeNum(55,17,qryReport.FieldByName('Girls').Value);
      Sheet.writeNum(55,26,qryReport.FieldByName('Spec').Value);
      Sheet.writeNum(55,30,qryReport.FieldByName('Specg').Value);

      Sheet.writeNum(56,14,qryReport.FieldByName('BezPri4').Value);
      Sheet.writeNum(56,17,qryReport.FieldByName('BezPri4G').Value);
      Sheet.writeNum(56,26,qryReport.FieldByName('BezPri4Spec').Value);
      Sheet.writeNum(56,30,qryReport.FieldByName('BezPri4SpecG').Value);

      Sheet.writeNum(57,14,qryReport.FieldByName('EduBezOS').Value);
      Sheet.writeNum(57,17,qryReport.FieldByName('EduBezOSG').Value);
      Sheet.writeNum(57,26,qryReport.FieldByName('EduBezOSSpec').Value);
      Sheet.writeNum(57,30,qryReport.FieldByName('EduBezOSSpecG').Value);

      Sheet.writeNum(58,14,qryReport.FieldByName('Spec').Value);
      Sheet.writeNum(58,17,qryReport.FieldByName('SpecG').Value);

     qryReport.Close;
     qryReport.SQL.Text :=
'select '+
   'Sum( iIf(mzaklad is null or sc.id_type<2, 1, 0 )) as Kol, '+
   'Sum( iIf((mzaklad is null or sc.id_type<2) and  ChYear = 6 , 1, 0 )) as old6, '+
   'Sum( iIf((mzaklad is null or sc.id_type<2) and  ChYear in ( 7,8,9) , 1, 0 )) as old7_9, '+
   'Sum( iIf((mzaklad is null or sc.id_type<2) and  ChYear in ( 10,11,12,13,14) , 1, 0 )) as old10_14, '+
   'Sum( iIf((mzaklad is null or sc.id_type<2) and  ChYear = 15 , 1, 0 )) as old15, '+
   'Sum( iIf((mzaklad is null or sc.id_type<2) and  ChYear in (16,17,18) , 1, 0 )) as old16_18, '+
   'Sum( iIf(mclass=4 and scCur.id_type = 0, 1, 0 )) as onlyML, '+
   'Sum( iIf(mclass=4 and scCur.id_type = 0 and  ChYear in ( 7,8,9), 1, 0 )) as onlyML7_9, '+
   'Sum( iIf(mclass=4 and scCur.id_type = 0 and  ChYear in (10,11,12,13,14), 1, 0 )) as onlyML10_14, '+
   'Sum( iIf(mclass=4 and scCur.id_type = 0 and  ChYear = 15 , 1, 0 )) as onlyML15, '+
   'Sum( iIf(mclass=4 and scCur.id_type = 0 and  ChYear in (16,17,18) , 1, 0 )) as onlyML16_18, '+
   'Sum( iIf(mclass=9 and scCur.id_type = 0, 1, 0 )) as onlyOsn, '+
   'Sum( iIf(mclass=9 and scCur.id_type = 0 and  ChYear in (10,11,12,13,14), 1, 0 )) as onlyOsn10_14, '+
   'Sum( iIf(mclass=9 and scCur.id_type = 0 and  ChYear = 15 , 1, 0 )) as onlyOsn15, '+
   'Sum( iIf(mclass=9 and scCur.id_type = 0 and  ChYear in (16,17,18) , 1, 0 )) as onlyOsn16_18, '+
   'Sum( iIf(mclass>0 and mclass<4 and scCur.id_type=0, 1, 0 )) as noMl, '+
   'Sum( iIf(mclass>0 and mclass<4 and scCur.id_type=0 and  ChYear = 6 , 1, 0 )) as noMl6, '+
   'Sum( iIf(mclass>0 and mclass<4 and scCur.id_type=0 and  ChYear in ( 7,8,9) , 1, 0 )) as noMl7_9, '+
   'Sum( iIf(mclass>0 and mclass<4 and scCur.id_type=0 and  ChYear in ( 10,11,12,13,14) , 1, 0 )) as noMl10_14, '+
   'Sum( iIf(mclass>0 and mclass<4 and scCur.id_type=0 and  ChYear = 15 , 1, 0 )) as noMl15, '+
   'Sum( iIf(mclass>0 and mclass<4 and scCur.id_type=0 and  ChYear in (16,17,18) , 1, 0 )) as noMl16_18, '+
   'Sum( iIf(mclass>4 and mclass<9 and scCur.id_type=0, 1, 0 )) as noOsn, '+
   'Sum( iIf(mclass>4 and mclass<9 and scCur.id_type=0 and  ChYear = 6 , 1, 0 )) as noOsn6, '+
   'Sum( iIf(mclass>4 and mclass<9 and scCur.id_type=0 and  ChYear in ( 7,8,9) , 1, 0 )) as noOsn7_9, '+
   'Sum( iIf(mclass>4 and mclass<9 and scCur.id_type=0 and  ChYear in ( 10,11,12,13,14) , 1, 0 )) as noOsn10_14, '+
   'Sum( iIf(mclass>4 and mclass<9 and scCur.id_type=0 and  ChYear = 15 , 1, 0 )) as noOsn15, '+
   'Sum( iIf(mclass>4 and mclass<9 and scCur.id_type=0 and  ChYear in (16,17,18) , 1, 0 )) as noOsn16_18, '+
   'Sum( iIf((mzaklad is null or sc.id_type<2) and gen=0 and  ChYear = 6 , 1, 0 )) as old6g, '+
   'Sum( iIf((mzaklad is null or sc.id_type<2) and gen=0 and  ChYear in ( 7,8,9) , 1, 0 )) as old7_9g, '+
   'Sum( iIf((mzaklad is null or sc.id_type<2) and gen=0 and  ChYear in ( 10,11,12,13,14) , 1, 0 )) as old10_14g, '+
   'Sum( iIf((mzaklad is null or sc.id_type<2) and gen=0 and  ChYear = 15 , 1, 0 )) as old15g, '+
   'Sum( iIf((mzaklad is null or sc.id_type<2) and gen=0 and  ChYear in (16,17,18) , 1, 0 )) as old16_18g '+
   'from (select id as Ch_id, gender as gen, DATEDIFF( YEAR ,birthday,:DatStart ) AS ChYear From children  where DATEDIFF( YEAR ,birthday,:DatStart ) Between 6 and 18 ) ( Ch_id, gen, ChYear ) '+
   'left outer join (select id_child as Ech, max(id_zaklad) as mZaklad, max(classnum) as mClass from education group by id_child ) ( ech, mzaklad, mclass) on Ech =  ch_id '+
   'Left outer Join Schools Sc On mzaklad = sc.id '+
   'left outer join education edCur on edcur.id_child = ch_id and edCur.years = :years '+
   'left outer join schools scCur on scCur.Id = edCur.id_zaklad';

  qryReport.ParamByName('DatStart').AsDate :=  EncodeDate(word( Strtoint(trim(Edit1.Text))), 09, 01);
  qryReport.ParamByName('years').AsString := trim(Edit1.Text);

  qryReport.open;



      Sheet.writeStr(60,14,PAnsiChar(AnsiString('����� ������ ���� ������ �� 01.09.'+ Edit1.text+  ' ����:')));
      Sheet.writeNum(64,14,qryReport.FieldByName('Kol').Value);
      Sheet.writeNum(64,17,qryReport.FieldByName('old6').Value);
      Sheet.writeNum(64,20,qryReport.FieldByName('old7_9').Value);
      Sheet.writeNum(64,24,qryReport.FieldByName('old10_14').Value);
      Sheet.writeNum(64,28,qryReport.FieldByName('old15').Value);
      Sheet.writeNum(64,32,qryReport.FieldByName('old16_18').Value);

      Sheet.writeNum(65,14,qryReport.FieldByName('onlyML').Value);
      Sheet.writeNum(65,20,qryReport.FieldByName('onlyML7_9').Value);
      Sheet.writeNum(65,24,qryReport.FieldByName('onlyML10_14').Value);
      Sheet.writeNum(65,28,qryReport.FieldByName('onlyML15').Value);
      Sheet.writeNum(65,32,qryReport.FieldByName('onlyML16_18').Value);

      Sheet.writeNum(66,14,qryReport.FieldByName('onlyOsn').Value);
      Sheet.writeNum(66,24,qryReport.FieldByName('onlyOsn10_14').Value);
      Sheet.writeNum(66,28,qryReport.FieldByName('onlyOsn15').Value);
      Sheet.writeNum(66,32,qryReport.FieldByName('onlyOsn16_18').Value);

      Sheet.writeNum(67,14,qryReport.FieldByName('NoML').Value);
      Sheet.writeNum(67,17,qryReport.FieldByName('noMl6').Value);
      Sheet.writeNum(67,20,qryReport.FieldByName('noMl7_9').Value);
      Sheet.writeNum(67,24,qryReport.FieldByName('noMl10_14').Value);
      Sheet.writeNum(67,28,qryReport.FieldByName('noMl15').Value);
      Sheet.writeNum(67,32,qryReport.FieldByName('noMl16_18').Value);

      Sheet.writeNum(68,14,qryReport.FieldByName('NoOsn').Value);
      Sheet.writeNum(68,17,qryReport.FieldByName('noOsn6').Value);
      Sheet.writeNum(68,20,qryReport.FieldByName('noOsn7_9').Value);
      Sheet.writeNum(68,24,qryReport.FieldByName('noOsn10_14').Value);
      Sheet.writeNum(68,28,qryReport.FieldByName('noOsn15').Value);
      Sheet.writeNum(68,32,qryReport.FieldByName('noOsn16_18').Value);

      Sheet.writeNum(69,17,qryReport.FieldByName('old6G').Value);
      Sheet.writeNum(69,20,qryReport.FieldByName('old7_9G').Value);
      Sheet.writeNum(69,24,qryReport.FieldByName('old10_14G').Value);
      Sheet.writeNum(69,28,qryReport.FieldByName('old15G').Value);
      Sheet.writeNum(69,32,qryReport.FieldByName('old16_18G').Value);




  pth := PAnsiChar(AnsiString(xAppPath+'Excel\������\report1.xls'));
 Book.save(pth);
 ShellExecute(0, 'open', Pwchar(xAppPath+'Excel\������\report1.xls') , nil, nil, SW_SHOW);
 Book.Free;
end;

end.
