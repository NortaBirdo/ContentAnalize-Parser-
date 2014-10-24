program Parser;

uses
  Vcl.Forms,
  MainUnit in 'MainUnit.pas' {MainForm},
  HelpFormUnit in 'HelpFormUnit.pas' {HelpForm},
  WordModelUnit in 'WordModelUnit.pas' {WordModel: TDataModule},
  ExcelReportUnit in 'ExcelReportUnit.pas',
  AboutFormUnit in 'AboutFormUnit.pas' {AboutForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TWordModel, WordModel);
  Application.CreateForm(THelpForm, HelpForm);
  Application.CreateForm(TAboutForm, AboutForm);
  Application.Run;
end.
