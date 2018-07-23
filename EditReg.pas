unit EditReg;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.DBCtrls,
  Vcl.Buttons, Vcl.ComCtrls, Vcl.Mask;

type
  TEditAddress = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    edtAddress: TDBEdit;
    edtYear: TDBEdit;

  private
    private
    public
   { Public declarations }
  end;

var
  EditAddress: TEditAddress;

implementation

{$R *.dfm}

uses DModule, formDB;



end.
