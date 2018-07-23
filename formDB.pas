unit formDB;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList,
  Vcl.ComCtrls, Vcl.ToolWin, Data.DB, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Stan.Intf, FireDAC.Stan.Param, FireDAC.Phys.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.UITypes,
  EditEduc, EditReg, LibXL;

type
  TDBForm = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    Splitter1: TSplitter;
    masterGrid: TDBGrid;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    trWrite: TFDTransaction;
    qryMaster: TFDQuery;
    MasterSource: TDataSource;
    qryEdu: TFDQuery;
    dsEDU: TDataSource;
    qryREG: TFDQuery;
    dsREG: TDataSource;
    ActionList1: TActionList;
    actAddChild: TAction;
    actEditChild: TAction;
    actDeleteChild: TAction;
    ToolButton3: TToolButton;
    actRefresh: TAction;
    actAddEdu: TAction;
    actDeleteEdu: TAction;
    actEditEdu: TAction;
    _opg_: TOpenDialog;
    actImportExcel: TAction;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    ExcImp: TFDQuery;
    ToolBar2: TToolBar;
    DBGrid1: TDBGrid;
    Splitter2: TSplitter;
    ToolBar3: TToolBar;
    DBGrid2: TDBGrid;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton17: TToolButton;
    actAddAddress: TAction;
    actEditAddress: TAction;
    actDeleteAddress: TAction;
    trImport: TFDTransaction;
    cmdDelEdu: TFDCommand;
    cmdDelAddress: TFDCommand;
    cmdDelChild: TFDCommand;
    procedure FormActivate(Sender: TObject);
    procedure RefreshDataSet(qry: TFDQuery);
    procedure actAddChildExecute(Sender: TObject);
    procedure AddChildEditorClose(Sender: TObject; var Action: TCloseAction);
    procedure AddressAdditorClose(Sender: TObject; var Action: TCloseAction);
    procedure AddresseditorClose(Sender: TObject; var Action: TCloseAction);
    procedure ShowRegForm(Sender: TObject);
    procedure EditChildEditorClose(Sender: TObject; var Action: TCloseAction);
    procedure actEditChildExecute(Sender: TObject);
    procedure actDeleteChildExecute(Sender: TObject);
    procedure DeleteAddress(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure ShowEditRegForm(Sender: TObject);
    procedure actEditEduExecute(Sender: TObject);
    procedure ShowAddEduForm(Sender: TObject);
    procedure EduAdditorClose(Sender: TObject; var Action: TCloseAction);
    procedure ShowEditEduForm(Sender: TObject);
    procedure EduEditorClose(Sender: TObject; var Action: TCloseAction);
    procedure DeleteEdu(Sender: TObject);
    procedure _read_file(filename: string);
    procedure ToolButton15Click(Sender: TObject);
    procedure ToolButton9Click(Sender: TObject);
    procedure ToolButton10Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DBForm: TDBForm;
  xAddEduForm: TEditEdu;
  xEditEduForm: TeditEdu;
  xEditRegForm: TEditAddress;

implementation

{$R *.dfm}

uses DModule, Main, Add, DateUtils;

procedure TDBForm.ToolButton15Click(Sender: TObject);
Var
sFls:String;
begin
    If _opg_.Execute() then
      Begin
        sFls := _opg_.filename;
//       _opg_.Free;
       _read_file(sFls);
      End
    Else
//    _opg_.Free;
end;

procedure TDBForm._read_file(filename: string);
var
  LastRow, i, k, st, Ch_Id, SchoolsID, Id_Ed : integer;
  fL: TStringList;
  sn, fn, sGn, ln: String;
  pFilename:Pansichar;
  bD:tDate;
  Book: TBook;
  Sheet: TSheet;
  kc: celltype;
begin

  Book := TBinBook.Create;
  book.setKey('Yuri Komarov', 'windows-2f212f080fceeb086db46562acrbgct2');
  pfileName := PAnsiChar(AnsiString(filename));
  Book.load( pfileName );
  Sheet := Book.getSheet(0);
  LastRow :=  Sheet.lastRow;
  trImport.StartTransaction;     // �������� ����������
  fL := TStringList.Create;     // � ���� ��������� ������ ����� �������� �����
  fL.Delimiter := ',';          //������������� ����������� ��� ���� � �����

  try
     for i := 3 to LastRow do        //�������� ������ � 4-� ������
        begin
        kc :=  Sheet.getCellType(i,1);
        if ( Kc <> CELLTYPE_EMPTY )and ( kc  <> CELLTYPE_BLANK ) then
        Begin
        sn := '';                 //�������� �������� ����� ��� ������� ������
        fn := '';
        ln := '';
        Bd:=0.0;
        fL.DelimitedText := String(Sheet.readstr(i, 1));     // ��������� ���
        for k := 0 to fL.Count - 1 do         // ��������� ��� �� �����
        Begin
            case k of
              0:
                Begin
                  sn := fL[k];
                End;
              1:
                Begin
                  fn := fL[k];
                End;
              2:
                Begin
                  ln := fL[k];
                End;
            end;
        End;
        kc :=  Sheet.getCellType(i,2);
         case kc of
              CELLTYPE_EMPTY:
                Bd := 0.0;
              CELLTYPE_BLANK:
                Bd := 0.0;
              CELLTYPE_STRING:
                Bd := Strtodate(Sheet.readstr(i, 2));
            else
                Bd := Sheet.readNum(i, 2)
            end;

      if fL.Count > 0 then     //��� �� ���� ���, �� ������ ������
      Begin
        ExcImp.Close();
        ExcImp.SQL.Text :='select id from CHILDREN where SURNAME = :SURNAME  and FIRSTNAME = :FIRSTNAME'+
        ' and LASTNAME = :LASTNAME and BIRTHDAY = :BIRTHDAY';
          ExcImp.ParamByName('SURNAME').AsSTring := sn;
          ExcImp.ParamByName('FIRSTNAME').AsSTring := fn;
          ExcImp.ParamByName('LASTNAME').AsSTring := ln;
          ExcImp.ParamByName('BIRTHDAY').AsDate := bd;
        ExcImp.Open();

        if ExcImp.RecordCount = 0 then         //������ � ���� ������, ��� ��  ������ ���
        Begin
        SGN :=  AnsiUpperCase(Trim(String(Sheet.readstr(i, 4))));
         if SGN = '�' then  st := 1  else st := 0;    //��� �������

          ExcImp.Close();
          ExcImp.SQL.Text :='INSERT INTO CHILDREN ( surname, firstname, lastname, birthday, gender, info )'+
           ' VALUES ( :surname, :firstname, :LASTNAME, :birthday, :gender, :info )  RETURNING ID';
          ExcImp.ParamByName('GENDER').AsInteger := st;                  //���� ��� �������� ��������� ��������� ���������� ������
          ExcImp.ParamByName('SURNAME').AsSTring := sn;
          ExcImp.ParamByName('FIRSTNAME').AsSTring := fn;
          ExcImp.ParamByName('LASTNAME').AsSTring := ln;
          ExcImp.ParamByName('BIRTHDAY').AsDate := bd;
          ExcImp.ParamByName('INFO').AsSTring := String(Sheet.readstr(i, 8));
          ExcImp.Open();                        //�������� ��������� ����������
        End;
        Ch_id :=  ExcImp.Fields[0].Value;

        ExcImp.Close();
        ExcImp.SQL.Text :='select id from ADDRESS where ID_CHILD = :ID_CHILD and ADDRESS = :ADDRESS';
        ExcImp.ParamByName('ID_CHILD').AsInteger := ch_id;
        ExcImp.ParamByName('ADDRESS').AsString := trim(String(Sheet.readstr(i, 3)));
        ExcImp.Open();

        if ExcImp.RecordCount = 0 then         //������ � ���� �������
        Begin

          ExcImp.Close();
          ExcImp.SQL.Text :='INSERT INTO ADDRESS ( ID_CHILD, ADDRESS, YEARS)'+
           ' VALUES ( :ID_CHILD, :address, :YEARS) RETURNING ID';
          ExcImp.ParamByName('ID_CHILD').AsInteger := Ch_id;                  //���� ��� �������� ��������� ��������� ���������� ������
          ExcImp.ParamByName('ADDRESS').AsSTring := trim(String(Sheet.readstr(i, 3)));
          ExcImp.ParamByName('YEARS').AsString :=  trim(inttostr(YearOf(Now)));
          ExcImp.Open();                        //�������� ��������� ����������
          ExcImp.Close();
        End;

        ExcImp.Close();
        ExcImp.SQL.Text :='select id from Schools where upper( zaklad ) = :ZAKLAD';
        ExcImp.ParamByName('ZAKLAD').AsString := AnsiUpperCase(Trim(Sheet.readstr(i, 5)));
        ExcImp.Open();

        if ExcImp.RecordCount = 0 then         //������ � ���� �������
        Begin

          ExcImp.Close();
          ExcImp.SQL.Text :='INSERT INTO SCHOOLS ( ZAKLAD) VALUES ( :ZAKLAD) RETURNING ID';
          ExcImp.ParamByName('ZAKLAD').AsString := Trim(Sheet.readstr(i, 5));     //���� ��� �������� ��������� ��������� ���������� ������
          ExcImp.Open();
          SchoolsID := ExcImp.FieldByName('ID').Value;                       //�������� ��������� ����������;
          ExcImp.Close();

        End
        Else  SchoolsID :=  ExcImp.Fields[0].Value;

        ExcImp.Close();
        ExcImp.SQL.Text :='select id from EDUCATION where ID_CHILD = :ID_CHILD and YEARS = :YEARS';
        ExcImp.ParamByName('ID_CHILD').AsInteger := ch_id;
        ExcImp.ParamByName('YEARS').AsString := trim(inttostr(YearOf(Now)));
        ExcImp.Open();

        if ExcImp.RecordCount = 0 then  //������ � ���� �������
          Begin
           ExcImp.Close;
           ExcImp.SQL.Text :='INSERT INTO EDUCATION ( ID_CHILD, ID_ZAKLAD, CLASSNUM, YEARS, ID_SPECIAL)'+
            ' VALUES ( :ID_CHILD, :ID_ZAKLAD, :CLASSNUM, :YEARS, :ID_SPECIAL) RETURNING ID';
          End
        else
        begin
        Id_Ed := ExcImp.FieldByName('ID').value;
         ExcImp.Close;
         ExcImp.SQL.Text :='Update EDUCATION set ID_CHILD=:ID_CHILD, ID_ZAKLAD=:ID_ZAKLAD,'+
        ' CLASSNUM=:CLASSNUM, YEARS=:YEARS, ID_SPECIAL=:ID_SPECIAL WHERE ID = :ID_OLD RETURNING ID';
         ExcImp.ParamByName('ID_OLD').AsInteger := Id_Ed;
        end;

        ExcImp.ParamByName('ID_CHILD').AsInteger := ch_id;
        ExcImp.ParamByName('ID_ZAKLAD').AsInteger := SchoolsID;
      End;
      kc :=  Sheet.getCellType(i,6);
        case kc of
          CELLTYPE_EMPTY:
           ExcImp.ParamByName('CLASSNUM').AsInteger := 0;
          CELLTYPE_BLANK:
           ExcImp.ParamByName('CLASSNUM').AsInteger := 0;
          CELLTYPE_NUMBER:
          ExcImp.ParamByName('CLASSNUM').AsInteger :=  Trunc(Sheet.readnum(i, 6));
          CELLTYPE_STRING:
          ExcImp.ParamByName('CLASSNUM').AsInteger := StrToInt(Sheet.readstr(i, 6));
       End;

        ExcImp.ParamByName('YEARS').AsString := trim(inttostr(YearOf(Now)));
        kc :=  Sheet.getCellType(i,7);
        case kc of
          CELLTYPE_EMPTY:
           ExcImp.ParamByName('ID_SPECIAL').AsInteger := 0;
          CELLTYPE_BLANK:
           ExcImp.ParamByName('ID_SPECIAL').AsInteger := 0;
          CELLTYPE_NUMBER:
          ExcImp.ParamByName('ID_SPECIAL').AsInteger :=  Trunc(Sheet.readnum(i, 7));
          CELLTYPE_STRING:
          ExcImp.ParamByName('ID_SPECIAL').AsInteger := StrToInt(Sheet.readstr(i, 7));
        end;
        ExcImp.Open();
        ExcImp.Close();
      End;

    End;
    trImport.Commit;
    qrymaster.Refresh;
    qryedu.Refresh;
    qryreg.Refresh;                                                    //����� ��� ������, ��������� ����������
    Book.Free;
except
  if trImport.Active then                                               //���� ���-�� �� ���, �� ����������
    Begin
       trImport.Rollback;
     End;
end;
End;

procedure TDBForm.RefreshDataSet(qry: TFDQuery);
begin
  if qry.Active then
    qry.Refresh
  else
    qry.Open;
end;

procedure TDBForm.ToolButton10Click(Sender: TObject);
begin
DeleteAddress(self);
end;

procedure TDBForm.ToolButton8Click(Sender: TObject);
begin
    ShowRegForm(self);
end;

procedure TDBForm.ToolButton9Click(Sender: TObject);
begin
ShowEditRegForm(self);
end;

procedure TDBForm.actDeleteChildExecute(Sender: TObject);
begin
  if MessageDlg('�������� �����?', mtConfirmation, [mbYes, mbNo], 0) = mrYes
  then
  begin

    trWrite.StartTransaction;
    try
      cmdDelChild.ParamByName('ID_OLD').AsInteger :=
      qryMaster.FieldByName('ID').AsInteger;
      cmdDelChild.Execute;
      trWrite.Commit;
      qryMaster.Refresh;
      qryEdu.Refresh;
      qryReg.Refresh;


    except
      on E: Exception do
      begin
        if trWrite.Active then
          trWrite.Rollback;
        Application.ShowException(E);
      end;
    end;
  end;
end;


procedure TDBForm.DeleteEdu(Sender: TObject);
begin
  if MessageDlg('�������� �����?', mtConfirmation, [mbYes, mbNo], 0) = mrYes
  then
  begin

    trWrite.StartTransaction;
    try
      cmdDelEdu.ParamByName('ID').AsInteger :=
        qryEdu.FieldByName('ID').AsInteger;
      cmdDelEdu.Execute;
      trWrite.Commit;
      qryEdu.Refresh;

      except
      on E: Exception do
      begin
        if trWrite.Active then
          trWrite.Rollback;
        Application.ShowException(E);
      end;
    end;
  end;
end;

procedure TDBForm.DeleteAddress(Sender: TObject);
begin
  if MessageDlg('�������� �����?', mtConfirmation, [mbYes, mbNo], 0) = mrYes
  then
  begin

    trWrite.StartTransaction;
    try

      cmdDelAddress.ParamByName('ID').AsInteger :=
        qryReg.FieldByName('ID').AsInteger;
      cmdDelAddress.Execute;
      trWrite.Commit;
      qryReg.Refresh;
    except
      on E: Exception do
      begin
        if trWrite.Active then
          trWrite.Rollback;
        Application.ShowException(E);
      end;
    end;
  end;
end;

procedure TDBForm.ShowAddEduForm(Sender: TObject);
begin


  xAddEduForm := TEditEdu.Create(self);
  try
    xAddEduForm.OnClose := EduAdditorClose;
    xAddEduForm.Caption := '������ ���������� ������';

    xAddEduForm.DBLookupComboBox1.KeyValue := qryEdu.FieldByName('ID_SPECIAL').value;
    xAddEduForm.DBLookupComboBox2.KeyValue := qryEdu.FieldByName('ID_ZAKLAD').value;
    xAddEduForm.edNumClass.text := qryEdu.FieldByName('Classnum').Value;
    xAddEduForm.edYear.Text := IntToStr(YearOf(now));
    xAddEduForm.ShowModal;
  finally
    xAddEduForm.Free;
  end;
end;

procedure TDBForm.ShowRegForm(Sender: TObject);
var
  xEditRegForm: TEditAddress;
begin
  xEditRegForm := TEditAddress.Create(self);
  try
    xEditRegForm.OnClose := AddressAdditorClose;
    xEditRegForm.Caption := '������ ������';
    qryREG.Insert;
    xEditRegForm.ShowModal;
  finally
    xEditRegForm.Free;
  end;
end;

procedure TDBForm.EduAdditorClose(Sender: TObject; var Action: TCloseAction);

begin
  if TEditEdu(Sender).ModalResult <> mrOK then
  begin
    Action := caFree;
    Exit;
  end;

  trImport.StartTransaction;
try
   ExcImp.Close;
   ExcImp.SQL.Text :='INSERT INTO EDUCATION ( ID_CHILD, ID_ZAKLAD, ID_SPECIAL, YEARS, CLASSNUM)'+
          ' VALUES ( :ID_CHILD, :ID_ZAKLAD, :ID_SPECIAL, :YEARS, :CLASSNUM) RETURNING ID';
   ExcImp.ParamByName('ID_CHILD').AsInteger := qryMaster.FieldByName('ID').Value;
   ExcImp.ParamByName('ID_ZAKLAD').AsInteger := xAddEduForm.DBLookupComboBox2.KeyValue;
   ExcImp.ParamByName('ID_SPECIAL').AsInteger := xAddEduForm.DBLookupComboBox1.KeyValue;
   ExcImp.ParamByName('CLASSNUM').AsInteger := StrToInt(xAddEduForm.edNumClass.Text);
   ExcImp.ParamByName('YEARS').AsString := xAddEduForm.edYear.text;                 //���� ��� �������� ��������� ��������� ���������� ������
   ExcImp.Open();
   ExcImp.Close();

   trImport.Commit;
   qryEdu.Refresh;
except
  if trWrite.Active then                                               //���� ���-�� �� ���, �� ����������
    Begin
       trWrite.Rollback;
     End;
     qryEdu.Refresh;
end;
qryEdu.Refresh;
end;

procedure TDBForm.AddressAdditorClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if TEditAddress(Sender).ModalResult <> mrOK then
  begin
    qryREG.Cancel;
    qryREG.CancelUpdates;

    Action := caFree;
    Exit;
  end;

  try

    qryREG.Post;

    trWrite.StartTransaction;
    if (qryREG.ApplyUpdates = 0) then
    begin

      qryREG.CommitUpdates;
      trWrite.Commit;
      qryREG.Refresh;
    end
    else
    begin
      raise Exception.Create(qryREG.RowError.Message);
    end;

    Action := caFree;
  except
    on E: Exception do
    begin
      if trWrite.Active then
        trWrite.Rollback;
      Application.ShowException(E);
      Action := caNone;
    end;
  end;

end;

procedure TDBForm.ShowEditEduForm(Sender: TObject);

begin
  xEditEduForm := TeditEdu.Create(self);
  try
    xEditEduForm.OnClose := EduEditorClose;
    xEditEduForm.Caption := '���������� ���������� ������';

    xEditEduForm.DBLookupComboBox1.KeyValue := qryEdu.FieldByName('ID_SPECIAL').value;
    xEditEduForm.DBLookupComboBox2.KeyValue := qryEdu.FieldByName('ID_ZAKLAD').value;
    xEditEduForm.edYear.Text := qryEdu.FieldByName('YEARS').value;
    xEditEduForm.edNumClass.text := qryEdu.FieldByName('Classnum').Value;

    qryEdu.Edit;
    xEditEduForm.ShowModal;
  finally
    xEditEduForm.Free;
  end;
end;

procedure TDBForm.ShowEditRegForm(Sender: TObject);
begin
  xEditRegForm := TEditAddress.Create(self);
  try
    xEditRegForm.OnClose := AddresseditorClose;
    xEditRegForm.Caption := '���������� ������';

    qryREG.Edit;
    xEditRegForm.ShowModal;
  finally
    xEditRegForm.Free;
  end;
end;

procedure TDBForm.EduEditorClose(Sender: TObject; var Action: TCloseAction);
begin
  if TEditEdu(Sender).ModalResult <> mrOK then
  begin
    Action := caFree;
    Exit;
  end;

  trImport.StartTransaction;
try
   ExcImp.Close;
   ExcImp.SQL.Text :='UPDATE EDUCATION set ID_ZAKLAD = :ID_ZAKLAD, ID_SPECIAL = :ID_SPECIAL,' +
   ' YEARS = :YEARS, CLASSNUM = :CLASSNUM where ID = :ID_OLD RETURNING ID';
   ExcImp.ParamByName('ID_ZAKLAD').AsInteger := xEditEduForm.DBLookupComboBox2.KeyValue;
   ExcImp.ParamByName('ID_OLD').AsInteger := qryEdu.FieldByName('ID').Value;
   ExcImp.ParamByName('ID_SPECIAL').AsInteger := xEditEduForm.DBLookupComboBox1.KeyValue;
   ExcImp.ParamByName('YEARS').AsString := trim(xEditEduForm.edYear.text);
   ExcImp.ParamByName('CLASSNUM').AsInteger := StrToInt(xEditEduForm.edNumClass.Text);                  //���� ��� �������� ��������� ��������� ���������� ������
   ExcImp.Open();
   ExcImp.Close();

   trImport.Commit;
   qryEdu.Refresh;
except
  if trWrite.Active then                                               //���� ���-�� �� ���, �� ����������
    Begin
       trWrite.Rollback;
     End;
end;
end;

procedure TDBForm.AddresseditorClose(Sender: TObject; var Action: TCloseAction);
begin
  if TEditAddress(Sender).ModalResult <> mrOK then
  begin
    qryREG.Cancel;
    qryREG.CancelUpdates;

    Action := caFree;
    Exit;
  end;

  try

    qryREG.Post;

    trWrite.StartTransaction;
    if (qryREG.ApplyUpdates = 0) then
    begin

      qryREG.CommitUpdates;
      trWrite.Commit;
      qryREG.Refresh;
    end
    else
    begin
      raise Exception.Create(qryREG.RowError.Message);
    end;

    Action := caFree;
  except
    on E: Exception do
    begin
      if trWrite.Active then
        trWrite.Rollback;
      Application.ShowException(E);
      Action := caNone;
    end;
  end;

end;

procedure TDBForm.actEditChildExecute(Sender: TObject);
var
  xAddForm: TAddForm;
begin
  xAddForm := TAddForm.Create(self);
  try
      xAddForm.OnClose := EditChildEditorClose;
    xAddForm.Caption := '����������� ������';
    xAddForm.SetDataChild(qryMaster.FieldByName('SURNAME').AsSTring,
      qryMaster.FieldByName('FIRSTNAME').AsSTring,
      qryMaster.FieldByName('LASTNAME').AsSTring,
      qryMaster.FieldByName('INFO').AsSTring,
      qryMaster.FieldByName('BIRTHDAY').AsDateTime,
      qryMaster.FieldByName('GENDER').AsInteger);

    xAddForm.ShowModal;
  finally
    xAddForm.Free;
  end;
end;

procedure TDBForm.actEditEduExecute(Sender: TObject);
begin
ShowEditEduForm(self);

end;

procedure TDBForm.actRefreshExecute(Sender: TObject);
begin
  qryMaster.Refresh;
  QryEdu.Refresh;
  qryReg.Refresh;
  close;

end;

procedure TDBForm.EditChildEditorClose(Sender: TObject;
  var Action: TCloseAction);
var
  xAddForm: TAddForm;
begin
  xAddForm := TAddForm(Sender);

  if xAddForm.ModalResult <> mrOK then
  begin
    Action := caFree;
    Exit;
  end;

  trImport.StartTransaction;
  try

   ExcImp.Close();
          ExcImp.SQL.Text :='UPDATE CHILDREN Set surname = :SURNAME, firstname = :firstname, '+
          'lastname = :lastname, birthday = :birthday, gender = :gender, INFO = :INFO'+
          ' where id = :Id_old Returning Id';
          ExcImp.ParamByName('GENDER').AsInteger := xAddForm.ComboBox1.ItemIndex;                  //���� ��� �������� ��������� ��������� ���������� ������
          ExcImp.ParamByName('SURNAME').AsSTring := xAddForm.edtSurname.text;
          ExcImp.ParamByName('FIRSTNAME').AsSTring := xAddForm.edtFirstname.text;
          ExcImp.ParamByName('LASTNAME').AsSTring := xAddForm.edtLastname.text;
          ExcImp.ParamByName('BIRTHDAY').AsDate := xAddForm.DateTimePicker1.Date;
          ExcImp.ParamByName('INFO').AsSTring := xAddForm.edtPrimitka.Text;
          ExcImp.ParamByName('ID_OLD').AsString := qryMaster.FieldByName('ID').Value;

    ExcImp.open;

    trImport.Commit;

    qryMaster.Refresh;

    Action := caFree;
  except
    on E: Exception do
    begin
      if trWrite.Active then
        trWrite.Rollback;
      Application.ShowException(E);
      Action := caNone;
    end;
  end;
end;

procedure TDBForm.actAddChildExecute(Sender: TObject);
var
  xAddForm: TAddForm;
begin
  xAddForm := TAddForm.Create(self);
  try
    xAddForm.Caption := '������ �����';
    xAddForm.OnClose := AddChildEditorClose;
    xAddForm.ShowModal;
  finally
    xAddForm.Free;
  end;
end;

procedure TDBForm.AddChildEditorClose(Sender: TObject;
  var Action: TCloseAction);
var
  xAddForm: TAddForm;

begin
  xAddForm := TAddForm(Sender);

  if xAddForm.ModalResult <> mrOK then
  begin
    Action := caFree;
    Exit;
  end;

  trImport.StartTransaction;
  try
    ExcImp.Close();
          ExcImp.SQL.Text :='INSERT INTO CHILDREN ( surname, firstname, lastname, birthday, gender, info)'+
           ' VALUES ( :surname, :firstname, :LASTNAME, :birthday, :gender, :info)  RETURNING ID';
          ExcImp.ParamByName('GENDER').AsInteger := xAddForm.ComboBox1.ItemIndex;                  //���� ��� �������� ��������� ��������� ���������� ������
          ExcImp.ParamByName('SURNAME').AsSTring := xAddForm.edtSurname.text;
          ExcImp.ParamByName('FIRSTNAME').AsSTring := xAddForm.edtFirstname.text;
          ExcImp.ParamByName('LASTNAME').AsSTring := xAddForm.edtLastname.text;
          ExcImp.ParamByName('BIRTHDAY').AsDate := xAddForm.DateTimePicker1.Date;
          ExcImp.ParamByName('INFO').AsSTring :=  xAddForm.edtPrimitka.text;

    ExcImp.open;

    trImport.Commit;
    qryMaster.Refresh;

    Action := caFree;
  except
    on E: Exception do
    begin
      if trWrite.Active then
        trWrite.Rollback;
      Application.ShowException(E);
      Action := caNone;
    end;
  end;
end;

procedure TDBForm.FormActivate(Sender: TObject);
begin
  qryMaster.Open;
  qryEdu.Open;
  qryREG.Open;

end;

end.
