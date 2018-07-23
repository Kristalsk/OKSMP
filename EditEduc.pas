unit EditEduc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.DBCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TEditEdu = class(TForm)
    edYear: TEdit;
    lbZaklad: TLabel;
    lbSpecial: TLabel;
    lbYear: TLabel;
    BitBtn1: TBitBtn;
    DBLookupComboBox2: TDBLookupComboBox;
    FDQuery1: TFDQuery;
    FDQuery2: TFDQuery;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DBLookupComboBox1: TDBLookupComboBox;
    lbClassNum: TLabel;
    edNumClass: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EditEdu: TEditEdu;

implementation

{$R *.dfm}

uses formDB, DModule;

end.
