object WordModel: TWordModel
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 354
  Width = 391
  object ADConnection1: TADConnection
    Params.Strings = (
      'Database=D:\Delphi Projects\'#1055#1072#1088#1089#1077#1088'\Win32\Debug\Db.db3'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 56
    Top = 56
  end
  object ADQueryWord: TADQuery
    Connection = ADConnection1
    Transaction = ADTransaction1
    SQL.Strings = (
      'select * from word_tab'
      'order by words')
    Left = 176
    Top = 56
  end
  object ADGUIxWaitCursor1: TADGUIxWaitCursor
    Left = 48
    Top = 232
  end
  object ADPhysSQLiteDriverLink1: TADPhysSQLiteDriverLink
    VendorLib = 'sqlite3.dll'
    Left = 176
    Top = 144
  end
  object ADTransaction1: TADTransaction
    Connection = ADConnection1
    Left = 48
    Top = 144
  end
  object ADQuerySQL: TADQuery
    Connection = ADConnection1
    Left = 280
    Top = 264
  end
  object DataSourceWord: TDataSource
    DataSet = ADQueryWord
    Left = 272
    Top = 64
  end
end
