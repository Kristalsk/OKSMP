unit ConfirmDelete;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TDelConfForm = class(TForm)
    Label1: TLabel;
    ButtonOK: TButton;
    ButtonCancel: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DelConfForm: TDelConfForm;

implementation

{$R *.dfm}

uses Main;



end.
