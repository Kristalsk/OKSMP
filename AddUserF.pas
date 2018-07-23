unit AddUserF;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TaddUserForm = class(TForm)
    lbLogin: TLabel;
    lbPassword: TLabel;
    edLogin: TEdit;
    edPassword: TEdit;
    BitBtn1: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  addUserForm: TaddUserForm;

implementation

{$R *.dfm}

uses DModule, UsersF;

end.
