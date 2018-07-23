unit viewReport;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frxClass, frxDBSet, frxPreview,
  frxExportRTF, frxExportPDF;

type
  TViewReportForm = class(TForm)
    frxReport1: TfrxReport;
    frxPreview1: TfrxPreview;
    frxDBDataset1: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
    frxRTFExport1: TfrxRTFExport;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewReportForm: TViewReportForm;

implementation

{$R *.dfm}



end.
