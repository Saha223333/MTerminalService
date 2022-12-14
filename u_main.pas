unit u_main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBTables, Grids, DBGrids, ExtCtrls, DBCtrls,
  Oracle, OracleData, ComCtrls, RzLabel, RzPrgres, RzDBProg, Buttons,
  RzButton, RzEdit, GridsEh, DBGridEh, RzLaunch,Bde, DBLists,
  RzShellDialogs, FileCtrl, Ora;

type
  TMainForm = class(TForm)
    Button1: TButton;
    DB: TTable;
    DataSource1: TDataSource;
	 ODSLS: TOracleDataSet;
    OS: TOracleSession;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
	 Button5: TButton;
	 Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
	 Button10: TButton;
    Button11: TButton;
    Button12: TButton;
	 Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    ODSLSLS: TIntegerField;
    ODSLSHOUSE: TStringField;
    ODSLSFLAT: TStringField;
    ODSLSFAM: TStringField;
    ODSLSIM: TStringField;
    ODSLSOTCH: TStringField;
    ODSLSZAV_NOM: TStringField;
    ODSLSTYPE_SCH: TIntegerField;
    ODSLSSTREET: TStringField;
    ODSLSNAME: TStringField;
    ODSLSNAME_TP: TStringField;
    DBQ: TQuery;
	 DataSource2: TDataSource;
    OS2: TOracleSession;
    OQ: TOracleQuery;
    OP: TOraclePackage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    PB: TRzProgressBar;
    Memo1: TRzMemo;
    Grid: TDBGridEh;
    Label4: TLabel;
    ODSLSUCHASTOK: TStringField;
    ODSDatch_m: TOracleDataSet;
    DataSource3: TDataSource;
    DataSource4: TDataSource;
    DB2: TTable;
    DBNavigator1: TDBNavigator;
    Launcher: TRzLauncher;
    Label5: TLabel;
    RzL: TRzLabel;
    DirLB: TDirectoryListBox;
    Button20: TButton;
    Button18: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button17Click(Sender: TObject);
	 procedure Button20Click(Sender: TObject);
	 procedure ClearDataBase;
	 procedure FormCreate(Sender: TObject);
	 procedure ImportThread(Path:String);
	 procedure ExportThread;
	 procedure Raznoska(Roll:integer);
    procedure Button18Click(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
	 { Private declarations }
  public
	 { Public declarations }
  end;

var
  MainForm: TMainForm;
	PathToDB:string;

implementation

uses QSTRINGS;
{$R *.dfm}

procedure TMainForm.Raznoska(Roll:integer);
var 
  ResStep: Integer;
  QueryTemp, MessLog: String;
  RaznoskaQuery: TOraQuery;
  OSPGetPoslPok : TOraStoredProc;
  OSPProvPokaz : TOraStoredProc;
  OSQLIns : TOraSQL;
  OSQLUpd : TOraSQL;
  OS : TOraSession;
  schls:integer;

begin 
  
 OS:= TOraSession.Create(Application);
 OS.ConnectString:='askue/askue@orcl';
 OS.Connected:=true;

 OSQLIns:=  TOraSQL.Create(Application);
 OSQLIns.Session:= OS;

 OSQLUpd:=  TOraSQL.Create(Application);
 OSQLUpd.Session:= OS;
   QueryTemp:='begin esbp.ESBP_PROC.GET_POSL_POK_SCH(:PLS, :PNSCHETCH, '
 +':PDAT_UST, :PNPOK, :PNPOKN, :PDAT_PPOK, :PKPOK, :PCKPOK, :PKPOK_N, :PCKPOK_N, :PKZ); end;';
 OSPGetPoslPok:=  TOraStoredProc.Create(Application);
 OSPGetPoslPok.Session:= OS;
 OSPGetPoslPok.StoredProcName:='esbp.ESBP_PROC.GET_POSL_POK_SCH';
 OSPGetPoslPok.SQL.Add(QueryTemp);
 OSPGetPoslPok.ParamByName('PLS').DataType:=ftFloat;
 OSPGetPoslPok.ParamByName('PLS').ParamType:= ptInput;
 OSPGetPoslPok.ParamByName('PNSCHETCH').DataType:=ftFloat;
 OSPGetPoslPok.ParamByName('PNSCHETCH').ParamType:= ptInput;
 OSPGetPoslPok.ParamByName('PDAT_UST').DataType:=ftDate;
 OSPGetPoslPok.ParamByName('PDAT_UST').ParamType:= ptInput;
 OSPGetPoslPok.ParamByName('PNPOK').DataType:=ftFloat;
 OSPGetPoslPok.ParamByName('PNPOK').ParamType:= ptInput;
 OSPGetPoslPok.ParamByName('PNPOKN').DataType:=ftFloat;
 OSPGetPoslPok.ParamByName('PNPOKN').ParamType:= ptInput;
 OSPGetPoslPok.ParamByName('PDAT_PPOK').DataType:=ftDate;
 OSPGetPoslPok.ParamByName('PDAT_PPOK').ParamType:= ptOutput;
 OSPGetPoslPok.ParamByName('PKPOK').DataType:=ftFloat;
 OSPGetPoslPok.ParamByName('PKPOK').ParamType:= ptOutput;
 OSPGetPoslPok.ParamByName('PCKPOK').DataType:=ftFloat;
 OSPGetPoslPok.ParamByName('PCKPOK').ParamType:= ptOutput;
 OSPGetPoslPok.ParamByName('PKPOK_N').DataType:=ftFloat;
 OSPGetPoslPok.ParamByName('PKPOK_N').ParamType:= ptOutput;
 OSPGetPoslPok.ParamByName('PCKPOK_N').DataType:=ftFloat;
 OSPGetPoslPok.ParamByName('PCKPOK_N').ParamType:= ptOutput;
 OSPGetPoslPok.ParamByName('PKZ').DataType:=ftFloat;
 OSPGetPoslPok.ParamByName('PKZ').ParamType:= ptOutput;

QueryTemp:=
 'begin ' +
  'esbp.ESBP_PROC.PROV_POKAZ(:PLS, :PNSCHETCH, :PZONN, :PZNACHN,' +
  ':PNDAT_POK, :PNPOK, :PCNPOK, :PNPOKN, ' +
  ':PCNPOKN, :PKDAT_POK, :PKPOK, :PKPOKN, :PCKPOK, :PCKPOKN, ' +
  ':PSUT_POSL_INT, :PSUT_NOV_INT, :POTKLON, :PSUT_POSL_INTN, '+
  ':PSUT_NOV_INTN, :POTKLONN, :PKZ); ' +
 'end; ';

 OSPProvPokaz:=  TOraStoredProc.Create(Application);
 OSPProvPokaz.Session:= OS;
 OSPProvPokaz.StoredProcName:='esbp.ESBP_PROC.PROV_POKAZ';
 OSPProvPokaz.SQL.Add(QueryTemp);
 OSPProvPokaz.ParamByName('PLS').DataType:=ftFloat;
 OSPProvPokaz.ParamByName('PLS').ParamType:= ptInput;
 OSPProvPokaz.ParamByName('PNSCHETCH').DataType:=ftFloat;
 OSPProvPokaz.ParamByName('PNSCHETCH').ParamType:= ptInput;
 OSPProvPokaz.ParamByName('PZONN').DataType:=ftFloat;
 OSPProvPokaz.ParamByName('PZONN').ParamType:= ptInput;
 OSPProvPokaz.ParamByName('PZNACHN').DataType:=ftFloat;
 OSPProvPokaz.ParamByName('PZNACHN').ParamType:= ptInput;
 OSPProvPokaz.ParamByName('PNDAT_POK').DataType:=ftDate;
 OSPProvPokaz.ParamByName('PNDAT_POK').ParamType:= ptinput;
 OSPProvPokaz.ParamByName('PNPOK').DataType:=ftFloat;
 OSPProvPokaz.ParamByName('PNPOK').ParamType:= ptInput;
 OSPProvPokaz.ParamByName('PCNPOK').DataType:=ftFloat;
 OSPProvPokaz.ParamByName('PCNPOK').ParamType:= ptInput;
 OSPProvPokaz.ParamByName('PNPOKN').DataType:=ftFloat;
 OSPProvPokaz.ParamByName('PNPOKN').ParamType:= ptInput;
 OSPProvPokaz.ParamByName('PCNPOKN').DataType:=ftFloat;
 OSPProvPokaz.ParamByName('PCNPOKN').ParamType:= ptInput;
 OSPProvPokaz.ParamByName('PKDAT_POK').DataType:=ftDate;
 OSPProvPokaz.ParamByName('PKDAT_POK').ParamType:= ptinput;
 OSPProvPokaz.ParamByName('PKPOK').DataType:=ftFloat;
 OSPProvPokaz.ParamByName('PKPOK').ParamType:= ptInput;
 OSPProvPokaz.ParamByName('PKPOKN').DataType:=ftFloat;
 OSPProvPokaz.ParamByName('PKPOKN').ParamType:= ptInput;
 OSPProvPokaz.ParamByName('PCKPOK').DataType:=ftFloat;
 OSPProvPokaz.ParamByName('PCKPOK').ParamType:= ptOutput;
 OSPProvPokaz.ParamByName('PCKPOKN').DataType:=ftFloat;
 OSPProvPokaz.ParamByName('PCKPOKN').ParamType:= ptOutput;
 OSPProvPokaz.ParamByName('PSUT_POSL_INT').DataType:=ftFloat;
 OSPProvPokaz.ParamByName('PSUT_POSL_INT').ParamType:= ptOutput;
 OSPProvPokaz.ParamByName('PSUT_NOV_INT').DataType:=ftFloat;
 OSPProvPokaz.ParamByName('PSUT_NOV_INT').ParamType:= ptOutput;
 OSPProvPokaz.ParamByName('POTKLON').DataType:=ftFloat;
 OSPProvPokaz.ParamByName('POTKLON').ParamType:= ptOutput;
 OSPProvPokaz.ParamByName('POTKLONN').DataType:=ftFloat;
 OSPProvPokaz.ParamByName('POTKLONN').ParamType:= ptOutput;
 OSPProvPokaz.ParamByName('PSUT_POSL_INTN').DataType:=ftFloat;
 OSPProvPokaz.ParamByName('PSUT_POSL_INTN').ParamType:= ptOutput;
 OSPProvPokaz.ParamByName('PSUT_NOV_INTN').DataType:=ftFloat;
 OSPProvPokaz.ParamByName('PSUT_NOV_INTN').ParamType:= ptOutput;
 OSPProvPokaz.ParamByName('PKZ').DataType:=ftFloat;
 OSPProvPokaz.ParamByName('PKZ').ParamType:= ptOutput;

 RaznoskaQuery:= TOraQuery.Create(Application);
 RaznoskaQuery.Session:= OS;
 RaznoskaQuery.FetchAll:= true;
 RaznoskaQuery.Close;

QueryTemp:= 'SELECT sv.id, '+
		 'ts.NAME, '+
		 'sv.ser_num, '+
		 'sv.val_date, '+
		 'sv.SCH_VAL1, '+
		 'sv.SCH_VAL2, '+
		 'sv.SCH_VAL3, '+
		 'sv.SCH_STAT_EXT,'+
		 ' askue.askue_proc.get_sch_num(ste.sch_type, sv.ser_num, sv.val_date) sch_num,'+
		 ' askue.askue_proc.get_sch_ls(ste.sch_type, sv.ser_num, sv.val_date) sch_ls,'+
		 ' askue.askue_proc.get_sch_addr(ste.sch_type, sv.ser_num, sv.val_date) sch_addr,'+
		 ' sv.add_val_step,'+
		 ' sv.add_val_log,'+
		 ' (SELECT ts.zonn_sch FROM esbp.type_sch ts WHERE ts.type_sch = ste.SCH_TYPE) sch_zon,'+
		 ' ste.SCH_TYPE,'+
		 ' sv.val_num,'+
		 ' sv.askue_src,'+
		 ' sv.inter_type,'+
		 ' askue.askue_proc.get_sch_date(ste.sch_type, sv.ser_num, sv.val_date) sch_date,'
		 +' askue.askue_proc.get_sch_npok(ste.sch_type, sv.ser_num, sv.val_date) sch_npok,'
		 +' askue.askue_proc.get_sch_npokn(ste.sch_type, sv.ser_num, sv.val_date) sch_npokn'
	  
+' FROM askue.sch_val sv,'+
	  ' askue.sch_type_ext ste,'+
	  ' esbp.type_sch ts'+
' WHERE sv.askue_src = ste.askue_src AND sv.inter_type = ste.inter_type'+
  ' AND sv.roll = :id'+
  ' AND ste.SCH_TYPE = ts.TYPE_SCH'+
' ORDER BY sv.ser_num, sv.val_date';     
 
 RaznoskaQuery.SQL.Text:= QueryTemp;
 RaznoskaQuery.ParamByName('id').AsInteger:= Roll; 
 RaznoskaQuery.Open; 

 RaznoskaQuery.Filtered:=false;
 RaznoskaQuery.Filter:='(sch_ls <> -1)';
 RaznoskaQuery.Filtered:=true;

RaznoskaQuery.First;
  while not RaznoskaQuery.Eof do begin
	 ResStep := 0; MessLog := '';
	 if (RaznoskaQuery.FieldByName('sch_num').AsInteger > 0) and
		 (RaznoskaQuery.FieldByName('add_val_step').AsInteger = 0) and
		 (RaznoskaQuery.FieldByName('add_val_step').AsInteger = 0) then begin
		// ==== ??????? ?????? ? ????????? ?? ????????? ====
		schls :=  RaznoskaQuery.FieldByName('sch_ls').AsInteger;
		OSPGetPoslPok.ParamByName('PLS').Value :=  schls;
		OSPGetPoslPok.ParamByName('PNSCHETCH').Value := RaznoskaQuery.FieldByName('sch_num').AsInteger;
		OSPGetPoslPok.ParamByName('PDAT_UST').Value := RaznoskaQuery.FieldByName('sch_date').AsDateTime;
		OSPGetPoslPok.ParamByName('PNPOK').Value := RaznoskaQuery.FieldByName('sch_npok').AsFloat;
		OSPGetPoslPok.ParamByName('PNPOKN').Value := RaznoskaQuery.FieldByName('sch_npokn').AsFloat;
		OSPGetPoslPok.Execute;
      ResStep := 1;
		if OSPGetPoslPok.ParamByName('PKZ').AsInteger > 0 then begin
		  case OSPGetPoslPok.ParamByName('PKZ').AsInteger of
			 1: MessLog := MessLog + '?????? ????? ?? ??????????; ';
			 2: MessLog := MessLog + '?????? ????? ?? ?? ????????; ';
			 3: MessLog := MessLog + '?? ?????????? ???????; ';
		  else
			 MessLog := MessLog + '?????? ?????????? ?????????; ';
		  end;
		end else begin
		  if OSPGetPoslPok.ParamByName('pdat_ppok').AsDateTime >=
			  RaznoskaQuery.FieldByName('val_date').AsDateTime then begin
			 MessLog := MessLog + '????????? ?? ?????????; ';
		  end else begin
			 OSPProvPokaz.ParamByName('PLS').Value := RaznoskaQuery.FieldByName('sch_ls').AsInteger;
			 OSPProvPokaz.ParamByName('PNSCHETCH').Value := RaznoskaQuery.FieldByName('sch_num').AsInteger;
			 OSPProvPokaz.ParamByName('PZONN').Value := RaznoskaQuery.FieldByName('sch_zon').AsInteger;
//          DM.OSPProvPokaz.ParamByName('PZNACHN').Value := 0;  // ???? ????????? ? ???????????
			 if OSPGetPoslPok.ParamByName('pdat_ppok').Value = RaznoskaQuery.FieldByName('sch_date').AsDateTime then
				OSPProvPokaz.ParamByName('PNDAT_POK').Value := OSPGetPoslPok.ParamByName('pdat_ppok').AsDateTime
			 else
				OSPProvPokaz.ParamByName('PNDAT_POK').Value := OSPGetPoslPok.ParamByName('pdat_ppok').AsDateTime + 1;
			 OSPProvPokaz.ParamByName('PNPOK').Value := OSPGetPoslPok.ParamByName('PKPOK').Value;
			 OSPProvPokaz.ParamByName('PCNPOK').Value := OSPGetPoslPok.ParamByName('PCKPOK').Value;
			 OSPProvPokaz.ParamByName('PNPOKN').Value := OSPGetPoslPok.ParamByName('PKPOK_N').Value;
			 OSPProvPokaz.ParamByName('PCNPOKN').Value := OSPGetPoslPok.ParamByName('PCKPOK_N').Value;
			 OSPProvPokaz.ParamByName('PKDAT_POK').Value := RaznoskaQuery.FieldByName('val_date').AsDateTime;
			 OSPProvPokaz.ParamByName('PKPOK').Value := RaznoskaQuery.FieldByName('sch_val1').AsFloat;
			 OSPProvPokaz.ParamByName('PKPOKN').Value := RaznoskaQuery.FieldByName('sch_val2').AsFloat;
			 OSPProvPokaz.Execute;
          ResStep := 2;
			 if (OSPProvPokaz.ParamByName('PKZ').AsInteger > 1) then begin
            case OSPProvPokaz.ParamByName('PKZ').AsInteger of
				  3: MessLog := MessLog + '?????? ?? ????????? ?????????????; ';
              4: MessLog := MessLog + '????????? ????????? ?????????; ';
				  8: MessLog := MessLog + '????????? ????????? ?????? 2000 ????; ';
            else
              MessLog := MessLog + '?????? ???????? ?????????; ';
				end;
			 end else begin
//+++++++++++++++++++++++++ ??? ????????? ??????? ????????? ++++++++++++++++++++++++
				OSQLIns.SQL.Clear;
				OSQLIns.SQL.Add('INSERT INTO esbp.POKAZ(LS, NSCHETCH, DND, DKD, IST_POK, NPOK, CNPOK, KPOK, CKPOK, NPOK_N, CNPOK_N, KPOK_N, CKPOK_N, STAT)');
				OSQLIns.SQL.Add('VALUES(:ls, :nschetch, :dnd, :dkd, :ist_pok, :npok, :cnpok, :kpok, :ckpok, :npok_n, :cnpok_n, :kpok_n, :ckpok_n, :stat_n)');
				OSQLIns.ParamByName('ls').Value := RaznoskaQuery.FieldByName('sch_ls').AsInteger;
				OSQLIns.ParamByName('nschetch').Value := RaznoskaQuery.FieldByName('sch_num').AsInteger;
            if OSPGetPoslPok.ParamByName('pdat_ppok').Value = RaznoskaQuery.FieldByName('sch_date').AsDateTime then
				  OSQLIns.ParamByName('dnd').Value := OSPGetPoslPok.ParamByName('pdat_ppok').Value
            else
				  OSQLIns.ParamByName('dnd').Value := OSPGetPoslPok.ParamByName('pdat_ppok').Value + 1;
				OSQLIns.ParamByName('dkd').Value := RaznoskaQuery.FieldByName('val_date').AsDateTime;
				OSQLIns.ParamByName('ist_pok').Value := 6;  // ?????
				OSQLIns.ParamByName('npok').Value := OSPGetPoslPok.ParamByName('PKPOK').AsFloat;
				OSQLIns.ParamByName('cnpok').Value := OSPGetPoslPok.ParamByName('PCKPOK').AsInteger;
				OSQLIns.ParamByName('kpok').Value := RaznoskaQuery.FieldByName('sch_val1').AsFloat;
				OSQLIns.ParamByName('ckpok').Value := OSPProvPokaz.ParamByName('PCKPOK').AsInteger;
				OSQLIns.ParamByName('npok_n').Value := OSPGetPoslPok.ParamByName('PKPOK_N').AsFloat;
				OSQLIns.ParamByName('cnpok_n').Value := OSPGetPoslPok.ParamByName('PCKPOK_N').AsInteger;
				OSQLIns.ParamByName('kpok_n').Value := RaznoskaQuery.FieldByName('sch_val2').AsFloat;
				OSQLIns.ParamByName('ckpok_n').Value := OSPProvPokaz.ParamByName('PCKPOKN').AsInteger;

				OSQLIns.ParamByName('stat_n').Value := RaznoskaQuery.FieldByName('SCH_STAT_EXT').AsString;
            try
				  ResStep := 3;
				  OSQLIns.Execute; 				 
				except
              on E: Exception do
					 begin
					  //	ShowMessage('');
						if Pos('?????. ?????. ??????????? ???????? ??????. ????????', E.Message) <> 0 then
						begin
						  ResStep := 2;
						  MessLog := MessLog + '?????. ?????. ??????????? ???????? ??????. ????????; ';
						  
						end;
					 end;
				end;
			 end;  // ???? ?????????
		  end;  // ???????????? ?????????
		end;  // ????????? ?????????? ?????????
	  OSQLUpd.SQL.Clear;
	  OSQLUpd.SQL.Add('UPDATE askue.sch_val SET add_val_step = :add_val_step, add_val_log = :add_val_log WHERE id = :id');
	  OSQLUpd.ParamByName('add_val_step').AsInteger := ResStep;
	  OSQLUpd.ParamByName('add_val_log').AsString := Trim(MessLog);
	  OSQLUpd.ParamByName('id').AsInteger := RaznoskaQuery.FieldByName('id').AsInteger;
	  OSQLUpd.Execute;
	 end;  // ??????-?? ???????

	 RaznoskaQuery.Next;
  end;  //????? ????? While
  
  OS.Commit;
  OS2.Commit;
end;

procedure TMainForm.ImportThread(Path:String);
var
 ls,account_id,unit_id,type_id,i:integer;
 date_m,number,w_str,time_m,sql,new_path:string;
 w_:real;
 accounts_mass:array [0..40000] of integer;
 NewRoll:integer;

Begin 
  //?????????? ??????? ?????????
  Memo1.Lines.Add('??????? ?????????');
  Memo1.Lines.Add('????? '+ Path);
  Memo1.Lines.Add('????? '+ DateTimeToStr(Now));

  MainForm.DB.Close;
  MainForm.DB.TableType := ttParadox;
  MainForm.DB.DatabaseName := Path;
  MainForm.DB.TableName := 'Metering';
  MainForm.DB.Open;
  MainForm.DB.First;
  //???????? ???
  MainForm.PB.PartsComplete:=0;
  MainForm.PB.TotalParts:=MainForm.DB.RecordCount;
	
  if MainForm.DB.RecordCount = 0 then 
	begin 
	 Memo1.Lines.Add('????????? ???'); 
	 Memo1.Lines.Add(chr(13));
	 exit; 
	end;

  MainForm.OP.PackageName:='askue_proc';
  NewRoll := OP.CallIntegerFunction('get_roll_id',[]);  

  Memo1.Lines.Add('?????? ?????? ?'+IntToStr(NewRoll));
  Memo1.Lines.Add('???-?? ????????? ? Metering '+IntToStr(MainForm.DB.RecordCount));

  OQ.SQL.Clear;
  sql := 'INSERT INTO askue.roll (id, roll_date, askue_src) VALUES (' + IntToStr(NewRoll) + ','''+ DateToStr(Date) + ''',3)';
  OQ.SQL.Add(sql);

  OQ.Execute;
  OS2.Commit;
  //???? ?? ??????????? ? ????????? ???????
  While not MainForm.DB.Eof do
	Begin
	 Try
	  //?????????? ?????? ?????? ? ??????????
	  account_id:=MainForm.DB.FieldByName('Account_id').AsInteger;
	  unit_id:=MainForm.DB.FieldByName('Unit_id').AsInteger;
	  date_m:=MainForm.DB.FieldByName('Date_m').AsString;
	  time_m:=MainForm.DB.FieldByName('Time_m').AsString;
	  //?????? ? ?????????? ??????? ?? ????? ????? ???????? ? ????
	  w_str:=MainForm.DB.FieldByName('W_').AsString;
	  w_str:=Q_ReplaceText(w_str,',','.');

	  if time_m='0:00:00' then
		 time_m:='0'+time_m;
		//????????? ??????? ???????  
		MainForm.DB2.Close;
		MainForm.DB2.TableType := ttParadox;
		MainForm.DB2.DatabaseName := Path;
		MainForm.DB2.TableName := 'Account';
		//???????? ??????? ????
		MainForm.DB2.Filter:='Account_id='+IntToStr(account_id);
		MainForm.DB2.Open;
		MainForm.DB2.Filtered:=true;
		//?????? ???????
		accounts_mass[Unit_id]:=MainForm.DB2.FieldByName('Account').AsInteger;

	  MainForm.OQ.Close;  
	  //??????? ?? ????????? ??????? ??? ?????? ? ???????
	  MainForm.OQ.SQL.Text:='insert into askue.metering_m values'+
						'('+IntToStr(account_id)+','+IntToStr(unit_id)+',to_date('''+date_m+' '
							+time_m+''','+'''DD:MM:YYYY HH24:MI:SS'''+'),'+
						w_str+','+MainForm.DB2.FieldByName('Account').AsString+')'; 

	  MainForm.OQ.Execute; 
	except
	  MainForm.Memo1.Lines.Add('?????? ??? ???????. Account_id='+IntToStr(account_id)+' '+
							'?????????='+w_str+' '+'????\?????='+date_m);
	  MainForm.DB.Next;
	  Continue; 
	end;

	  MainForm.DB.Next;

	MainForm.PB.IncPartsByOne; 
	End;

  //???? ?? ?????????
  MainForm.RzL.Caption:='??????????? ????? ?????...';
  //????????? ??????? ?????????
  MainForm.DB.Close;
  MainForm.DB.TableType := ttParadox;
  MainForm.DB.DatabaseName := Path;
  MainForm.DB.TableName := 'Unit';
  MainForm.DB.Open;
  MainForm.DB.First;
  //???????? ???
  MainForm.PB.PartsComplete:=0;
  MainForm.PB.TotalParts:=MainForm.DB.RecordCount;
	//???? ?? ??????????? ? ????????? ???????
  While not MainForm.DB.Eof do	
	Begin
	  unit_id:=MainForm.DB.FieldByName('Unit_id').AsInteger;
	  number:=MainForm.DB.FieldByName('Number_').AsString;
	  type_id:=MainForm.DB.FieldByName('Type_id').AsInteger;
															
	  ls:=accounts_mass[Unit_id];

	  MainForm.OQ.Close;
		//??????? ?? ????????? ??????? ??? ?????? ? ???????
	  MainForm.OQ.SQL.Text:='insert into askue.unit_m values ('+IntToStr(unit_id)+','''+number+''','
						+IntToStr(type_id)+','+IntToStr(ls)+')';
	  MainForm.OQ.Execute; 
	  MainForm.DB.Next;

	  MainForm.PB.IncPartsByOne;
	End;
	MainForm.DB.Close;
	//???????? ???????? ?????????
	MainForm.RzL.Caption:='???????? ???????? ?????????...';
	Sleep(1000);
	MainForm.OP.PackageName:='';
	MainForm.OP.CallProcedure('Update_RIMs',[]);
	MainForm.OP.CallProcedure('Get_MTerminal',[]);
	MainForm.OS2.Commit;

MainForm.Caption:='?????? ????????';

MainForm.RzL.Caption:='?????? ????????';
MainForm.RzL.Blinking:=false;

MainForm.Button17.Enabled:=true;

MainForm.DB.EnableControls;
Memo1.Lines.Add('???????? ????????');   
try
  Raznoska(NewRoll);
 except on E:Exception do
  begin
	 Memo1.Lines.Add('?????? ??? ????????: '+ E.Message);
	 Exit;
  end;
end;
Memo1.Lines.Add('???????? ?????? ???????');
//Memo1.Lines.Add('?????????? ????? ? ?????');
Memo1.Lines.Add(chr(13));
 {
 try
  new_path := Copy(path, 1, 20) + 'Archive' + Copy(path, 20, Length(path)); 
  //path := 'C:\MTerminalService\Db\Metering.db';
  //new_path :=  'C:\MTerminalService\Archive\Metering.db';
  MoveFile(PChar(Path), PChar(new_path));
  //CopyFile(PChar(Path), PChar(new_path), false);
 except on E:Exception do
  begin
	 Memo1.Lines.Add('?????? ??? ???????? ????? '+ E.Message);
	 Exit;
  end;
 end;
 }

 {
 try
 path := 'C:\MTerminalService\Db';  
  new_path := Copy(path, 1, 20) + 'Archive' + Copy(path, 20, Length(path)); 
  MoveFile(PChar(path), PChar(new_path));
 except on E:Exception do
  begin
	 Memo1.Lines.Add('?????? ??? ???????? ????? '+ E.Message);
	 Exit;
  end;
end;
}
End;

procedure TMainForm.ExportThread;
var
point_id,account_id,unit_id,type_id,possibility:integer;
l_group,l_address,point_name,street,house,flat,tenant,account,number,name_tp:string;

begin
PathToDB := 'C:\MTerminalService\Data';
point_id:=0; account_id:=0; unit_id:=0; type_id:=0; possibility:=0;
point_name:=''; street:='';  house:=''; flat:=''; tenant:=''; account:='';
number:=''; l_group:=''; l_address:='';

ClearDataBase;//??????? ???? ?????? ????? ?????????
ODSLS.First;

While not MainForm.ODSLS.Eof do
 begin
  //?????????? ????????????? ????? (point_id)
  inc(point_id);
  //?????????? ????? ?? ???????? ????????
  street:=MainForm.ODSLS.FieldByName('STREET').AsString;
  house:=MainForm.ODSLS.FieldByName('HOUSE').AsString;
  flat:=MainForm.ODSLS.FieldByName('FLAT').AsString;
  //????????? ??? ????? ?? ?? ??????
  point_name:=street+' '+house+'-'+flat;
  //????????? ??????? Point
  MainForm.DB.Close;
  MainForm.DB.TableType:= ttParadox;
  MainForm.DB.DatabaseName:= PathToDB;
  MainForm.DB.TableName:= 'Point';
  MainForm.DB.Open;
  //??????? ?????? ? ??????? Point ? ???????????????? ???????????
  MainForm.DB.Insert;
  MainForm.DB.FieldByName('Point_id').AsInteger:=point_id;
  MainForm.DB.FieldByName('Name').AsString:=point_name;
  MainForm.DB.Post;
  //?????????? ????????????? ???????? ?????
  inc(account_id);
  //??????????  ??????? ???? ?? ???????? ????????
  account:=IntToStr(MainForm.ODSLS.FieldByName('LS').AsInteger);
  //?????????? ???????? (???) ?? ???????? ????????
  tenant:=MainForm.ODSLS.FieldByName('FAM').AsString+' '
			  +MainForm.ODSLS.FieldByName('IM').AsString+' '
			  +MainForm.ODSLS.FieldByName('OTCH').AsString;
  //?????????? ?????????? ?? ???????? ????????
  name_tp:=MainForm.ODSLS.FieldByName('NAME_TP').AsString;
  //????????? ??????? Account
  MainForm.DB.Close;
  MainForm.DB.TableType:= ttParadox;
  MainForm.DB.DatabaseName:= PathToDB;
  MainForm.DB.TableName:= 'Account';
  MainForm.DB.Open;
  //??????? ?????? ? ??????? Account
  MainForm.DB.Insert;
  MainForm.DB.FieldByName('Account_id').AsInteger:=account_id;
  MainForm.DB.FieldByName('Street').AsString:=street;
  MainForm.DB.FieldByName('House').AsString:=house;
  MainForm.DB.FieldByName('Flat').AsString:=flat;
  MainForm.DB.FieldByName('Account').AsString:=account;
  MainForm.DB.FieldByName('Tenant').AsString:=tenant;
  MainForm.DB.FieldByName('Point_id').AsInteger:=point_id;
  //???? ??????? ???-109 ??? ???-129 ??? ???-489.19 ??? ???-489.01 ??? ???-189.11, ?? ? ????? ?????????? ????????? "???" 
	If (MainForm.ODSLS.FieldByName('TYPE_SCH').AsInteger=148) or
		(MainForm.ODSLS.FieldByName('TYPE_SCH').AsInteger=414) or
		(MainForm.ODSLS.FieldByName('TYPE_SCH').AsInteger=501) or
		(MainForm.ODSLS.FieldByName('TYPE_SCH').AsInteger=915) or
		(MainForm.ODSLS.FieldByName('TYPE_SCH').AsInteger=64) then
		MainForm.DB.FieldByName('Trans_Station').AsString:='??? '//+name_tp
		+' '+MainForm.ODSLS.FieldByName('UCHASTOK').AsString
	else
		MainForm.DB.FieldByName('Trans_Station').AsString:=name_tp;

  MainForm.DB.Post;
 //?????????? ????? ???????? ?? ???????? ????????
 number:=MainForm.ODSLS.FieldByName('ZAV_NOM').AsString;
 //?????????? ????? ??? ???????? ? ???????? ? ?????? ??????????????? ??? ? ?????????
 //? ????????????? ??????????????? ????????? ? ?????????? ????????????? ??-??
 case MainForm.ODSLS.FieldByName('TYPE_SCH').AsInteger of
  89:begin
		type_id:=32; possibility:=580; inc(unit_id);
	  end;
 101:begin
		type_id:=34; possibility:=836; inc(unit_id);
	  end;
 108:begin
		type_id:=33; possibility:=836; inc(unit_id);
	  end;
 121:begin
		type_id:=35; possibility:=836; inc(unit_id);
	  end;
 end; 

If (MainForm.ODSLS.FieldByName('TYPE_SCH').AsInteger=148) or
	 (MainForm.ODSLS.FieldByName('TYPE_SCH').AsInteger=414) or
	 (MainForm.ODSLS.FieldByName('TYPE_SCH').AsInteger=501) or
	 (MainForm.ODSLS.FieldByName('TYPE_SCH').AsInteger=915) or
	 (MainForm.ODSLS.FieldByName('TYPE_SCH').AsInteger=64) then
 begin

 case  MainForm.ODSLS.FieldByName('TYPE_SCH').AsInteger of
  148:begin//??? 109	
		 type_id:=8; possibility:=16385; inc(unit_id);
		end;
  414:begin//??? 129	
		 type_id:=56; possibility:=16901; inc(unit_id);
		end;
  501:begin//??? 489.19
		 type_id:=58; possibility:=541953; inc(unit_id);
		end;
  64:begin//??? 189.11
		 type_id:=61; possibility:=541697; inc(unit_id);
		end;
  915:begin//??? 489.01
		 type_id:=67; possibility:=541953; inc(unit_id);
		end;
  end;
 //???? ??????? ???? ???-109 ??? ???-129 ??? ???-489.19 ??? ???-189.11 ??? ???-489.01,
 //?? ??????? ??? ???????? ????? ????????? ?????????
 //? ???????????? ?? ?????? ???-??
 //????????? ??????? ???-?? ?? ???????? ????????
  If MainForm.ODSDatch_m.Active=true then 
	Begin
	 MainForm.ODSDatch_m.Close; 
	 MainForm.ODSDatch_m.SetVariable('ls',account);
	 MainForm.ODSDatch_m.Open; 
	End;

  MainForm.ODSDatch_m.First;
 //???? ?? ???-?? (??????? ???????? ? ????????? ???????)
 While not MainForm.ODSDatch_m.EOF do
  Begin
	 //?????????? ????????????? ??-??
	 inc(unit_id);
    //?????????? ????? ???????? ?? ??????? ???-??
	 number:=MainForm.ODSDatch_m.FieldByName('ZAV_NOM').AsString;
	 //???? ??????? ??? ????????? ???? ???-109 ? ???-129
	 //????????? ??????? Unit
	 MainForm.DB.Close;
	 MainForm.DB.TableType:= ttParadox;
	 MainForm.DB.DatabaseName:= PathToDB;
	 MainForm.DB.TableName:= 'Unit';
	 MainForm.DB.Open;
	 //??????? ???????
	 MainForm.DB.Insert;
	 MainForm.DB.FieldByName('Unit_id').AsInteger:=unit_id;
	 MainForm.DB.FieldByName('Number_').AsString:=number;
	 MainForm.DB.FieldByName('Type_id').AsInteger:=type_id;
	 MainForm.DB.FieldByName('Possibility').AsInteger:=Possibility;
	
		try
		 MainForm.DB.Post
		except
		 MainForm.Memo1.Lines.Add('?????? ????????. ????? ???????? '+number);
		 MainForm.ODSLS.Next; 
		 Continue;  
		end;
	//???? ????? ?????? ??-?? >= 4 ?? ????? ???????? ?????? ? ?????
	If length(number)>=4 then
	 begin
	  l_address:=Copy(number,length(number)-1,2);
	  if l_address = '00' then l_address := '100';
	  l_group:=Copy(number,length(number)-3,2);
	  if l_group = '00' then l_group := '100';
	  //????????? ??????? Plm_net
		MainForm.DB.Close;
		MainForm.DB.TableType:= ttParadox;
		MainForm.DB.DatabaseName:= PathToDB;
		MainForm.DB.TableName:= 'Plm_net';
		MainForm.DB.Open;
		//????????? ??????? Plm_net
		MainForm.DB.Insert;
		MainForm.DB.FieldByName('Unit_id').AsInteger:=unit_id;
		MainForm.DB.FieldByName('Number_').AsString:=number;
		MainForm.DB.FieldByName('L_group').AsInteger:=StrToInt(l_group);
		MainForm.DB.FieldByName('L_address').AsInteger:=StrToInt(l_address); 
		MainForm.DB.Post;
	 end;
	 //????????? ??????? Account_electro
	 MainForm.DB.Close;
	 MainForm.DB.TableType:= ttParadox;
	 MainForm.DB.DatabaseName:= PathToDB;
	 MainForm.DB.TableName:= 'Account_electro';
	 MainForm.DB.Open;
	 //????????? ??????? Account_electro
	 MainForm.DB.Insert;
	 MainForm.DB.FieldByName('Unit_id').AsInteger:=unit_id;
	 MainForm.DB.FieldByName('Account_id').AsInteger:=account_id;
	 MainForm.DB.Post;
	 //????????? ?????? ? ??????? ???-??
	 MainForm.ODSDatch_m.Next;
	end;//????? ????? ?? ???-?? While not ODSDatch_m.EOF
  //????????? ?????? ? ???????? ????????
  MainForm.ODSLS.Next;
  MainForm.PB.IncPartsByOne;
  Continue;
  end; //????? ??????? ?? ?????
  //????????? ???? ??????? ??? ???? ?????? ????? ?????????
  //????????? ??????? Unit
  MainForm.DB.Close;
  MainForm.DB.TableType:= ttParadox;
  MainForm.DB.DatabaseName:= PathToDB;
  MainForm.DB.TableName:= 'Unit';
  MainForm.DB.Open;
  //??????? ???????
  MainForm.DB.Insert;
  MainForm.DB.FieldByName('Unit_id').AsInteger:=unit_id;
  MainForm.DB.FieldByName('Number_').AsString:=number;
  MainForm.DB.FieldByName('Type_id').AsInteger:=type_id;
  MainForm.DB.FieldByName('Possibility').AsInteger:=Possibility;
	
	try
	 MainForm.DB.Post;
	except
	 MainForm.Memo1.Lines.Add('?????? ????????. ????? ???????? '+number);
	 MainForm.ODSLS.Next; 
	 Continue;  
	end;
  //????????? ??????? Account_electro 
  MainForm.DB.Close;
  MainForm.DB.TableType:= ttParadox;
  MainForm.DB.DatabaseName:= PathToDB;
  MainForm.DB.TableName:= 'Account_electro';
  MainForm.DB.Open;
  //????????? ??????? Account_electro
  MainForm.DB.Insert;
  MainForm.DB.FieldByName('Unit_id').AsInteger:=unit_id;
  MainForm.DB.FieldByName('Account_id').AsInteger:=account_id;
  MainForm.DB.Post;
  //????????? ?????? ? ???????? ????????
  MainForm.ODSLS.Next;
  MainForm.PB.IncPartsByOne;
 end;  //????? ???????? ????? While not ODSLS.Eof do

//MainForm.BitBtn1.Enabled:=true;
//Synchronize(MainForm.ODSLS.EnableControls);   
//Synchronize(MainForm.DB.EnableControls);

//MainForm.Button18.Enabled:=true; 
//MainForm.Button19.Enabled:=true;

//???????? ????? ?? ????????? ????????
//MainForm.Launcher.FileName:='C:\MTerminal\CopyDataExportKem.vbs';
//Synchronize(MainForm.Launcher.Launch);
  
//MainForm.Caption:='??????? ????????';
//ShowMessage('??????? ????????');

//MainForm.RzL.Caption:='??????? ????????';
//MainForm.RzL.Blinking:=false;
end;

procedure TMainForm.Button1Click(Sender: TObject);
begin
  
  DB.Active := False;
  DB.TableType := ttParadox;
  DB.DatabaseName := PathToDB;
  DB.TableName := 'Account';
  DB.Active := true;
			
label5.caption:=IntToStr(DB.RecordCount);

 Grid.Columns.Items[0].Width:=10;
 Grid.Columns.Items[1].Width:=100;
 Grid.Columns.Items[2].Width:=50;
 Grid.Columns.Items[3].Width:=50;
 Grid.Columns.Items[4].Width:=50;
 Grid.Columns.Items[5].Width:=50;
 Grid.Columns.Items[6].Width:=50;
 Grid.Columns.Items[7].Width:=50;
 Grid.Columns.Items[8].Width:=50;
 Grid.Columns.Items[9].Width:=50;
 Grid.Columns.Items[10].Width:=50;
	
end;

procedure TMainForm.Button2Click(Sender: TObject);
begin     
  DB.Active := False;
  DB.TableType := ttParadox;
  DB.DatabaseName := PathToDB;
  DB.TableName := 'Account_electro';
  DB.Active := true;
end;

procedure TMainForm.Button3Click(Sender: TObject);
begin
  DB.Active := False;
  DB.TableType := ttParadox;
  DB.DatabaseName := PathToDB;
  DB.TableName := 'Additional_account';
  DB.Active := true;
end;

procedure TMainForm.Button4Click(Sender: TObject);
begin
  DB.Active := False;
  DB.TableType := ttParadox;
  DB.DatabaseName := PathToDB;
  DB.TableName := 'Additional_info';
  DB.Active := true;
end;

procedure TMainForm.Button5Click(Sender: TObject);
begin
  DB.Active := False;
  DB.TableType := ttParadox;
  DB.DatabaseName := PathToDB;
  DB.TableName := 'Balance';
  DB.Active := true;
end;

procedure TMainForm.Button6Click(Sender: TObject);
begin
  DB.Active := False;
  DB.TableType := ttParadox;
  DB.DatabaseName := PathToDB;
  DB.TableName := 'Balance_account';
  DB.Active := true;
end;

procedure TMainForm.Button7Click(Sender: TObject);
begin
  DB.Active := False;
  DB.TableType := ttParadox;
  DB.DatabaseName := PathToDB;
  DB.TableName := 'Clasure';
  DB.Active := true;
end;

procedure TMainForm.Button8Click(Sender: TObject);
begin
  DB.Active := False;
  DB.TableType := ttParadox;
  DB.DatabaseName := PathToDB;
  DB.TableName := 'Last_614';
  DB.Active := true;
end;

procedure TMainForm.Button9Click(Sender: TObject);
begin
  DB.Active := False;
  DB.TableType := ttParadox;
  DB.DatabaseName := PathToDB;
  DB.TableName := 'Map';
  DB.Active := true;
end;

procedure TMainForm.Button10Click(Sender: TObject);
begin
  DB.Active := False;
  DB.TableType := ttParadox;
  DB.DatabaseName :=PathToDB;
  DB.TableName := 'Metering';
  DB.Active := true;

label5.caption:=IntToStr(DB.RecordCount);
end;

procedure TMainForm.Button11Click(Sender: TObject);
begin
  DB.Active := False;
  DB.TableType := ttParadox;
  DB.DatabaseName := PathToDB;
  DB.TableName := 'Plm_net';
  DB.Active := true;
end;

procedure TMainForm.Button12Click(Sender: TObject);
begin
  DB.Active := False;
  DB.TableType := ttParadox;
  DB.DatabaseName := PathToDB;
  DB.TableName := 'Point';
  DB.Active := true;
end;

procedure TMainForm.Button13Click(Sender: TObject);
begin
  DB.Active := False;
  DB.TableType := ttParadox;
  DB.DatabaseName := PathToDB;
  DB.TableName := 'Task';
  DB.Active := true;
end;

procedure TMainForm.Button14Click(Sender: TObject);
begin
  DB.Active := False;
  DB.TableType := ttParadox;
  DB.DatabaseName := PathToDB;
  DB.TableName := 'Type_unit';
  DB.Active := true;
end;

procedure TMainForm.Button15Click(Sender: TObject);
begin
  DB.Active := False;
  DB.TableType := ttParadox;
  DB.DatabaseName := PathToDB;
  DB.TableName := 'Unit';
  DB.Active := true;
end;

procedure TMainForm.Button16Click(Sender: TObject);
begin
  DB.Active := False;
  DB.TableType := ttParadox;
  DB.DatabaseName := PathToDB;
  DB.TableName := 'Unit_power';
  DB.Active := true;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
If OS.Connected=true then
 ODSLS.Active:=false;

If ODSLS.Active=true then
 OS.Connected:=false;
end;

procedure TMainForm.ClearDataBase;
begin
	 //??????? ????
//??????? ???????? ????? ????????
  DB.Active := False;
  DB.TableType := ttParadox;
  DB.DatabaseName := PathToDB;
  DB.TableName := 'Account_electro';

  DB.EmptyTable;
	
  DB.Active := False;
  DB.TableType := ttParadox;
  DB.DatabaseName := PathToDB;
  DB.TableName := 'Map';
  
  DB.EmptyTable;
  
  DB.Active := False;
  DB.TableType := ttParadox;
  DB.DatabaseName := PathToDB;
  DB.TableName := 'Clasure';
  
  DB.EmptyTable;

  DB.Active := False;
  DB.TableType := ttParadox;
  DB.DatabaseName := PathToDB;
  DB.TableName := 'Metering';
  
  DB.EmptyTable;
	
  DB.Active := False;
  DB.TableType := ttParadox;
  DB.DatabaseName := PathToDB;
  DB.TableName := 'Plm_net';
  
  DB.EmptyTable;

  DB.Active := False;
  DB.TableType := ttParadox;
  DB.DatabaseName := PathToDB;
  DB.TableName := 'Task';

  DB.EmptyTable;


  DB.Active := False;
  DB.TableType := ttParadox;
  DB.DatabaseName := PathToDB;
  DB.TableName := 'Unit_power';

  DB.EmptyTable;

  DB.Active := False;
  DB.TableType := ttParadox;
  DB.DatabaseName :=PathToDB;
  DB.TableName := 'Additional_account';

  DB.EmptyTable;
  
  DB.Active := False;
  DB.TableType := ttParadox;
  DB.DatabaseName := PathToDB;
  DB.TableName := 'Additional_info';

  DB.EmptyTable;

  DB.Active := False;
  DB.TableType := ttParadox;
  DB.DatabaseName := PathToDB;
  DB.TableName := 'Account';

  DB.EmptyTable;

	DB.Active := False;
	DB.TableType := ttParadox;
	DB.DatabaseName := PathToDB;
	DB.TableName := 'resttemp';
  try	
	DB.EmptyTable;
  except
	//ShowMessage('123');
  end;

  DB.Active := False;
  DB.TableType := ttParadox;
  DB.DatabaseName := PathToDB;
  DB.TableName := 'Point';

  DB.EmptyTable;

  DB.Active := False;
  DB.TableType := ttParadox;
  DB.DatabaseName := PathToDB;
  DB.TableName := 'Unit';
  
  DB.EmptyTable;
end;

procedure TMainForm.Button17Click(Sender: TObject);
begin
 ClearDataBase;
end;

procedure TMainForm.Button20Click(Sender: TObject);
var
i, a:integer;
s:string;
begin {
DirLB.Directory:='C:\MTerminalService\';
 button20.Caption := IntToStr(DirLB.Count);
 if DirLB.Count = 0 then exit;
  for i:= 3 to DirLB.Count-1 do
	begin
	 try
	  s:=  'C:\MTerminalService\' + DirLB.Items.Strings[i];
	  ImportThread(s);
	 except 
		on E:Exception do 
		 Begin
			Memo1.Lines.Add('?????? ??????? ?????????: '+ E.Message);
			Continue;
		 End;
	 end;
	end;
 //ExportThread;
  Memo1.Lines.SaveToFile('Log_import_export_' + DateToStr(Now) + '.txt');
}
end;

procedure TMainForm.FormCreate(Sender: TObject);
var 
i, a:integer;
s:string;

begin
If ParamCount<>0 then //???? ????????? ????????? ? ?????????? -i ??? ??????, ??? ????? ??????? ????????? ????????? ???????? ?????? 
	 If ParamStr(1)='-i' then	 //? ???????? ?? ?????
		ShowMessage('????????? ???????? ? ?????? ??????: ?????????? ?????? ???? ?????????! ?????? ?? ??? ???????????.');
{======?????????????? ???????? ??????====
1.??????? ? ????? ??? ????? ?????? ?? ????????? ???????? ???? ???? ? ?????????? ? ????? ?? ??????? ????? 
2.?? ??????? ??????? ???????? ?????? ?????? ???? ?????? (??? ???? ????? ??? ??????????? ??????)
3.???? ??? ? ????? ????????? ??????????? ????? ??????????? ?????
4.????? ????? ??????? ????????? ????????? ????? ? ???????????, ??????????? ? ?????????? (???? ????? ???????).	
  ??? ?? ????? ????? ????????? (???? ????? ????), ????????? ????????? ????????? ???? ?? ??????? ?????
}

If OS2.Connected=false then
 OS2.Connected:=true;

If OS.Connected=false then
 OS.Connected:=true;

If ODSLS.Active=false then
 ODSLS.Active:=true;

If ODSDatch_m.Active=false then
 ODSDatch_m.Active:=true;

DirLB.Directory:='C:\MTerminalService\';
 //button20.Caption := IntToStr(DirLB.Count);

 if DirLB.Count = 0 then Application.Terminate;
  for i:= 4 to DirLB.Count-1 do
	begin
	 try
	  s:='C:\MTerminalService\' + DirLB.Items.Strings[i];
	  ImportThread(s);
	 except 
		on E:Exception do 
		 Begin
			Memo1.Lines.Add('?????? ??????? ?????????: '+ E.Message);
			Continue;
		 End;
	 end;
	end;

  Memo1.Lines.SaveToFile('Log_import_' + DateToStr(Now) + '.txt');//????????? ??? ???????
  Memo1.Lines.Clear;

  If ParamCount<>0 then //???? ????????? ????????? ? ?????????? -i ??? ??????, ??? ????? ??????? ????????? ????????? ???????? ?????? 
	 If ParamStr(1)='-i' then	 //? ???????? ?? ?????
		begin
		 ShowMessage('????????? ????????? ??????.');
		 Exit;
		end;

  ExportThread; //????????? ??? ????????
  Memo1.Lines.SaveToFile('Log_export_' + DateToStr(Now) + '.txt');
  Application.Terminate;
end;

procedure TMainForm.Button18Click(Sender: TObject);
var
 path,new_path:string;
begin

 try
  path := 'C:\MTerminalService\Db\Metering.db';
  //new_path := Copy(path, 1, 20) + 'Archive' + Copy(path, 20, Length(path)); 
  new_path := 'C:\MTerminalService\Archive\Metering.db';
  MoveFile(PChar(path), PChar(new_path));
 except on E:Exception do
  begin
	 Memo1.Lines.Add('?????? ??? ???????? ????? '+ E.Message);
	 Exit;
  end;
end;

end;

procedure TMainForm.FormShow(Sender: TObject);
begin
 Self.Close;
end;

end.

