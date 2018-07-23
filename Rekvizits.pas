unit Rekvizits;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, inifiles, Vcl.ComCtrls, Vcl.ToolWin,
  Vcl.StdCtrls, Vcl.ExtCtrls, winrstor;

type
  TAddRekvizitForm = class(TForm)
    grbYurAdr: TGroupBox;
    edZipcode: TEdit;
    lbZipcode: TLabel;
    edObl: TEdit;
    lbObl: TLabel;
    edGorod: TEdit;
    lbGorod: TLabel;
    edStreet: TEdit;
    lbStreet: TLabel;
    edNimHouse: TEdit;
    lbNumHouse: TLabel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    grbFactAddress: TGroupBox;
    lbFactINDEX: TLabel;
    lbFactOblast: TLabel;
    lbFactGorod: TLabel;
    lbFactStreet: TLabel;
    lbFactNumhouse: TLabel;
    edFactIndex: TEdit;
    edFactOblast: TEdit;
    edFactGorod: TEdit;
    edFactStreet: TEdit;
    edFactNumHouse: TEdit;
    GroupBox1: TGroupBox;
    lbEDRPOU: TLabel;
    edEDRPOU: TEdit;
    edNazvaOrg: TEdit;
    lbNazvaOrg: TLabel;
    edDirector: TEdit;
    edSubDirector: TEdit;
    edTel: TEdit;
    edFax: TEdit;
    edMail: TEdit;
    lbDirector: TLabel;
    lbSubDirector: TLabel;
    lbTel: TLabel;
    lbFax: TLabel;
    lbMail: TLabel;
    cbFizAddress: TCheckBox;
    procedure FormActivate(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbFizAddressClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddRekvizitForm: TAddRekvizitForm;
  xIniFile : TInifile;

implementation

{$R *.dfm}

uses DModule, Main;

procedure TAddRekvizitForm.cbFizAddressClick(Sender: TObject);
begin
if cbFizAddress.Checked = true then
begin
  edFactIndex.Text := edZipcode.Text;
  edFactOblast.Text := edObl.Text;
  edFactGorod.Text := edGorod.Text;
  edFactStreet.Text := edStreet.Text;
  edFactNumHouse.Text := edNimHouse.Text;
  end
  else
  begin
  edFactIndex.Text := '';
  edFactOblast.Text := '';
  edFactGorod.Text := '';
  edFactStreet.Text := '';
  edFactNumHouse.Text := '';
  end;

end;

procedure TAddRekvizitForm.FormActivate(Sender: TObject);
   var
   xAppPath : string;
begin
   xAppPath := ExtractFileDir(Application.ExeName) + PathDelim;
   xIniFile := TIniFile.Create(xAppPath + 'config.ini');
   edNazvaOrg.Text := xIniFile.ReadString('REKVIZITS', 'NazvaOrg', '');
   edEDRPOU.Text := xIniFile.ReadString('REKVIZITS', 'EDRPOU', '');
   edZipcode.Text := xIniFile.ReadString('REKVIZITS', 'INDEX', '');
   edObl.Text := xIniFile.ReadString('REKVIZITS', 'OBLAST', '');
   edGorod.Text := xIniFile.ReadString('REKVIZITS', 'GOROD', '');
   edStreet.Text := xIniFile.ReadString('REKVIZITS', 'STREET', '');
   edNimHouse.Text := xIniFile.ReadString('REKVIZITS', 'NUMHOUSE', '');
   edNazvaOrg.Text := xIniFile.ReadString('REKVIZITS', 'NazvaOrg', '');
   edEDRPOU.Text := xIniFile.ReadString('REKVIZITS', 'EDRPOU', '');
   edFactIndex.Text := xIniFile.ReadString('REKVIZITS', 'FactINDEX', '');
   edFactOblast.Text := xIniFile.ReadString('REKVIZITS', 'FactOBLAST', '');
   edFactGorod.Text := xIniFile.ReadString('REKVIZITS', 'FactGOROD', '');
   edFactStreet.Text := xIniFile.ReadString('REKVIZITS', 'FactSTREET', '');
   edFactNumHouse.Text := xIniFile.ReadString('REKVIZITS', 'FactNUMHOUSE', '');
   edDirector.Text := xIniFile.ReadString('REKVIZITS', 'Director', '');
   edSubDirector.Text := xIniFile.ReadString('REKVIZITS', 'Vidpovida4', '');
   edTel.Text := xIniFile.ReadString('REKVIZITS', 'Tel', '');
   edFax.Text := xIniFile.ReadString('REKVIZITS', 'Fax', '');
   edMail.Text := xIniFile.ReadString('REKVIZITS', 'Mail', '');
   xIniFile.Free;

end;

procedure TAddRekvizitForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
xIniFile.Free;
end;

procedure TAddRekvizitForm.ToolButton1Click(Sender: TObject);
 var
  xAppPath : string;
begin
 xAppPath := ExtractFileDir(Application.ExeName) + PathDelim;
   xIniFile := TIniFile.Create(xAppPath + 'config.ini');
   xIniFile.WriteString('REKVIZITS', 'NazvaOrg', edNazvaOrg.Text);
   xIniFile.WriteString('REKVIZITS', 'EDRPOU', edEDRPOU.Text);
   xIniFile.WriteString('REKVIZITS', 'INDEX', edZipcode.Text);
   xIniFile.WriteString('REKVIZITS', 'OBLAST', edObl.Text);
   xIniFile.WriteString('REKVIZITS', 'GOROD', edGorod.Text);
   xIniFile.WriteString('REKVIZITS', 'STREET', edStreet.Text);
   xIniFile.WriteString('REKVIZITS', 'NUMHOUSE', edNimHouse.Text);
   xIniFile.WriteString('REKVIZITS', 'FactINDEX', edFactIndex.Text);
   xIniFile.WriteString('REKVIZITS', 'FactOBLAST', edFactOblast.Text);
   xIniFile.WriteString('REKVIZITS', 'FactGOROD', edFactGorod.Text);
   xIniFile.WriteString('REKVIZITS', 'FactSTREET', edFactStreet.Text);
   xIniFile.WriteString('REKVIZITS', 'FactNUMHOUSE', edFactNumHouse.Text);
   xIniFile.WriteString('REKVIZITS', 'Director', edDirector.Text);
   xIniFile.WriteString('REKVIZITS', 'Vidpovida4', edSubDirector.Text);
   xIniFile.WriteString('REKVIZITS', 'Tel', edTel.Text);
   xIniFile.WriteString('REKVIZITS', 'Fax', edFax.Text);
   xIniFile.WriteString('REKVIZITS', 'Mail',edMail.Text);
   xIniFile.Free;
end;

procedure TAddRekvizitForm.ToolButton3Click(Sender: TObject);
begin

    close;
end;

end.
