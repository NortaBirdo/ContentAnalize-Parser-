unit MainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.Grids, Vcl.ExtDlgs, Vcl.Mask, Vcl.DBCtrls, Vcl.DBGrids, Vcl.ExtCtrls;

type
  TMainForm = class(TForm)
    MainMenu1: TMainMenu;
    Afqk1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N5: TMenuItem;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    PathEdit: TEdit;
    ViewBtn: TButton;
    ChvostEdit: TEdit;
    NosEdit: TEdit;
    UpDown1: TUpDown;
    UpDown2: TUpDown;
    OpenTextFileDialog1: TOpenTextFileDialog;
    StartParsBtn: TButton;
    DBGrid1: TDBGrid;
    DelBtn: TButton;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    OutputMemo: TRichEdit;
    SaveResultBtn: TButton;
    SaveBtn: TButton;
    GroupBox2: TGroupBox;
    AddBtn: TButton;
    Label8: TLabel;
    Label9: TLabel;
    WordEdit: TEdit;
    WightEdit: TEdit;
    SaveDialog1: TSaveDialog;
    ImportBtn: TButton;
    OpenDialog1: TOpenDialog;
    N4: TMenuItem;
    Excel1: TMenuItem;
    N6: TMenuItem;
    RichEdit1: TRichEdit;
    SettingSearchGroup: TRadioGroup;
    procedure ViewBtnClick(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure StartParsBtnClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure AddBtnClick(Sender: TObject);
    procedure DelBtnClick(Sender: TObject);
    procedure SaveBtnClick(Sender: TObject);
    procedure SaveResultBtnClick(Sender: TObject);
    procedure ImportBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure N5Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure Excel1Click(Sender: TObject);
    procedure N6Click(Sender: TObject);

  private
    flagTitle, flagW: boolean; //порядок сортировки
  public
    SoursePath: string;
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

uses HelpFormUnit, WordFormUnit, WordModelUnit, ExcelReportUnit, AboutFormUnit;

procedure TMainForm.ViewBtnClick(Sender: TObject);
begin
if OpenTextFileDialog1.Execute then
  begin
    SoursePath := OpenTextFileDialog1.FileName;
    PathEdit.Text := SoursePath;
  end;
end;

procedure TMainForm.N1Click(Sender: TObject);
var
  str: string;
  path: string;
  i: integer;
label
  first;
begin

  DateTimeToString(str, 'ddmmyyyy', now);

  str := copy(ExtractFileName(SoursePath), 0, length(ExtractFileName(SoursePath))-4) + '_' + str;
  SaveDialog1.FileName := str;

  //форматируем существующий текст
  with OutputMemo do
  begin
  Lines.BeginUpdate;
  Lines.Insert(0, 'Программный комплекс «Теория 123».  Версия: 2.3.');
  Lines.Insert(1, 'Все права защищены. 2014-2015 (с).');
  Lines.Insert(2, 'Наш сайт: 123theory.ru');
  Lines.Insert(3, '');
  Lines.Insert(4, '__________________________________________________');
  Lines.Insert(5, '');
  Lines.Insert(6, 'РЕЗУЛЬТАТ ПОИСКА:');
  Lines.Insert(7, '');

  SelStart := 0;
  SelLength := 106;
  SelAttributes.Color := RGB(191, 191, 191);
  SelAttributes.Size := 11;
  SelAttributes.Name := 'Calibri';

  first:
  path := '';

  if SaveDialog1.Execute then
  begin
    if pos('.rtf', str, -1) = 0 then
      path := SaveDialog1.FileName + '.rtf'
    else
      path := SaveDialog1.FileName;

    if FileExists(path) then
      if MessageDlg('Файл уже существует. Заменить?', mtConfirmation, mbYesNo, 0) = idNo then
      begin
        SaveDialog1.FileName := '';
        goto first;
      end;

    Lines.SaveToFile(path);

  end;



  for I := 0 to 7 do
    Lines.Delete(0);

  Lines.EndUpdate;
  end;

end;

procedure TMainForm.N3Click(Sender: TObject);
begin
  MainForm.Close;
end;

procedure TMainForm.N4Click(Sender: TObject);
begin
  ViewBtn.Click;
end;

procedure TMainForm.N5Click(Sender: TObject);
begin
  HelpForm.ShowModal;
end;

procedure TMainForm.N6Click(Sender: TObject);
begin
  AboutForm.ShowModal;
end;

//работа со словарем
procedure TMainForm.AddBtnClick(Sender: TObject);
begin
  WordModel.Insert(WordEdit.Text, StrToFloatDef(WightEdit.Text,-1));
  WordEdit.Text := '';
  WightEdit.Text := '';
end;

procedure TMainForm.DBGrid1TitleClick(Column: TColumn);
begin
  if Column.Title.Caption = 'Морфема' then
  begin
    if flagTitle then WordModel.SortWordASC
    else WordModel.SortWordDESC;

    flagTitle := not(flagTitle);
  end;

  if Column.Title.Caption = 'Вес' then
  begin
    if flagW then WordModel.SortWeightASC
    else WordModel.SortWeightDESC;

    flagW := not (flagW);
  end;

end;

procedure TMainForm.DelBtnClick(Sender: TObject);
begin
  if MessageDlg('Вы действительно хотите удалить морфему?', mtConfirmation, mbYesNo, 0) = idYes then
    WordModel.Delete;
end;

procedure TMainForm.Excel1Click(Sender: TObject);
begin
  ImportBtn.Click;
end;

// работа с положением и размером окна
procedure TMainForm.FormCreate(Sender: TObject);
var
  Width, Height: integer;
begin

  Width:=GetDeviceCaps(GetDC(0),HORZRES);
  Height:=GetDeviceCaps(GetDC(0),VERTRES);

  flagTitle := false;
  flagw := true;
end;

procedure TMainForm.FormResize(Sender: TObject);
begin
  if MainForm.Width <= 1027 then MainForm.Width := 1027;
  if MainForm.Height <= 717 then MainForm.Height := 731;

  OutputMemo.Width := MainForm.Width - 560;
  OutputMemo.Height := MainForm.Height - 229;
  DBGrid1.Height := Mainform.Height - 120;
  SaveResultBtn.Top := 123+ OutputMemo.Height + 6;

  SaveResultBtn.Left := 542 + OutputMemo.Width - 467;

end;

//Имопрт из Excel
procedure TMainForm.ImportBtnClick(Sender: TObject);
var
  Excel: TExcelReport;
  row: integer;
  str :string;
begin
  OpenDialog1.FileName := '';
  if not(OpenDialog1.Execute) then exit;
  if MessageDlg('Внимание. Перед импортом словаря из Excel текущий словарь будет очищен. Продолжить?',
    mtWarning, mbYesNo, 0) = idNo then exit;


  Excel := TExcelReport.Create;
  Excel.OpenBooks(OpenDialog1.FileName, false);
  Excel.SetActiveBook(1);
  Excel.SetActiveSheet(1);

  row := 2;
  str := Excel.ReadCell(row,1);

  WordModel.DeleteAll;
  WordModel.RefreshWord;

  while not(str = '') do
  begin
    WordModel.Insert(Excel.ReadCell(row,1), StrToFloatDef(Excel.ReadCell(row, 2), -1));
    inc(row);
    str := Excel.ReadCell(row,1);
  end;

  Excel.CloseBooks;
  Excel.free;

end;

procedure TMainForm.SaveBtnClick(Sender: TObject);
begin
  WordModel.Save;
end;


procedure TMainForm.SaveResultBtnClick(Sender: TObject);
begin
  N1.Click;
end;

// парсинг =============
function CatLastSymbol(source: string):string;
var
  l: integer;
begin
  if source = '' then exit; 

  l := Length(source);
  if source[l] = ','  then
    source := copy(source, 0, l-1);
  if source[l] = '.'  then
    source := copy(source, 0, l-1);
  if source[l] = ';'  then
    source := copy(source, 0, l-1);
  if source[l] = ':'  then
    source := copy(source, 0, l-1);
  if source[l] = '!'  then
    source := copy(source, 0, l-1);
  if source[l] = '?'  then
    source := copy(source, 0, l-1);

  result := source;
end;

procedure TMainForm.StartParsBtnClick(Sender: TObject);
type
  TWord =record
    str: string;
    state: boolean;
    amount: real;
    StartSelect: integer;
    LengthSelect: integer;
  end;
var
  end_pos: integer;
  front_pos: integer;

  LengthWord: integer; //длина слова
  Point: integer; //позиция чтения

  InputText: TStringList;
  ParsText: TstringList;
  OutputText: array of TWord;
  temp: TWord;

  sTemp, str: string;
  OutputCount: integer;
  i, j: integer;
  descision: boolean;
begin
  if WordModel.IsEmpty then
  begin
    ShowMessage('Словарь пуст. Заполните словарь перед проведением парсинга.');
    exit;
  end;

  if SoursePath = '' then
  begin
    ShowMessage('Не выбран файл для парсинга. Выбирете файл перед проведением парсинга.');
    exit;
  end;

  end_pos := StrToIntDef(ChvostEdit.text, -1);

  if end_pos < 0 then
  begin
    ShowMessage('Размер "хвоста" должен быть не отрицательным числом. Введите корректный размер "хвоста" для проведения парсинга.');
    exit;
  end;

  front_pos := StrToIntDef(NosEdit.text, -1);

  if front_pos < 0 then
  begin
    ShowMessage('Размер "носа" должен быть не отрицательным числом. Введите корректный размер "носа" для проведения парсинга.');
    exit;
  end;

  DBGrid1.DataSource.DataSet.DisableControls;
  //сканирование файла
  InputText := TStringList.Create;
  if fileExists(SoursePath) then
    InputText.LoadFromFile(SoursePath)
    else
    begin
      ShowMessage('Не найден файл для парсинга.');
      exit;
    end;

  point := 0;
  LengthWord := 0;
  OutputCount := 0;
  ParsText := TStringList.Create;

  //распарсиваем текст на слова
  while Length(InputText.Text) <> point do
  begin
    str := copy(InputText.Text, point , 1);

    //запускаем чтение слова.
    if (str <> ' ') then
      inc(LengthWord)
    else  //если нашли пробел пишем слово.
    begin
      sTemp :=copy(InputText.Text, point-LengthWord, LengthWord);

      sTemp := StringReplace(sTemp, #13, '', [rfReplaceAll]);
      sTemp := StringReplace(sTemp, #10, '', [rfReplaceAll]);

      ParsText.Add(sTemp);
      LengthWord := 0;
    end;

    inc(point);

    //проверка на последнее слово
    if (Length(InputText.Text) = Point) and (LengthWord <> 0) then
    begin
      sTemp :=copy(InputText.Text, point-LengthWord, LengthWord);

      sTemp := StringReplace(sTemp, #13, '', [rfReplaceAll]);
      sTemp := StringReplace(sTemp, #10, '', [rfReplaceAll]);

      ParsText.Add(sTemp);
      LengthWord := 0;
    end;
  end;

  //освобождаем исходник
  InputText.Free;

  //ищем в словах морфемы
  with WordModel do
  begin
  //перебор слов
  i := -1;

  while ((ParsText.Count-1) > i) do
  begin
    inc(i);

    //перебор морфем
    ADQueryWord.First;
    while not(ADQueryWord.eof) do
    begin
      //если находим морфему

      //проверяем настройки поиска
      if SettingSearchGroup.ItemIndex = 1 then
      // для нечеткого вхождения
        if ansipos(LowerCase(GetWord), LowerCase(ParsText.Strings[i])) <> 0 then
          descision := true
        else descision := false
      else        //строгое соответствие
        if AnsiLowerCase(GetWord) = CatLastSymbol(AnsiLowerCase(ParsText.Strings[i])) then
            descision := true
        else descision := false;


      if descision then
      begin
        Point := Length(OutputText);
        SetLength(OutputText, Point+1);

        str := '';
        for j := i-front_pos to i+end_pos do
          if (j >=0) and (j<ParsText.Count) then //чтоб не вылететь за границы массива
            if j <> i then
              str := str + ' ' + trim(ParsText.Strings[j])
            else
              str := str + ' [' + trim(ParsText.Strings[j])+']';

        OutputText[Point].str := str;
        OutputText[Point].amount := GetW;
        OutputText[point].StartSelect := ansipos(LowerCase(ParsText.Strings[i]), str);
        OutputText[point].LengthSelect := Length(trim(ParsText.Strings[i]));

        break;
      end;
      ADQueryWord.Next;
    end;

  end;
  end;

  //сортировка результата
  for I := 0 to Length(OutputText)-2 do
  begin
    for j := 0 to Length(OutputText)-(i+2) do
      if OutputText[j].amount > OutputText[j+1].amount then
        begin
          temp := OutputText[j];
          OutputText[j] := OutputText[j+1];
          OutputText[j+1] := temp;
        end;
  end;

  DBGrid1.DataSource.DataSet.EnableControls;
  //вывод в Memo текста
  OutputMemo.Lines.Clear;
  for I := 0 to Length(OutputText)-1 do
     OutputMemo.Lines.Add(OutputText[i].str);

  //Подсветка найденых морфем
  OutputCount := 1;
  for I := 0 to Length(OutputMemo.Text)-1 do
    begin
      if OutputMemo.Lines.Text[i] = '[' then
        begin
          OutputMemo.SelStart := i-OutputCount;
          inc(OutputCount);
        end;
      if OutputMemo.Lines.Text[i] = ']' then
      begin
        OutputMemo.SelLength := i - OutputMemo.SelStart-OutputCount+2;
        OutputMemo.SelAttributes.Color := clred;
      end;
    end;


  showMessage('Парсинг окончен.');

end;

end.


