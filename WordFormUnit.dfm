object WordForm: TWordForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1057#1083#1086#1074#1072#1088#1100
  ClientHeight = 560
  ClientWidth = 502
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 8
    Top = 16
    Width = 321
    Height = 537
    DataSource = WordModel.DataSourceWord
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'words'
        ReadOnly = True
        Title.Caption = #1052#1086#1088#1092#1077#1084#1072
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'amount'
        ReadOnly = True
        Title.Caption = #1042#1077#1089
        Visible = True
      end>
  end
  object AddBtn: TButton
    Left = 335
    Top = 16
    Width = 154
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 1
  end
  object DelBtn: TButton
    Left = 335
    Top = 56
    Width = 154
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100
    TabOrder = 2
  end
  object SaveBtn: TButton
    Left = 335
    Top = 96
    Width = 154
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 3
  end
  object GroupBox1: TGroupBox
    Left = 335
    Top = 136
    Width = 154
    Height = 121
    Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
    TabOrder = 4
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 46
      Height = 13
      Caption = #1052#1086#1088#1092#1077#1084#1072
    end
    object Label2: TLabel
      Left = 16
      Top = 64
      Width = 17
      Height = 13
      Caption = #1042#1077#1089
    end
    object DBEdit1: TDBEdit
      Left = 17
      Top = 43
      Width = 121
      Height = 21
      DataField = 'words'
      DataSource = WordModel.DataSourceWord
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 17
      Top = 83
      Width = 121
      Height = 21
      DataField = 'amount'
      DataSource = WordModel.DataSourceWord
      TabOrder = 1
    end
  end
end
