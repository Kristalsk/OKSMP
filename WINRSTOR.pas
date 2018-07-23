unit WinRstor;

interface

uses SysUtils, Forms;

type
  {=============================================================}

  {------------------------------------------------------------------
  �������������� ���� ��������� �������� � ��������� �����.
  -------------------------------------------------------------------}
  EWinRestorer = class(Exception);
  TWhatSave = (default, size, location, state);
  STWhatSave = set of TWhatSave;
  TWinRestorer = class(TObject)

  protected
    mIniFile: string;
    mIniSect: string[80];
    mIsInitialized: boolean;
    mDefaultWhat: STWhatSave;
    xappPath: string;
  public
    constructor Create(TheApp: TApplication;

      LocalDir: boolean; DefaultWhatSave: STWhatSave);
    {���� localDir = true, ������� ini = �������� ����������.
    Else, ini dir is the windows dir.}
    procedure SaveWin(TheForm: TForm; What: STWhatSave);
    procedure SaveChildren(TheMDIForm: TForm; What: STWhatSave);
    procedure RestoreWin(TheForm: TForm; What: STWhatSave);
    procedure RestoreChildren(TheMDIForm: TForm; What: STWhatSave);
    property IniFileName: string read mIniFile;
  end;

const

  WHATSAVE_ALL = [size, location, state];

var
  GlobalWinRestorer: TWinRestorer;

implementation

uses IniFiles, Main;

constructor TWinRestorer.create;
var
  fname, path: string[100];
begin

  inherited create;
  {�������� ��� ini-�����}

  if default in DefaultWhatSave then
    raise EWinRestorer.create(
      '������� ������������� ���������� � �������� ���� �� ��������� ' +
      ' � ������������� ��������� [default]. ' +
      '��������� �� ��������� ����� ��������� ������ ������������� �������� - [size, location, state]. ')
  else
    mDefaultWhat := DefaultWhatSave;

  fname := ExtractFileDir(Application.ExeName) + PathDelim + 'config.INI';
  mIniFile := fname;
  mIniSect := 'WindowsRestorer';
  {��� �������� ������� ��������� ����������
  � ������ � ������ [WinRestorer Notes]}
end;

procedure TWinRestorer.RestoreWin;

var
  FormNm, SectionNm: string[80];
  ini: TIniFile;

  n, l, t, w, h: integer; {Left, Top Width, Height}
begin

  ini := TIniFile.create(mIniFile);
  try
    SectionNm := mIniSect;
    FormNm := TheForm.classname;
    if default in What then
      What := mDefaultWhat;
    {��� ������������� ��������� ��������� ����}

    if state in What then
      n := ini.ReadInteger(SectionNm, FormNm + '_WindowState', 0);
    case n of
      1: TheForm.WindowState := wsMinimized;
      2: TheForm.WindowState := wsNormal;
      3: TheForm.WindowState := wsMaximized;
    end;
    {��� ������������� ��������� ������� � �������.}

    with TheForm do
    begin
      l := left;
      t := top;
      h := height;
      w := width;
    end; {��������� ������� ��������.}
    if size in What then
    begin
      w := ini.ReadInteger(SectionNm, FormNm + '_Width', w);
      h := ini.ReadInteger(SectionNm, FormNm + '_Height', h);
    end;
    if location in What then
    begin
      t := ini.ReadInteger(SectionNm, FormNm + '_Top', t);
      l := ini.ReadInteger(SectionNm, FormNm + '_Left', l);
    end;
    TheForm.SetBounds(l, t, w, h);
  finally
    ini.free;
  end;
end;

procedure TWinRestorer.RestoreChildren;
var
  i: integer;
begin

  if TheMDIForm.formstyle <> fsMDIForm then
    raise
      EWinRestorer.create('������� ���������� �������� ��������� ���� ��� ��-MDI ���� ��������.')
  else
    for i := 0 to TheMDIForm.MDIChildCount - 1 do
      RestoreWin(TheMDIForm.MDIChildren[i], what);
end;

procedure TWinRestorer.SaveWin;
var
  FormNm, SectionNm: string;
  w: STWhatsave;
  ini: TIniFile;

begin

  ini := TIniFile.create(mIniFile);
  try
    SectionNm := mIniSect;
    FormNm := TheForm.ClassName;
    if default in What then
      w := mDefaultWhat
    else
      w := mDefaultWhat;
    if size in w then
    begin
      ini.WriteInteger(SectionNm, FormNm + '_Width', TheForm.Width);
      ini.WriteInteger(SectionNm, FormNm + '_Height', TheForm.Height);
    end;
    if location in w then
    begin
      ini.WriteInteger(SectionNm, FormNm + '_Top', TheForm.Top);
      ini.WriteInteger(SectionNm, FormNm + '_Left', TheForm.Left);
    end;
    if state in w then
      case TheForm.WindowState of
        wsMinimized: ini.WriteInteger(SectionNm, FormNm + '_WindowState', 1);
        wsNormal: ini.WriteInteger(SectionNm, FormNm + '_WindowState', 2);
        wsMaximized: ini.WriteInteger(SectionNm, FormNm + '_WindowState', 3);
      end;
  finally
    ini.free;
  end;
end;

procedure TWinRestorer.SaveChildren;
var
  i: integer;
begin

  if TheMDIForm.formstyle <> fsMDIForm then
    raise
      EWinRestorer.create('������� �������������� �������� ��������� ���� ��� ��-MDI ���� ��������.')
  else
    for i := 0 to TheMDIForm.MDIChildCount - 1 do
      SaveWin(TheMDIForm.MDIChildren[i], what);
end;

initialization
end.
