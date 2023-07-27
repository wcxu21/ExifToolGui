unit Geotag;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.ExtCtrls, Vcl.Mask;

type
  TFGeotag = class(TForm)
    StatusBar1: TStatusBar;
    AdvPanel1: TPanel;
    LabeledEdit1: TLabeledEdit;
    Button3: TButton;
    CheckBox1: TCheckBox;
    RadioGroup1: TRadioGroup;
    CheckBox2: TCheckBox;
    Edit1: TEdit;
    TrackBar1: TTrackBar;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    procedure DisplayHint(Sender: TObject);
  public
    { Public declarations }
  end;

var
  FGeotag: TFGeotag;

implementation

uses Main, MainDef, ExifTool;

{$R *.dfm}

procedure TFGeotag.FormShow(Sender: TObject);
begin
  Left := FMain.Left + FMain.GUIBorderWidth + FMain.AdvPageFilelist.Left;
  Top := FMain.Top + FMain.GUIBorderHeight;
  with TrackBar1 do
  begin
    Enabled := not Enabled;
    Enabled := CheckBox2.Checked;
  end;

  if FMain.MDontBackup.Checked then
    Label1.Caption := 'Backup: OFF'
  else
    Label1.Caption := 'Backup: ON';
  with FMain.OpenPictureDlg do
  begin
    if GpsXmpDir <> '' then
      InitialDir := GpsXmpDir
    else
      InitialDir := FMain.ShellList.GetNamePath; // .Path;
    Filter := 'Any GPS log file|*.*';
    Options := [ofFileMustExist];
    Title := 'Select GPS log file';
    FileName := '';
  end;
  Button2.Enabled := false;
  LabeledEdit1.Clear;
  Application.OnHint := DisplayHint;
end;

procedure TFGeotag.TrackBar1Change(Sender: TObject);
var
  i: smallint;
  tx: string[7];
begin
  i := TrackBar1.Position;
  if i >= 0 then
    tx := '+'
  else
  begin
    tx := '-';
    i := i * -1;
  end;
  if i < 10 then
    tx := tx + '0' + IntToStr(i)
  else
    tx := tx + IntToStr(i);
  Edit1.Text := tx;
end;

procedure TFGeotag.Button2Click(Sender: TObject);
var
  ETcmd, ETout, ETerr: string;
begin
  if CheckBox1.Checked then
    ETcmd := ExtractFilePath(LabeledEdit1.Text) + '*' +
      ExtractFileExt(LabeledEdit1.Text)
  else
    ETcmd := LabeledEdit1.Text;
  ETcmd := '-geotag' + CRLF + ETcmd + CRLF;
  ETcmd := ETcmd + '-geotime<';
  if CheckBox2.Checked then
  begin
    if RadioGroup1.ItemIndex = 0 then
      ETcmd := ETcmd + '${DateTimeOriginal}'
    else
      ETcmd := ETcmd + '${CreateDate}';
    ETcmd := ETcmd + Edit1.Text + ':00';
  end
  else
  begin
    if RadioGroup1.ItemIndex = 0 then
      ETcmd := ETcmd + 'DateTimeOriginal'
    else
      ETcmd := ETcmd + 'CreateDate"';
  end;

  if (ET_OpenExec(ETcmd, FMain.GetSelectedFiles, ETout, ETerr)) then
    FMain.UpdateLogWin(ETout, ETerr);
  ModalResult := mrOK;
end;

procedure TFGeotag.Button3Click(Sender: TObject);
begin
  if FMain.OpenPictureDlg.Execute then
  begin
    LabeledEdit1.Text := FMain.OpenPictureDlg.FileName;
    GpsXmpDir := ExtractFilePath(FMain.OpenPictureDlg.FileName);
    if GpsXmpDir[Length(GpsXmpDir)] <> '\' then
      GpsXmpDir := GpsXmpDir + '\';
    Button2.Enabled := true;
  end;
end;

procedure TFGeotag.CheckBox2Click(Sender: TObject);
begin
  TrackBar1.Enabled := CheckBox2.Checked;
end;

procedure TFGeotag.DisplayHint(Sender: TObject);
begin
  StatusBar1.SimpleText := GetShortHint(Application.Hint);
end;

end.
