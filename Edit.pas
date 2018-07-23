unit Edit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Data.DB, FireDAC.Comp.Client, FireDAC.Comp.DataSet, Vcl.ComCtrls,
  FireDAC.Phys.ODBC, FireDAC.Phys.ODBCDef;

type
  TEditForm = class(TForm)
    FDQuery2: TFDQuery;
    DataSource2: TDataSource;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit4: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit1: TDBEdit;
    Button2: TButton;
    Button1: TButton;
    lbNumHouseAdd: TLabel;
    lbSchoolAdd: TLabel;
    lbBirthdayAdd: TLabel;
    lbStreetAdd: TLabel;
    lbLastNameAdd: TLabel;
    lbFirstNameAdd: TLabel;
    lbSurnameAdd: TLabel;
    DBEdit5: TDBEdit;
    DateTimePicker1: TDateTimePicker;
    procedure Button2Click(Sender: TObject);




  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EditForm: TEditForm;

implementation

{$R *.dfm}

uses Main, DModule;



procedure TEditForm.Button2Click(Sender: TObject);
begin
EditForm.Close;
end;







end.
