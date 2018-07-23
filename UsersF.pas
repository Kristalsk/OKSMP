unit UsersF;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client, FireDAC.Comp.DataSet, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls, Vcl.ToolWin,AddUserF, confirmF;

type
  TusersForm = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    DBGrid1: TDBGrid;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    FDQuery2: TFDQuery;
    FDTransaction1: TFDTransaction;
    procedure ToolButton1Click(Sender: TObject);
    procedure AddUserClose(Sender: TObject;
  var Action: TCloseAction);
    procedure ToolButton3Click(Sender: TObject);
    procedure confirmClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  usersForm: TusersForm;
  xaddUsform: TAdduserForm;
  xConfDel : tconfirmform;



implementation

{$R *.dfm}

uses DModule, Main, WINRSTOR;

procedure TusersForm.ToolButton1Click(Sender: TObject);

begin
  xaddUsform := TAddUserForm.Create(self);
  try

    xaddUsform.OnClose := AddUserClose;
    xaddUsform.ShowModal;
  finally
    xaddUsform.Free;
  end;
end;

procedure TusersForm.ToolButton3Click(Sender: TObject);

begin
   xConfDel := Tconfirmform.Create(self);
  try

    xConfDel.OnClose := confirmClose;
    xConfDel.ShowModal;
  finally
    xConfDel.Free;
  end;

end;

procedure TusersForm.ToolButton5Click(Sender: TObject);
begin
close;
end;

procedure Tusersform.confirmClose(Sender: TObject; var Action: TCloseAction);
begin
  if TconfirmForm(Sender).ModalResult <> mrYes then
  begin
    Action := caFree;
    Exit;
  end;
   FDTransaction1.StartTransaction;
   FDQuery2.Close;
   FDQuery2.SQL.Text :='Delete from UsersDb where id = :id_old returning id';
   FDQuery2.ParamByName('ID_OLD').AsInteger := FDQuery1.FieldByName('ID').value;                  //Если нет передаем параметры процедуре добавления записи
   FDQuery2.Open();
   FDQuery2.Close();
   FDTransaction1.Commit;

   FDQuery1.Refresh;

end;


procedure TusersForm.AddUserClose(Sender: TObject;
  var Action: TCloseAction);
  begin
  if tadduserform(Sender).ModalResult <> mrOK then
  begin
    FDQuery1.Refresh;
    Action := caFree;
    Exit;
  end;
   FDTransaction1.StartTransaction;
  FDQuery2.Close;
  FDQuery2.SQL.Text := 'Insert into usersdb (login, password,admin_flag) values (:log, :pass, 0) returning id';
  FDQuery2.ParamByName('log').AsString :=  trim(xaddUsform.edLogin.Text);
  FDQuery2.ParamByName('pass').AsString :=  trim(xaddUsform.edPassword.Text);
  FDQuery2.Open();
  FDQuery2.Close();
  FDTransaction1.Commit;
  FDQuery1.Refresh;

end;

end.
