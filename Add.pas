unit Add;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait,
  FireDAC.Phys.IBBase, Vcl.ComCtrls, FireDAC.Phys.ODBC, FireDAC.Phys.ODBCDef,
  Vcl.Buttons;

type
  TAddForm = class(TForm)
    lbSurnameAdd: TLabel;
    lbFirstNameAdd: TLabel;
    lbLastNameAdd: TLabel;
    lbBirthdayAdd: TLabel;
    lbGenderAdd: TLabel;
    DateTimePicker1: TDateTimePicker;
    ComboBox1: TComboBox;
    BitBtn1: TBitBtn;
    edtSurname: TEdit;
    edtFirstname: TEdit;
    edtLastname: TEdit;
    edtPrimitka: TEdit;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure setDataChild (ASurname, AFirstname, ALastname, APrimitka:String; abirtday : tDateTime; aGender : Integer);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddForm: TAddForm;

implementation

{$R *.dfm}

uses Main, DModule, formDB, DateUtils;

procedure TAddForm.FormCreate(Sender: TObject);
begin
  ComboBox1.ItemIndex := 0;
  edtSurname.Text := '';
  edtFirstname.Text := '';
  edtLastname.Text := '';
  edtPrimitka.Text := '';
  DateTimePicker1.DateTime := Now;
  DateTimePicker1.Format := 'dd.MM.yyyy';
end;

procedure TaddForm.setDataChild (ASurname, AFirstname, ALastname,  APrimitka:String; abirtday : tDateTime; aGender : Integer );
begin

  edtSurname.Text := ASurname;
  edtFirstname.Text := AFirstname;
  edtLastname.Text := ALastname;
  ComboBox1.ItemIndex := Agender;
  edtPrimitka.Text := APrimitka;
  DateTimePicker1.DateTime := abirtday;
end;
end.
