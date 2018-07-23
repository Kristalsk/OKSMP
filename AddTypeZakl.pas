unit AddTypeZakl;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls, Vcl.ToolWin;

type
  TAddTypeZaklad = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    DBGrid1: TDBGrid;
    qryTypeZakl: TFDQuery;
    DataSource1: TDataSource;
    trTypeZakl: TFDTransaction;
    FDQuery2: TFDQuery;
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddTypeZaklad: TAddTypeZaklad;

implementation

{$R *.dfm}

uses DModule;

procedure TAddTypeZaklad.ToolButton1Click(Sender: TObject);
begin
FDQuery2.Close;
FDQuery2.SQL.Text:='Insert into types_education (type_edu) values ( ''введіть тип закладу'') returning id';
FDQuery2.Open();
FDQuery2.Close;
qryTypeZakl.Refresh;
end;

procedure TAddTypeZaklad.ToolButton3Click(Sender: TObject);
begin
close;
end;

end.
