unit AddZaklad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet, Vcl.Grids, Vcl.DBGrids, editZakl,
  Vcl.ComCtrls, Vcl.ToolWin;

type
  TAddSchoolForm = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    DBGrid1: TDBGrid;
    qryZaklad: TFDQuery;
    DataSource1: TDataSource;
    trZaklad: TFDTransaction;
    FDQuery2: TFDQuery;
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ZaklEditorClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton7Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure confirmClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddSchoolForm: TAddSchoolForm;
  xEditZakl : TEditZaklForm;

implementation

{$R *.dfm}

uses DModule, confirmF;

procedure TAddSchoolForm.ToolButton1Click(Sender: TObject);
var
tID: integer;
begin
FDQuery2.Close;
FDQuery2.SQL.Text:='Insert into schools (zaklad,id_type) values ( ''������ ���������� ������'', 0) returning id';
FDQuery2.Open();
tID := FDQuery2.FieldByName('ID').value;
FDQuery2.Close;
qryZaklad.Refresh;
qryZaklad.Locate('ID', tID );
ToolButton3Click(self);

end;

procedure TAddSchoolForm.ToolButton3Click(Sender: TObject);
begin

  xEditZakl := TeditZaklForm.create(self);
  try
    xEditZakl.OnClose := ZaklEditorClose;
    xEditZakl.cmbTypeEdu.KeyValue := qryZaklad.FieldByName('ID_TYPE').value;
    xEditZakl.edZaklad.text := qryZaklad.FieldByName('Zaklad').Value;
    xEditZakl.ShowModal;
  finally
    xEditZakl.Free;
  end;
end;

procedure TAddSchoolForm.ToolButton5Click(Sender: TObject);
var
xConfDel : tconfirmform;
begin

  xConfDel.onClose := confirmClose;
  xConfDel.ShowModal;

end;

procedure TAddSchoolForm.confirmClose(Sender: TObject; var Action: TCloseAction);
begin
  if TconfirmForm(Sender).ModalResult <> mrYes then
  begin
    Action := caFree;
    Exit;
  end;

  trZaklad.StartTransaction;
try
   FDQuery2.Close;
   FDQuery2.SQL.Text :='Delete from Schools where id = :id_old';
   FDQuery2.ParamByName('ID_OLD').AsInteger := qryZaklad.FieldByName('ID').value;                  //���� ��� �������� ��������� ��������� ���������� ������
   FDQuery2.Open();
   FDQuery2.Close();

   trZaklad.Commit;
   qryZaklad.Refresh;
except
  if trZaklad.Active then                                               //���� ���-�� �� ���, �� ����������
    Begin
       trZaklad.Rollback;
     End;
end;
end;

procedure TAddSchoolForm.ToolButton7Click(Sender: TObject);
begin
close;
end;

procedure TAddSchoolForm.ZaklEditorClose(Sender: TObject; var Action: TCloseAction);
begin
  if TeditZaklForm(Sender).ModalResult <> mrOK then
  begin
    Action := caFree;
    Exit;
  end;

  trZaklad.StartTransaction;
try
   FDQuery2.Close;
   FDQuery2.SQL.Text :='UPDATE SCHOOLS set ID_TYPE = :ID_TYPE, Zaklad = :Zaklad where ID = :ID_OLD RETURNING ID';
   FDQuery2.ParamByName('ID_TYPE').AsInteger := xEditZakl.cmbTypeEdu.KeyValue;
   FDQuery2.ParamByName('Zaklad').AsString := xEditZakl.edZaklad.Text;
   FDQuery2.ParamByName('ID_OLD').AsInteger := qryZaklad.FieldByName('ID').value;                  //���� ��� �������� ��������� ��������� ���������� ������
   FDQuery2.Open();
   FDQuery2.Close();

   trZaklad.Commit;
   qryZaklad.Refresh;
except
  if trZaklad.Active then                                               //���� ���-�� �� ���, �� ����������
    Begin
       trZaklad.Rollback;
     End;
end;
end;


end.
