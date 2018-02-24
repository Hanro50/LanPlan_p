unit DMMainLinkLibary_u;
//The hart and soul of my PAT is these modual
//The orginal concept was that each set of calculations should be done in its own modual
//Which gets linked back to these one. These modual was litterly only orginally intended
//to contain links to other moduals, but as time went on some calculation required input from multiple
//sources and moduals and it proved easier just to place them in here. Given enought time and I would've
//had time to let these modual perform it's orginal goal, but I simple ran out of time

//I did partly accomplish my goal, as these does have several functions that just act as links to other moduals
interface

uses
  SysUtils, Classes, IdBaseComponent, IdAntiFreezeBase, IdAntiFreeze,  Forms, Graphics,
  Dialogs, ExtDlgs, Menus, DB, ADODB, Variants, Controls;

type
  TMLL = class(TDataModule)
    ADCconnect: TADOConnection;
    OPDProfile: TOpenPictureDialog;
    ADUD_Event: TADOTable;
    ADUD_EventUD_ID: TIntegerField;
    ADUD_EventEvent_ID: TIntegerField;
    ADWhoBooked: TADOTable;
    DSWhoBooked: TDataSource;
    ADWhoBookedUD_Username: TWideStringField;
    ADWhoBookedUD_Nickname: TWideStringField;
    ADWhoBookedEvent_ID: TAutoIncField;
    ADScoreQ: TADOTable;
    DSScoreQ: TDataSource;
    OTDScore_load: TOpenTextFileDialog;
    adscore: TADOTable;
    procedure DataModuleCreate(Sender: TObject);
  private
  const
  UDD : string = 'UserData\'; //User Data Directory
    { Private declarations }
  public
  type
  //Why isn't these part of default delhpi?
  int = Integer;

  //Login procedure commands
  function login(spassword, susername : string) : boolean;
  function regist(Suser, Spasword, Semail, Snick: string) : Boolean;

  //Dialog output system
  function Text_Input(sQeustion, sdefault : string) : string;
  function Password_Input(sQeustion, sdefault : string) : string;
  function YN_Qeustion(sQeustion: string): Boolean;
  function Memo_Input(sQeustion, sdefault: string): string;
  function Date_get(sQeustion : string) : TDate;
  function URL_get(sQuestion: string): string;
  function real_Input(sQeustion : string; Rdefault : real) : real;
  function int_Input(sQeustion : string; iDefault : Integer) : Integer;

  //Main Menu Procedures
  procedure Logout;
  procedure NewProfilePick;
  procedure Message_Show(sInput : string);
  procedure Message_WB;
  procedure MainMenu;
  Procedure AMC_userselect;

  //Event system
  procedure Event_refresh;
  Procedure Event_Next;
  Procedure Event_Back;
  Procedure Event_book;
  procedure Event_unbook;
  Procedure Event_New;
  Procedure Event_Edit;
  Procedure Event_Cancel;

  //Score system
  Procedure Score_LFF; //Score Load From File
  Procedure Score_Edit(sfieldname, schange : string);


  var
  UD_ID: Variant;
  bBooked : Boolean;
  iPL : Integer;

  sName, sWebsite, sbooked, sdiscription, sdate :string;
  itype, iTS, iTB, iPermLevel : int;
  rprice : real;
  ddate : TDate;


    { Public declarations }
  end;

var
  MLL: TMLL;

implementation
uses
DMAccount_u, DMfinance_u, DMEvents_u, GFbooker_u, GFMainMenu_u, GFLogin_u, GFBox_u;

{$R *.dfm}

{ TMLL }

procedure TMLL.AMC_userselect;
begin
mms.Userselect;
end;

procedure TMLL.DataModuleCreate(Sender: TObject);
begin
Try
ADCconnect.Connected:=true;

ADUD_Event.Active:=true;
ADWhoBooked.Active:=true;
ADScoreQ.Active:=true;
adscore.Active:=true;
except      //My attempt at fixing the database provider issue...if these pat breaks then just follow the link
  ShowMessage('CRITICAL ERROR : could not access database');
  ShowMessage('Please insure you have the "Microsoft Access Database Engine 2010 Redistributable" package installed');
  ShowMessage('Here is a link: https://www.microsoft.com/en-za/download/details.aspx?id=13255');
