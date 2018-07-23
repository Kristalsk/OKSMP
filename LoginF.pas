unit LoginF;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, DModule, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Inifiles;

type
  TLoginForm = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    ����: TLabel;
    ������: TLabel;
    BitBtn1: TBitBtn;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    FDTransaction1: TFDTransaction;
    chbSaveLog: TCheckBox;




  private

  public

  end;

var
  LoginForm: TLoginForm;
  dMod: TDataModule1;
  xIniFile: Tinifile;
  xAppPath: string;


implementation

{$R *.dfm}

uses Main, formDB;

end.