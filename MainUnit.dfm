object MainForm: TMainForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #1055#1088#1086#1075#1088#1072#1084#1084#1085#1099#1081' '#1082#1086#1084#1087#1083#1077#1082#1089' "'#1058#1077#1086#1088#1080#1103' 123"'
  ClientHeight = 673
  ClientWidth = 1011
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 84
    Height = 13
    Caption = #1048#1089#1093#1086#1076#1085#1099#1081' '#1092#1072#1081#1083':'
  end
  object Label2: TLabel
    Left = 16
    Top = 38
    Width = 47
    Height = 13
    Caption = #1057#1083#1086#1074#1072#1088#1100':'
  end
  object Label3: TLabel
    Left = 542
    Top = 71
    Width = 73
    Height = 13
    Caption = #1056#1072#1079#1084#1077#1088' '#1093#1074#1086#1089#1090#1072
  end
  object Label4: TLabel
    Left = 542
    Top = 147
    Width = 97
    Height = 13
    Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090' '#1072#1085#1072#1083#1080#1079#1072
  end
  object Label5: TLabel
    Left = 542
    Top = 44
    Width = 61
    Height = 13
    Caption = #1056#1072#1079#1084#1077#1088' '#1085#1086#1089#1072
  end
  object PathEdit: TEdit
    Left = 112
    Top = 8
    Width = 422
    Height = 21
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 0
  end
  object ViewBtn: TButton
    Left = 540
    Top = 8
    Width = 75
    Height = 25
    Caption = #1054#1073#1079#1086#1088'...'
    TabOrder = 1
    OnClick = ViewBtnClick
  end
  object ChvostEdit: TEdit
    Left = 638
    Top = 68
    Width = 104
    Height = 21
    TabOrder = 2
    Text = '5'
  end
  object NosEdit: TEdit
    Left = 638
    Top = 41
    Width = 104
    Height = 21
    TabOrder = 3
    Text = '2'
  end
  object UpDown1: TUpDown
    Left = 742
    Top = 68
    Width = 16
    Height = 21
    Associate = ChvostEdit
    Position = 5
    TabOrder = 4
  end
  object UpDown2: TUpDown
    Left = 742
    Top = 41
    Width = 16
    Height = 21
    Associate = NosEdit
    Position = 2
    TabOrder = 5
  end
  object StartParsBtn: TButton
    Left = 542
    Top = 95
    Width = 467
    Height = 46
    Caption = #1057#1090#1072#1088#1090
    TabOrder = 6
    OnClick = StartParsBtnClick
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 57
    Width = 321
    Height = 608
    DataSource = WordModel.DataSourceWord
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnTitleClick = DBGrid1TitleClick
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
        Width = 73
        Visible = True
      end>
  end
  object DelBtn: TButton
    Left = 343
    Top = 363
    Width = 193
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100' '#1084#1086#1088#1092#1077#1084#1091
    TabOrder = 8
    OnClick = DelBtnClick
  end
  object GroupBox1: TGroupBox
    Left = 343
    Top = 205
    Width = 185
    Height = 152
    Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1084#1086#1088#1092#1077#1084#1099
    TabOrder = 9
    object Label6: TLabel
      Left = 16
      Top = 24
      Width = 50
      Height = 13
      Caption = #1052#1086#1088#1092#1077#1084#1072':'
    end
    object Label7: TLabel
      Left = 16
      Top = 64
      Width = 21
      Height = 13
      Caption = #1042#1077#1089':'
    end
    object DBEdit1: TDBEdit
      Left = 17
      Top = 43
      Width = 160
      Height = 21
      DataField = 'words'
      DataSource = WordModel.DataSourceWord
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 17
      Top = 83
      Width = 160
      Height = 21
      DataField = 'amount'
      DataSource = WordModel.DataSourceWord
      TabOrder = 1
    end
    object SaveBtn: TButton
      Left = 15
      Top = 110
      Width = 162
      Height = 25
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      TabOrder = 2
      OnClick = SaveBtnClick
    end
  end
  object OutputMemo: TRichEdit
    Left = 542
    Top = 166
    Width = 467
    Height = 459
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 10
  end
  object SaveResultBtn: TButton
    Left = 542
    Top = 631
    Width = 467
    Height = 34
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1088#1077#1079#1091#1083#1100#1090#1072#1090' '#1074' '#1092#1072#1081#1083
    TabOrder = 11
    OnClick = SaveResultBtnClick
  end
  object GroupBox2: TGroupBox
    Left = 343
    Top = 57
    Width = 185
    Height = 142
    Caption = #1053#1086#1074#1072#1103' '#1084#1086#1088#1092#1077#1084#1072
    TabOrder = 12
    object Label8: TLabel
      Left = 16
      Top = 16
      Width = 50
      Height = 13
      Caption = #1052#1086#1088#1092#1077#1084#1072':'
    end
    object Label9: TLabel
      Left = 16
      Top = 56
      Width = 21
      Height = 13
      Caption = #1042#1077#1089':'
    end
    object AddBtn: TButton
      Left = 15
      Top = 109
      Width = 154
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1084#1086#1088#1092#1077#1084#1091
      TabOrder = 0
      OnClick = AddBtnClick
    end
    object WordEdit: TEdit
      Left = 16
      Top = 35
      Width = 153
      Height = 21
      TabOrder = 1
    end
    object WightEdit: TEdit
      Left = 16
      Top = 75
      Width = 153
      Height = 21
      TabOrder = 2
    end
  end
  object ImportBtn: TButton
    Left = 343
    Top = 400
    Width = 193
    Height = 25
    Caption = #1048#1084#1087#1086#1088#1090' '#1089#1083#1086#1074#1072#1088#1103' '#1080#1079' Excel'
    TabOrder = 13
    OnClick = ImportBtnClick
  end
  object RichEdit1: TRichEdit
    Left = 151
    Top = 421
    Width = 650
    Height = 89
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      #1055#1088#1086#1075#1088#1072#1084#1084#1085#1099#1081' '#1082#1086#1084#1087#1083#1077#1082#1089' '#171#1058#1077#1086#1088#1080#1103' 123'#187'.  '#1042#1077#1088#1089#1080#1103': 2.3.'
      #1042#1089#1077' '#1087#1088#1072#1074#1072' '#1079#1072#1097#1080#1097#1077#1085#1099'. 2014-2015 ('#1089'). '
      #1053#1072#1096' '#1089#1072#1081#1090': 123theory.ru'
      '__________________________________________________'
      #1056#1045#1047#1059#1051#1068#1058#1040#1058' '#1055#1054#1048#1057#1050#1040':')
    ParentFont = False
    TabOrder = 14
    Visible = False
  end
  object SettingSearchGroup: TRadioGroup
    Left = 784
    Top = 38
    Width = 185
    Height = 51
    Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1087#1086#1080#1089#1082#1072
    ItemIndex = 0
    Items.Strings = (
      #1057#1090#1088#1086#1075#1080#1081' '#1087#1086#1080#1089#1082
      #1042#1093#1086#1078#1076#1077#1085#1080#1103)
    TabOrder = 15
  end
  object MainMenu1: TMainMenu
    Left = 584
    Top = 40
    object Afqk1: TMenuItem
      Caption = #1060#1072#1081#1083
      object N4: TMenuItem
        Caption = #1048#1089#1093#1086#1076#1085#1099#1081' '#1092#1072#1081#1083'...'
        OnClick = N4Click
      end
      object Excel1: TMenuItem
        Caption = #1048#1084#1087#1086#1088#1090' '#1089#1083#1086#1074#1072#1088#1103' '#1080#1079' Excel'
        OnClick = Excel1Click
      end
      object N1: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1088#1077#1079#1091#1083#1100#1090#1072#1090' '#1074' '#1092#1072#1081#1083'...'
        OnClick = N1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object N3: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = N3Click
      end
    end
    object N5: TMenuItem
      Caption = #1055#1086#1084#1086#1097#1100
      OnClick = N5Click
    end
    object N6: TMenuItem
      Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
      OnClick = N6Click
    end
  end
  object OpenTextFileDialog1: TOpenTextFileDialog
    Filter = #1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1092#1072#1081#1083'|*.txt'
    Left = 648
    Top = 40
  end
  object SaveDialog1: TSaveDialog
    Filter = 'RTF|*.rtf'
    Left = 656
  end
  object OpenDialog1: TOpenDialog
    Filter = 'MS Excel 2007-2010|*.xlsx|MS Excel 97-2003|*.xls'
    Left = 368
    Top = 432
  end
end
