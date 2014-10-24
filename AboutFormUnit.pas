unit AboutFormUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, shellapi;

type
  TAboutForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    procedure Label7Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure Label6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutForm: TAboutForm;

implementation

{$R *.dfm}

procedure TAboutForm.Label3Click(Sender: TObject);
begin
  ShellExecute(0,'open','mailto:alexeev_vn@mail.ru',nil,nil,Sw_Show);
end;

procedure TAboutForm.Label4Click(Sender: TObject);
begin
  ShellExecute(0,'open','http://123theory.ru',nil,nil,Sw_Show);
end;

procedure TAboutForm.Label6Click(Sender: TObject);
begin
  ShellExecute(0,'open','mailto:sokolovskynik@gmail.com',nil,nil,Sw_Show);
end;

procedure TAboutForm.Label7Click(Sender: TObject);
begin
  ShellExecute(0,'open','http://samodelkin.biz',nil,nil,Sw_Show);
end;

end.
