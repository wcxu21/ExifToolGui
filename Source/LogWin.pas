unit LogWin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, UnitScaleForm, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TFLogWin = class(TScaleForm)
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    MemoErrs: TMemo;
    PnlMidle: TPanel;
    MemoOuts: TMemo;
    MemoCmds: TMemo;
    Splitter3: TSplitter;
    PctExecs: TPageControl;
    TabExecs: TTabSheet;
    PCTCommands: TPageControl;
    TabCommands: TTabSheet;
    PCTOutput: TPageControl;
    TabOutput: TTabSheet;
    PCTErrors: TPageControl;
    TabErrors: TTabSheet;
    LBExecs: TListBox;
    ChkShowAll: TCheckBox;
    PnlCommands: TPanel;
    BtnPowerShell: TButton;
    SaveDialogPS: TSaveDialog;
    BtnCmd: TButton;
    SaveDialogCmd: TSaveDialog;
    RadShowCmds: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure LBExecsClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MemoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnPowerShellClick(Sender: TObject);
    procedure BtnCmdClick(Sender: TObject);
    procedure RadShowCmdsClick(Sender: TObject);
  protected
  private
    { Private declarations }
    LogId: Integer;
    AnsiWarned: boolean;
    function IsArgs: boolean;
  public
    { Public declarations }
    FExecs: TStringList;
    FCmds: TStringList;
    FEtOuts: TStringList;
    FEtErrs: TStringList;

    function NextLogId: integer;
  end;

var
  FLogWin: TFLogWin;

implementation

uses Main, MainDef, ExifToolsGUI_Utils, Winapi.ShellAPI, UnitLangResources;


{$R *.dfm}

