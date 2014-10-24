unit WordModelUnit;

interface

uses
  System.SysUtils, System.Classes, uADStanIntf, uADStanOption, uADStanError,
  uADGUIxIntf, uADPhysIntf, uADStanDef, uADStanPool, uADStanAsync,
  uADPhysManager, uADStanParam, uADDatSManager, uADDAptIntf, uADDAptManager,
  uADGUIxFormsWait, uADStanExprFuncs, uADCompClient, uADPhysSQLite, uADCompGUIx,
  Data.DB, uADCompDataSet, Dialogs;

type
  TWordModel = class(TDataModule)
    ADConnection1: TADConnection;
    ADQueryWord: TADQuery;
    ADGUIxWaitCursor1: TADGUIxWaitCursor;
    ADPhysSQLiteDriverLink1: TADPhysSQLiteDriverLink;
    ADTransaction1: TADTransaction;
    ADQuerySQL: TADQuery;
    DataSourceWord: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Save;
    procedure Delete;
    procedure DeleteAll;
    procedure RefreshWord;
    procedure Insert(word: string; float: real);
    function IsEmpty: boolean;
    function GetWord: string;
    function GetW: real;
    procedure SortWordASC;
    procedure SortWordDESC;
    procedure SortWeightASC;
    procedure SortWeightDESC;
  end;

var
  WordModel: TWordModel;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TWordModel.DataModuleCreate(Sender: TObject);
var
  sPath: string;
begin
  try
  getDir(0, sPath);
  with ADConnection1.params do
  begin
    Clear;
    Add('Database=' + sPath + '\DB.db3');
    Add('DriverID=SQLite');
  end;

  ADPhysSQLiteDriverLink1.VendorHome := sPath;

  ADConnection1.Connected := true;
  ADQueryWord.Active := true;
  except
    ShowMessage('Не удалось подключиться к базе данных.');
    exit;
  end;
end;

procedure TWordModel.Delete;
begin
  ADQueryWord.Delete;
end;

procedure TWordModel.DeleteAll;
begin
  with ADQuerySQL do
  begin
    active := false;
    sql.Clear;
    sql.Add('delete from word_tab');
    ExecSQL;
  end;

end;

function TWordModel.GetW: real;
begin
  result := ADQueryWord.FieldByName('amount').AsFloat;
end;

function TWordModel.GetWord: string;
begin
  result := ADQueryWord.FieldByName('words').AsString;
end;

procedure TWordModel.Insert(word: string; float: real);
begin
  ADQueryWord.Insert;
  ADQueryWord.FieldByName('words').Value := word;
  ADQueryWord.FieldByName('amount').Value := float;
  ADQueryWord.Post;
end;

function TWordModel.IsEmpty: boolean;
begin
  with ADQuerySQL do
  begin
    active := false;
    sql.Clear;
    sql.add('select count(*) as totel from word_tab');
    active := true;
  end;

  if ADQuerySQL.FieldByName('totel').AsInteger = 0 then result := true
    else result := false;
end;

procedure TWordModel.RefreshWord;
begin
  ADQueryWord.Refresh;
end;

procedure TWordModel.Save;
begin
  if ADQueryWord.Modified then
    ADQueryWord.Post;
end;

procedure TWordModel.SortWeightASC;
begin
  with ADQueryWord do
  begin
    Close;
    sql.Clear;
    sql.Add('select * from word_tab order by amount');
    open;
  end;
end;

procedure TWordModel.SortWeightDESC;
begin
  with ADQueryWord do
  begin
    Close;
    sql.Clear;
    sql.Add('select * from word_tab order by amount desc');
    open;
  end;
end;

procedure TWordModel.SortWordASC;
begin
  with ADQueryWord do
  begin
    Close;
    sql.Clear;
    sql.Add('select * from word_tab order by words');
    open;
  end;
end;

procedure TWordModel.SortWordDESC;
begin
  with ADQueryWord do
  begin
    Close;
    sql.Clear;
    sql.Add('select * from word_tab order by words desc');
    open;
  end;
end;

end.
