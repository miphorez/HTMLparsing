program HTMLparsing;

uses
  Forms,
  frmHTMLparsing in 'frmHTMLparsing.pas' {frm_HTMLparsing},
  _frEditSave in '_frames\_frEditSave.pas' {fr_EditSave: TFrame},
  uHTMLp in '_unit\uHTMLp.pas',
  TMImport in '_unit\TMImport.pas',
  _uFuncTimer_Idle in '_unit\_uFuncTimer_Idle.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfrm_HTMLparsing, frm_HTMLparsing);
  Application.Run;
end.