End;
end;

function TMLL.Date_get(sQeustion: string): TDate;
begin
Result:=GFInput.Date_get(sQeustion);
end;

procedure TMLL.Event_Back;
begin
DMEvents.Event_Back;
Event_refresh;
end;

procedure TMLL.Event_book;
begin
if iPermLevel <= iPL then
begin
  if DMFinance.F_UserDraw(-rprice, 'Booked event: ' + sName) then DMEvents.Event_book;
end
else
begin
  Message_Show('You lack the required permisions to book for these event');
end;
end;

procedure TMLL.Event_Cancel;
begin

if DMEvents.ADEvents.RecordCount > 1 then
  begin
    with ADCconnect do  DMEvents.ADEvents.Delete;
  end
else
  begin
   Message_Show('Critical error: ' + #13 + 'YOU CANNOT HAVE NO AVAILABLE EVENTS !');
  end;
Event_refresh;
end;

procedure TMLL.Event_Edit;
begin
MMS.Hide;
EEdit.Edit_event;
EEdit.show;
end;

procedure TMLL.Event_New;
begin
MMS.Hide;
EEdit.New_Event;
EEdit.show;
end;

procedure TMLL.Event_Next;
begin
DMEvents.Event_Next;
Event_refresh;
end;

procedure TMLL.Event_refresh; //Updates the main GUI
var
sID : string;
bbookedflag : Boolean;
begin
  DMEvents.ID_get;
  sWebsite:='';
  mms.pnlWebsite.Visible:=False;
    with ADCconnect do
      begin
          try
            sWebsite:=DMEvents.ADEvents.Lookup('Event_ID', DMEvents.EID, 'Event_Website');
              if sWebsite = '' then
                begin
                  mms.pnlWebsite.Visible:=False;
                  mms.pnlDisc.Align:=alclient;
                end
              else
                begin
                  mms.WBInfo.Navigate(sWebsite);
                  mms.pnlDisc.Align:=alTop;
                  mms.pnlDisc.Height:=308;
                  mms.pnlWebsite.Visible:=true;
                end;
          except
            sWebsite:='';
          end;

        sName:=DMEvents.ADEvents.Lookup('Event_ID', DMEvents.EID, 'Event_Name');
        sdiscription:=DMEvents.ADEvents.Lookup('Event_ID', DMEvents.EID, 'Event_Discription');
        iTS:=DMEvents.ADEvents.Lookup('Event_ID', DMEvents.EID, 'Event_Total_seats');
        iPermLevel:=DMEvents.ADEvents.Lookup('Event_ID', DMEvents.EID, 'Event_Perm_Required');
        rprice:=DMEvents.ADEvents.Lookup('Event_ID', DMEvents.EID, 'Event_Price');
        ddate:=DMEvents.ADEvents.Lookup('Event_ID', DMEvents.EID, 'Event_Date');
        sID:=UD_ID;
          try
            if ADUD_Event.Locate('UD_ID;Event_ID', VarArrayOf([sID, DMEvents.EID]), [])
              then bbookedflag:=true else bbookedflag:=false;

              ADUD_Event.Filter:='Event_ID =' + DMEvents.EID;
              ADUD_Event.Filtered:=true;
              iTB:=ADUD_Event.RecordCount;
              ADUD_Event.Filtered:=false;
          except
            bbookedflag:=false;
          end;

      end;
    with MMS do
      begin
        lblDate.Caption:=DateToStr(ddate);
        PNLsumarry.Caption:=sName;
        lblPrice.Caption:='Price:'+FloatToStrF(rprice, ffCurrency, 8, 2);
        lblSpacesBooked.Caption:=IntToStr(iTB)+'/'+IntToStr(iTS);
        memEventDisc.Lines.Clear;
        memEventDisc.Lines.Add(sdiscription);
        lblBalance.Caption:=FloatToStrF(DMAccount.DBget('UD_Wallet'), ffCurrency, 8, 2);
        if ddate<Date then
          begin
            btnBook.Enabled:=false; //The UI initiation script
            btnBook.Visible:=false;
            btnUnbook.Enabled:=false;
            btnUnbook.Visible:=false;
            lblBooked.Font.Color:=clYellow;
            lblBooked.Caption:='Event'+#13+'has'+#13+'already'+#13+'happened';
            lblDate.font.Color:=clRed;
            btnEvent_Cancel.Caption:='Remove Event?';
          end
        else if bbookedflag=true then
          begin
            btnBook.Enabled:=false;
            btnbook.Visible:=false;
            btnUnbook.Enabled:=true;
            btnUnbook.Visible:=true;
            btnUnbook.top:=0;
            lblBooked.Font.Color:=clLime;
            lblBooked.Caption:='Booked';
            lblDate.font.Color:=clWhite;
            btnEvent_Cancel.Caption:='Cancel Event?';
          end
        else if iTS<=iTB then
          begin
            btnBook.Enabled:=false;
            btnBook.Visible:=false;
            btnUnbook.Enabled:=false;
            btnUnbook.Visible:=false;
            lblBooked.Font.Color:=clYellow;
            lblBooked.Caption:='Full';
            lblDate.font.Color:=clWhite;
            btnEvent_Cancel.Caption:='Cancel Event?';
          end
        else
          begin
            btnBook.Enabled:=true;
            btnBook.Visible:=true;
            btnbook.top:=0;
            btnUnbook.Enabled:=false;
            btnUnbook.Visible:=false;
            lblBooked.Font.Color:=clred;
            lblBooked.Caption:='Unbooked';
            lblDate.font.Color:=clWhite;
            btnEvent_Cancel.Caption:='Cancel Event?';
          end;
      end;
  if iPL >= 7 then
  begin
    with mms do
    begin
     btnEvent_Edit.Visible:=true;
     btnEvent_New.Visible:=true;
     btnEvent_Cancel.Visible:=true;
    end;
  end
  else
  begin
    with mms do
      begin
        btnEvent_Edit.Visible:=false;
        btnEvent_New.Visible:=false;
        btnEvent_Cancel.Visible:=false;
      end;
  end;
end;

procedure TMLL.Event_unbook;
begin
if DMFinance.F_UserDraw(rprice, 'Unbooked from event: ' + sName) then DMEvents.Event_Unbook;;
end;

function TMLL.int_Input(sQeustion: string; iDefault: Integer): Integer;
begin
Result:=GFInput.int_Input(sQeustion, iDefault);
end;
function TMLL.login(spassword, susername: string): boolean;
var
sID : string;
begin
Result:=DMAccount.login(spassword, susername);

if Result = true then
  begin
    if DMAccount.ADTuserdata.FieldValues['UD_Banned'] then
      begin
        Message_Show('Your Account has been terminate');
        Result:=true;
        exit;
      end
    else Result:=true;
  end;

  if result=true then
    begin
      mms.Show;
      Lwin.hide;
      sID:=(mll.UD_ID);
      try
        MMS.IMGProfilePic.Picture.LoadFromFile(UDD+sID + '.png');   //It checks if the user has sved a profile pick jet
      except
        MMS.IMGProfilePic.Picture.LoadFromFile(UDD+'0.png');     //if the user however has not then it just loads the default
      end;
      MMS.lblPlayername.Caption:=DMAccount.DBget('UD_Username');
      Event_refresh;
    end;
end;

procedure TMLL.Logout;
begin
MMS.Hide;
Lwin.show;
end;

procedure TMLL.MainMenu;
begin
mms.Show;
end;

function TMLL.Memo_Input(sQeustion, sdefault: string): string;
begin
Result:=GFInput.Memo_Input(sQeustion, sdefault);
end;

procedure TMLL.Message_Show(sInput: string);
begin
GFInput.Message_Show(sInput);
end;

procedure TMLL.Message_WB;
begin
GFInput.Message_WB(strtoint(DMEvents.EID));
end;

procedure TMLL.NewProfilePick;
var
sfile, sID : string;
fpic : TPicture;
begin
  if OPDProfile.Execute then
    begin
      sfile := OPDProfile.FileName;
      fpic:= TPicture.Create;
        try
          fpic.LoadFromFile(sfile);
          sID:=UD_ID;
          fpic.SaveToFile('UserData/'+sID+'.png');
          Message_Show('Success');
        finally
          fpic.free;
        end;
        try
          MMS.IMGProfilePic.Picture.LoadFromFile(UDD+sID + '.png');
        except
          MMS.IMGProfilePic.Picture.LoadFromFile(UDD+'0.png');
          Message_Show('Failed to load image');
        end;
    end;
end;

function TMLL.Password_Input(sQeustion, sdefault: string): string;
begin
  result:=GFInput.Password_Input(sQeustion, sdefault);
end;

function TMLL.real_Input(sQeustion: string; Rdefault: real): real;
begin
Result:=GFInput.real_Input(sQeustion, Rdefault);
end;

function TMLL.regist(Suser, Spasword, Semail, Snick: string): Boolean;
begin
Result:=DMAccount.regist(Suser, Spasword, Semail, Snick);
end;

procedure TMLL.Score_Edit(sfieldname, schange: string);
begin
adscore.Locate('Score_ID', mll.ADScoreQ.FieldByName('Score_ID').Text , []);
with mll.ADCconnect do
  begin
    adscore.edit;
    adscore[sfieldname]:=schange;
    adscore.post;
    adscore.Refresh;
    ADScoreQ.Active:=false;
    ADScoreQ.Active:=true;
    mms.Score_UI_refresh;
  end;
end;

procedure TMLL.Score_LFF;
var
sfile, sline, sgame, sevent, snick: string;
tfile, tlog: TextFile;
ddate : TDate;

i, i2, iscore, iID : int;

begin
  i:=0;

    try
      AssignFile(tlog, 'log.txt');
      Append(tlog);
      Writeln(tlog, 'staring new Import <' + DateToStr(Date) + '>');
    except
      Rewrite(tlog);
    end;
  if OTDScore_load.Execute then sfile:=OTDScore_load.FileName;
  Message_Show(sfile);
    try
      AssignFile(tfile, sfile);
      Reset(tfile);
    except
      Message_Show('Invalid file');
      CloseFile(tfile);
      exit;
    end;
    try
      Reset(tfile);
      Readln(tfile, sline);
        if not (sline = '<Begin score>') then
          begin
            ShowMessage('File header is invalid, cannot load data!');
            CloseFile(tlog);
            CloseFile(tfile);
            exit;
          end;
        try
          sgame:=Text_Input('What was the name of the game played?', 'Game of life')         ;
          sevent:=Text_Input('What was the name of the event where these took place', 'Q3') ;
          ddate:=Date_get('When was these event?')
        except
          ShowMessage('Detail was invalid');
          CloseFile(tlog);
          CloseFile(tfile);
          exit;
        end;
        try
          while not Eof(tfile) do
            begin
              try
                inc(i);
                Readln(tfile, sline);
                i2:= pos('=', sline);
                snick:= copy(sline, 0 , i2 -1);
                iscore:=StrToInt(copy(sline, i2+1, System.Length(sline)));
                  try
                    iID:=DMAccount.ADTuserdata.Lookup('UD_Nickname', snick, 'UD_ID');
                    try
                      with ADCconnect do
                        begin
                          adscore.Insert;
                          adscore['UD_ID']:=iID;
                          adscore['Score_UD_Score']:=iscore;
                          adscore['Score_Event_name']:=sevent;
                          adscore['Score_Event_Date']:=DateToStr(ddate);
                          adscore['Score_Event_Game']:=sgame;
                          adscore.Post;
                        end;  
                    except
                      Writeln(tlog, 'Failed to save data to record at line ' + IntToStr(i));
                    end;
                  except
                    Writeln(tlog, 'Nickname not in database at line ' + IntToStr(i));
                  end;
              except
                Writeln(tlog, 'read error at line ' + IntToStr(i));
              end;
            end;
        finally
          CloseFile(tlog);
          CloseFile(tfile);
          Message_Show('Success, all errors have been saved to log.txt');
          adscore.Refresh;
        end;

    except
      Message_Show('failed to read file');
      CloseFile(tfile);
      exit;
    end;
  end;


function TMLL.Text_Input(sQeustion, sdefault: string): string;
begin
result:= GFInput.Text_Input(sQeustion, sdefault);
end;


function TMLL.URL_get(sQuestion: string): string;
begin
result:=GFInput.URL_get(sQuestion);
end;

function TMLL.YN_Qeustion(sQeustion: string): Boolean;
begin
Result:=GFInput.YN_Qeustion(sQeustion);
end;

end.

