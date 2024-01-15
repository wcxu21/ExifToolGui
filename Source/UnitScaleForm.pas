unit UnitScaleForm;

// Allows Forms to scale by using command line parameter /Scale.
// Change the declaration of the form from TSomeForm = Class(TForm) to TSomeForm = Class(TScaleForm)
// and add this unit to the uses.

interface

uses Vcl.Forms, Winapi.Messages, Vcl.Controls;

type TScaleForm = class(TForm)
protected
  procedure Loaded; override;
  procedure CMDialogKey(var Message: TCMDialogKey); message CM_DIALOGKEY;

public
  function ScaleDesignDpi(const Apt: integer): integer;
end;

implementation

uses System.SysUtils, System.UITypes, Winapi.Windows;

var Scale: boolean;

// Scaling has to be set before 'Loaded'
// Default = Scale. Disable scaling with commandline /DontScale
procedure TScaleForm.Loaded;
begin
  Scaled := Scale;

  inherited;
end;

procedure TScaleForm.CMDialogKey(var Message: TCMDialogKey);
begin
  if (Message.CharCode = VK_ESCAPE) and
     (fsModal in FormState) then
    ModalResult := System.UITypes.mrCancel;
  inherited;
end;

// Provide 1 point for scaling
function TScaleForm.ScaleDesignDpi(const Apt: integer): integer;
begin
  result := ScaleValue(Apt);
end;

initialization
begin
  Scale := not FindCmdLineSwitch('DontScale', true);
end;

end.
