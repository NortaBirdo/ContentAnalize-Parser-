unit HelpFormUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.OleCtrls, SHDocVw;

type
  THelpForm = class(TForm)
    WebBrowser1: TWebBrowser;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HelpForm: THelpForm;

implementation

{$R *.dfm}

procedure THelpForm.FormShow(Sender: TObject);
var
  path: string;
begin
  GetDir(0, path);

  path := path + '\data\help.mht';

  if FileExists(path) then
    WebBrowser1.Navigate(path);

end;

end.
