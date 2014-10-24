unit WordFormUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.Mask, Vcl.DBCtrls;

type
  TWordForm = class(TForm)
    DBGrid1: TDBGrid;
    AddBtn: TButton;
    DelBtn: TButton;
    SaveBtn: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WordForm: TWordForm;

implementation

{$R *.dfm}


end.
