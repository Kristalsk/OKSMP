unit editZakl;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.DBCtrls;

type
  TeditZaklForm = class(TForm)
    cmbTypeEdu: TDBLookupComboBox;
    edZaklad: TEdit;
    lbZakladName: TLabel;
    lbTypeEdu: TLabel;
    BitBtn1: TBitBtn;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  editZaklForm: TeditZaklForm;

implementation

{$R *.dfm}

uses DModule, AddZaklad;


end.
