unit EduDescript;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Mask, Vcl.DBCtrls, Vcl.ComCtrls;

type
  TEduDecriptForm = class(TForm)

    DateTimePicker1: TDateTimePicker;
    DBEdit1: TDBEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    lbTypeEdu: TLabel;
    lbSchool: TLabel;
    lbDateFrom: TLabel;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    FDQuery2: TFDQuery;
    procedure DateTimePicker1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EduDecriptForm: TEduDecriptForm;

implementation

{$R *.dfm}

uses DModule, formDB, Main;


procedure TEduDecriptForm.FormCreate(Sender: TObject);
begin
DBEdit1.Text := DatetoStr(DateTimePicker1.Date);
end;

end.