function TFLogWin.IsArgs: boolean;
begin
  result := true;
  if (LBExecs.ItemIndex >= 0 ) then
    result := (Pos(#10, FCmds[LBExecs.ItemIndex]) > 0);
end;

function TFLogWin.NextLogId: integer;
begin
  inc(LogId);
  if (LogId > 9) then
    LogId := 0;
  result := LogId;
end;

procedure TFLogWin.RadShowCmdsClick(Sender: TObject);
begin
  if (LBExecs.ItemIndex < 0) then
    exit;
  case RadShowCmds.ItemIndex of
    0:
      begin
        MemoCmds.WordWrap := false;
        BtnCmd.Enabled := true;
        if IsArgs then
          MemoCmds.Text := FCmds[LBExecs.ItemIndex]
        else
          MemoCmds.Text := ArgsFromDirectCmd(FCmds[LBExecs.ItemIndex]);
      end;
    1:
      begin
        if not AnsiWarned then
        begin
          AnsiWarned := true;
          ShowMessage(StrThisMethodOnlyAnsi);
        end;
        MemoCmds.WordWrap := true;
        BtnCmd.Enabled := true;
        if not IsArgs then
          MemoCmds.Text := FCmds[LBExecs.ItemIndex]
        else
          MemoCmds.Text := DirectCmdFromArgs(FCmds[LBExecs.ItemIndex]);
      end;
  end;
end;

procedure TFLogWin.BtnCmdClick(Sender: TObject);
var
   CmdList: TStringList;
   ACmd: string;
begin
  SaveDialogCmd.FileName := '';
  SaveDialogCmd.InitialDir := Fmain.ShellList.Path;
  if not SaveDialogCmd.Execute then
    exit;
  CmdList := TStringList.Create;
  try
    CmdList.Add('@echo off');
    CmdList.Add('chcp 65001');

    if (RadShowCmds.ItemIndex = 0) then
    begin
      CmdList.Add('set ARGS="%TEMP%\exiftool.args"');
      CmdList.Add('echo #### Generated by ExifToolGui #####>%ARGS%');
      for ACmd in MemoCmds.Lines do // Need WordWrap set to false for this.
        CmdList.Add(Format('echo ^%s>>%%ARGS%%', [StringReplace(ACmd, '%', '%%', [rfReplaceAll])]));
      CmdList.Add('exiftool -@ %ARGS%');
      CmdList.Add('del %ARGS%');
    end
    else
      CmdList.Add('exiftool ' + StringReplace(MemoCmds.Text, '%', '%%', [rfReplaceAll]));

    CmdList.Add('pause');
    WriteArgsFile(CmdList.Text, SaveDialogCmd.FileName);
  finally
    CmdList.Free;
  end;
  ACmd := ExtractFileName(SaveDialogCmd.FileName);

  ShellExecute(0, nil, PWideChar(GetComSpec),
                       PWideChar(Format('/K echo: ' +
                                        '&& echo ' + StrWarningInternation + ' ' +
                                        '&& echo ' + StrSelectingADiff + ' ' +
                                        '&& echo: ' +
                                        '&& echo ' + StrTypeSToExecute +
                                        '&& echo: && dir "%s"', [ACmd, ACmd])),
                       PWideChar(Format('%s', [Fmain.ShellList.Path])), SW_SHOWNORMAL);
end;

procedure TFLogWin.BtnPowerShellClick(Sender: TObject);
var
   PSList: TStringList;
   ACmd: string;
begin
  SaveDialogPS.FileName := '';
  SaveDialogPS.InitialDir := Fmain.ShellList.Path;
  if not SaveDialogPS.Execute then
    exit;
  PSList := TStringList.Create;
  try
    PSList.Add('#');
    PSList.Add('# When you receive a message ".... cannot be loaded because running scripts is disabled on this system", ');
    PSList.Add('# Copy, paste the next line in a new window:');
    PSList.Add('# Set-ExecutionPolicy bypass -Scope Process');
    PSList.Add('# Then uncomment and execute.');
    PSList.Add('#');
    PSList.Add('# To permanently disable start ISE as admin and execute:');
    PSList.Add('# Set-ExecutionPolicy bypass -Scope LocalMachine');
    PSList.Add('#');
    PSList.Add('# It is recommended to run this script with WMF 5.1.');
    PSList.Add('# You can check your version by issueing the command: $PSVersionTable.PSVersion');
    PSList.Add('#');
    PSList.Add('try {');
    PSList.Add('  [Console]::OutputEncoding = [System.Text.Encoding]::UTF8');
    PSList.Add('}');
    PSList.Add('catch {');
    PSList.Add('# The first time in ISE we get an "invalid handle". Write something with -VER and try again.');
    PSList.Add('  exiftool -VER');
    PSList.Add('  [Console]::OutputEncoding = [System.Text.Encoding]::UTF8');
    PSList.Add('}');
    PSList.Add('# Set Working directory.');
    PSList.Add(Format('Set-Location "%s"', [Fmain.ShellList.Path]));
    PSList.Add('');
    if (RadShowCmds.ItemIndex = 0) then
    begin
      PSList.Add('# New-TemporaryFile may not be known.');
      PSList.Add('try {');
      PSList.Add('    $args = New-TemporaryFile');
      PSList.Add('}');
      PSList.Add('catch {');
      PSList.Add('    $args = Get-Item ([System.IO.Path]::GetTempFilename())');
      PSList.Add('}');
      PSList.Add('Set-Content -Encoding UTF8 -Path $args -Value "#### Generated by ExifToolGui #####"');
      for ACmd in MemoCmds.Lines do // Need WordWrap set to false for this.
        PSList.Add(Format('Add-Content -Path $args -Value "%s"', [ACmd]));
      PSList.Add('#echo4 triggers NativeCommand exception. ==>> 2>&1 | %{"$_"} <<= redirects Stderr to Stdout');
      PSList.Add('exiftool -@ $args 2>&1 | %{"$_"}');
      PSList.Add('Remove-Item -Path $args');
    end
    else
    begin
      ACmd := StringReplace(StringReplace(MemoCmds.Text, '}', '`}', [rfReplaceAll]), '{', '`{', [rfReplaceAll]);
      PSList.Add('exiftool ' + ACmd + ' 2>&1 | %{"$_"}');
    end;

    PSList.Add('pause');
    WriteArgsFile(PSList.Text, SaveDialogPS.FileName, (RadShowCmds.ItemIndex = 0));
  finally
    PSList.Free;
  end;

  ShellExecute(0, 'Edit', PWideChar(SaveDialogPS.FileName),
                          PWideChar(Fmain.ShellList.Path),
                          PWideChar(Fmain.ShellList.Path), SW_SHOWNORMAL);
end;

procedure TFLogWin.FormCreate(Sender: TObject);
begin
  ReadGUILog;

// Note to fill the stringlists with 10 empty lines
  FExecs := TStringList.Create;
  FExecs.Text := StringOfChar(#10,10);

  FCmds := TStringList.Create;
  Fcmds.Text := StringOfChar(#10,10);

  FEtOuts := TStringList.Create;
  FEtOuts.Text := StringOfChar(#10,10);

  FEtErrs := TStringList.Create;
  FEtErrs.Text := StringOfChar(#10,10);

  LogId := -1;
  ChkShowAll.Checked := false;
  AnsiWarned := false;
end;

procedure TFLogWin.FormDestroy(Sender: TObject);
begin
  FExecs.Free;
  FCmds.Free;
  FEtOuts.Free;
  FEtErrs.Free;
end;

procedure TFLogWin.FormShow(Sender: TObject);
begin
  LBExecs.Items.Assign(FExecs);
end;

procedure TFLogWin.LBExecsClick(Sender: TObject);
begin
  if (LBExecs.ItemIndex < 0) then
    exit;
  MemoCmds.Text := FCmds[LBExecs.ItemIndex];
  if (IsArgs) then
    RadShowCmds.ItemIndex := 0
  else
    RadShowCmds.ItemIndex := 1;
  MemoOuts.Text := FEtOuts[LBExecs.ItemIndex];
  MemoErrs.Text := FEtErrs[LBExecs.ItemIndex];
end;

procedure TFLogWin.MemoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = Ord('A')) and (ssCTRL in Shift) then // Ctrl+A
    TMemo(Sender).SelectAll;
  if (Key = Ord('C')) and (ssCTRL in Shift) then // Ctrl+C
    TMemo(Sender).CopyToClipboard;
end;

end.
