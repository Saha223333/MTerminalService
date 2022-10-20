object MainForm: TMainForm
  Left = 1040
  Top = 114
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1057#1080#1085#1093#1088#1086#1085#1080#1079#1072#1094#1080#1103' '#1089' '#1084#1086#1073#1080#1083#1100#1085#1099#1084' '#1090#1077#1088#1084#1080#1085#1072#1083#1086#1084
  ClientHeight = 647
  ClientWidth = 348
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 586
    Width = 39
    Height = 13
    Caption = 'Label1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 434
    Width = 49
    Height = 13
    Caption = #1055#1088#1086#1075#1088#1077#1089#1089
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 472
    Width = 40
    Height = 13
    Caption = #1054#1096#1080#1073#1082#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object PB: TRzProgressBar
    Left = 9
    Top = 450
    Width = 328
    Height = 20
    BorderOuter = fsFlat
    BorderWidth = 0
    InteriorOffset = 0
    PartsComplete = 0
    Percent = 0
    TotalParts = 0
  end
  object Label4: TLabel
    Left = 8
    Top = 616
    Width = 39
    Height = 13
    Caption = 'Label4'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 168
    Top = 592
    Width = 3
    Height = 13
    Visible = False
  end
  object RzL: TRzLabel
    Left = 61
    Top = 434
    Width = 3
    Height = 13
    BlinkColor = clRed
  end
  object Button1: TButton
    Left = 8
    Top = 0
    Width = 33
    Height = 17
    Caption = 'Account'
    TabOrder = 0
    Visible = False
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 40
    Top = 0
    Width = 41
    Height = 17
    Caption = 'Account_electro'
    TabOrder = 1
    Visible = False
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 80
    Top = 0
    Width = 33
    Height = 17
    Caption = 'Additional_account'
    TabOrder = 2
    Visible = False
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 112
    Top = 0
    Width = 33
    Height = 17
    Caption = 'Additional_info'
    TabOrder = 3
    Visible = False
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 144
    Top = 0
    Width = 33
    Height = 17
    Caption = 'Balance'
    TabOrder = 4
    Visible = False
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 176
    Top = 0
    Width = 33
    Height = 17
    Caption = 'Balance_account'
    TabOrder = 5
    Visible = False
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 208
    Top = 0
    Width = 33
    Height = 17
    Caption = 'Clasure'
    TabOrder = 6
    Visible = False
    OnClick = Button7Click
  end
  object Button8: TButton
    Left = 8
    Top = 16
    Width = 33
    Height = 17
    Caption = 'Last_614'
    TabOrder = 7
    Visible = False
    OnClick = Button8Click
  end
  object Button9: TButton
    Left = 40
    Top = 16
    Width = 33
    Height = 17
    Caption = 'Map'
    TabOrder = 8
    Visible = False
    OnClick = Button9Click
  end
  object Button10: TButton
    Left = 72
    Top = 16
    Width = 33
    Height = 17
    Caption = 'Metering'
    TabOrder = 9
    Visible = False
    OnClick = Button10Click
  end
  object Button11: TButton
    Left = 104
    Top = 16
    Width = 33
    Height = 17
    Caption = 'Plm_net'
    TabOrder = 10
    Visible = False
    OnClick = Button11Click
  end
  object Button12: TButton
    Left = 128
    Top = 16
    Width = 33
    Height = 17
    Caption = 'Point'
    TabOrder = 11
    Visible = False
    OnClick = Button12Click
  end
  object Button13: TButton
    Left = 160
    Top = 16
    Width = 33
    Height = 17
    Caption = 'Task'
    TabOrder = 12
    Visible = False
    OnClick = Button13Click
  end
  object Button14: TButton
    Left = 192
    Top = 16
    Width = 33
    Height = 17
    Caption = 'Type_unit'
    TabOrder = 13
    Visible = False
    OnClick = Button14Click
  end
  object Button15: TButton
    Left = 280
    Top = 0
    Width = 33
    Height = 17
    Caption = 'Unit'
    TabOrder = 14
    Visible = False
    OnClick = Button15Click
  end
  object Button16: TButton
    Left = 224
    Top = 16
    Width = 33
    Height = 17
    Caption = 'Unit_power'
    TabOrder = 15
    Visible = False
    OnClick = Button16Click
  end
  object Button17: TButton
    Left = 256
    Top = 16
    Width = 81
    Height = 17
    Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1041#1044
    TabOrder = 16
    Visible = False
    OnClick = Button17Click
  end
  object Memo1: TRzMemo
    Left = 8
    Top = 488
    Width = 329
    Height = 89
    TabOrder = 17
    FrameVisible = True
  end
  object Grid: TDBGridEh
    Left = 8
    Top = 40
    Width = 329
    Height = 361
    DataSource = DataSource1
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    RowDetailPanel.Color = clBtnFace
    TabOrder = 18
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object DBNavigator1: TDBNavigator
    Left = 72
    Top = 616
    Width = 240
    Height = 25
    DataSource = DataSource1
    TabOrder = 19
    Visible = False
  end
  object DirLB: TDirectoryListBox
    Left = 192
    Top = 40
    Width = 145
    Height = 97
    ItemHeight = 16
    TabOrder = 20
  end
  object Button20: TButton
    Left = 64
    Top = 576
    Width = 75
    Height = 25
    Caption = 'Button20'
    TabOrder = 21
    OnClick = Button20Click
  end
  object Button18: TButton
    Left = 160
    Top = 584
    Width = 75
    Height = 25
    Caption = 'Button18'
    TabOrder = 22
    OnClick = Button18Click
  end
  object DB: TTable
    Left = 56
    Top = 72
  end
  object DataSource1: TDataSource
    DataSet = DB
    Left = 24
    Top = 104
  end
  object ODSLS: TOracleDataSet
    SQL.Strings = (
      'select a.ls,a.dom || '#39'-'#39' || a.korp as HOUSE,a.flat '
      
        ',b.fam,b.im,b.otch,c.zav_nom,c.type_sch,d.type_street || d.name_' +
        'street as STREET,e.name,nvl(f.name,'#39#1058#1055'-000'#39') as name_tp'
      ',h.name as uchastok'
      ''
      
        'from esbp.ls a,esbp.ab b,esbp.schetch c,esbp.street d,esbp.type_' +
        'sch e,esbs.en_objects f'
      ',esbp.bilds g,esbp.uchastok h'
      ''
      
        'where a.dkd>sysdate and b.dkd>sysdate and a.ls=b.ls and a.ls=c.l' +
        's and b.ls=c.ls and c.dkd>sysdate and d.street=a.street'
      'and c.type_sch=e.type_sch and a.id_en_obj=f.id_en_obj(+)'
      
        'and a.taun=g.taun and a.street=g.street and a.dom=g.dom and a.ko' +
        'rp=g.korp and g.uchastok=h.uchastok'
      ''
      
        'and e.type_sch in (89,101,121,108,148,414,501,64,915) and a.taun' +
        '=d.taun'
      ''
      
        'and c.zav_nom<>'#39'229783'#39' and a.ls<>962000 and a.ls<>503330 and a.' +
        'ls<>40026890 and a.ls<>40061550'
      'and a.ls<>530320 --and d.street=469'
      '--and h.name = '#39#1047#1072#1088#1077#1082#1080#39)
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      040000000C000000020000004C5301000000000005000000484F555345010000
      00000004000000464C41540100000000000300000046414D0100000000000200
      0000494D010000000000040000004F544348010000000000070000005A41565F
      4E4F4D01000000000008000000545950455F534348010000000000040000004E
      414D4501000000000006000000535452454554010000000000070000004E414D
      455F5450010000000000080000005543484153544F4B010000000000}
    Session = OS
    Left = 88
    Top = 104
    object ODSLSLS: TIntegerField
      FieldName = 'LS'
      Required = True
    end
    object ODSLSHOUSE: TStringField
      FieldName = 'HOUSE'
      Size = 45
    end
    object ODSLSFLAT: TStringField
      FieldName = 'FLAT'
      Required = True
      Size = 10
    end
    object ODSLSFAM: TStringField
      FieldName = 'FAM'
      Required = True
      Size = 30
    end
    object ODSLSIM: TStringField
      FieldName = 'IM'
      Required = True
      Size = 30
    end
    object ODSLSOTCH: TStringField
      FieldName = 'OTCH'
      Size = 30
    end
    object ODSLSZAV_NOM: TStringField
      FieldName = 'ZAV_NOM'
      Required = True
    end
    object ODSLSTYPE_SCH: TIntegerField
      FieldName = 'TYPE_SCH'
      Required = True
    end
    object ODSLSSTREET: TStringField
      FieldName = 'STREET'
      Size = 36
    end
    object ODSLSNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 60
    end
    object ODSLSNAME_TP: TStringField
      FieldName = 'NAME_TP'
      Required = True
      Size = 128
    end
    object ODSLSUCHASTOK: TStringField
      FieldName = 'UCHASTOK'
      Required = True
      Size = 30
    end
  end
  object OS: TOracleSession
    LogonUsername = 'esbp'
    LogonPassword = 'esbp'
    LogonDatabase = 'ORCL.LOCAL.SKEK.RU'
    Left = 24
    Top = 136
  end
  object DBQ: TQuery
    ParamCheck = False
    Left = 24
    Top = 232
  end
  object DataSource2: TDataSource
    DataSet = DBQ
    Left = 56
    Top = 200
  end
  object OS2: TOracleSession
    LogonUsername = 'askue'
    LogonPassword = 'askue'
    LogonDatabase = 'ORCL.LOCAL.SKEK.RU'
    Left = 24
    Top = 168
  end
  object OQ: TOracleQuery
    Session = OS2
    Optimize = False
    Left = 56
    Top = 168
  end
  object OP: TOraclePackage
    Session = OS2
    PackageName = 'askue_proc'
    Left = 24
    Top = 200
  end
  object ODSDatch_m: TOracleDataSet
    SQL.Strings = (
      
        'select * from esbp.datch_m_ls where ls = :ls and dkd>sysdate and' +
        ' zav_nom<>'#39'03078614'#39)
    Optimize = False
    Variables.Data = {0300000001000000030000003A4C5303000000040000008A05020000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000700000003000000494452010000000000020000004C530100000000
      000C000000545950455F44415443485F4D0100000000000400000046415A4101
      0000000000070000005A41565F4E4F4D01000000000003000000444E44010000
      00000003000000444B44010000000000}
    Master = ODSLS
    MasterFields = 'LS'
    DetailFields = 'LS'
    Session = OS
    Left = 56
    Top = 104
  end
  object DataSource3: TDataSource
    DataSet = ODSLS
    Left = 88
    Top = 136
  end
  object DataSource4: TDataSource
    DataSet = ODSDatch_m
    Left = 56
    Top = 136
  end
  object DB2: TTable
    Left = 88
    Top = 72
  end
  object Launcher: TRzLauncher
    Action = 'Open'
    Timeout = -1
    WaitType = wtProcessMessages
    WaitUntilFinished = True
    Left = 24
    Top = 368
  end
end
