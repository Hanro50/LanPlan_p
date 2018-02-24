unit GFMainMenu_u;
//Holds the balk of the GUI for my PAT
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DMMainLinkLibary_u, ExtCtrls, StdCtrls, ComCtrls, Buttons, Spin,
  DBCtrls, pngimage, ExtDlgs, Menus, OleCtrls, SHDocVw, Grids, DBGrids, DMfinance_u, DMAccount_u,
  Mask;

type
  TMMS = class(TForm) //Unlike my dialog components a lot of gui components get referenced so every name has been customized
    PNLMain: TPanel;
    PCMain: TPageControl;
    TSBooker: TTabSheet;
    TBScores: TTabSheet;
    TBAdmin: TTabSheet;
    PNLAccount: TPanel;
    pnlNav: TPanel;
    BTNForward: TButton;
    BTNback: TButton;
    lblPlayername: TLabel;
    btnLogout: TButton;
    IMGProfilePic: TImage;
    PNLBooker: TPanel;
    PNLsumarry: TPanel;
    sbnEventSelect: TSpinButton;
    pnlDetail: TPanel;
    lblPrice: TLabel;
    lblBooked: TLabel;
    lblSpacesBooked: TLabel;
    PNLBookerButtons: TPanel;
    btnBook: TButton;
    WBInfo: TWebBrowser;
    pnlWebsite: TPanel;
    pnlmisc: TPanel;
    btnUnbook: TButton;
    btnEvent_Edit: TButton;
    btnEvent_New: TButton;
    btnEvent_Cancel: TButton;
    btnWho_Booked: TButton;
    pnlDisc: TPanel;
    memEventDisc: TMemo;
    lblDate: TLabel;
    pnlFinance: TPanel;
    DBGTLog: TDBGrid;
    lblTlog: TLabel;
    pnlCreditrole: TPanel;
    pnlfinCon: TPanel;
    pnlHanroLareman: TPanel;
    lblSFN: TLabel;
    Panel5: TPanel;
    edtNS: TEdit;
    DMusers: TDBGrid;
    pnlFinGui: TPanel;
    lblUsername: TLabel;
    DBEUsername: TDBEdit;
    lblNickname: TLabel;
    DBENickname: TDBEdit;
    lblWallet: TLabel;
    DBEWallet: TDBEdit;
    pnlDBedit: TPanel;
    Label3: TLabel;
    CBRank: TComboBox;
    pnlFinbuttons: TPanel;
    btnBan: TButton;
    btnUnban: TButton;
    DBNUsers: TDBNavigator;
    lblBalance: TLabel;
    Panel3: TPanel;
    Panel6: TPanel;
    DBGScore: TDBGrid;
    Panel4: TPanel;
    Label1: TLabel;
    Panel7: TPanel;
    Label2: TLabel;
    pnoptions_score: TPanel;
    btnsort: TButton;
    btnSEvent: TButton;
    btnedtScore: TButton;
    btnsdate: TButton;
    pnlOptionsScore: TPanel;
    pnlsortvia: TPanel;
    Label5: TLabel;
    CBSortvia: TComboBox;
    btnSNick: TButton;
    btnLFF: TButton;
    btnsGame: TButton;
    btnedtEvent: TButton;
    BtnedtDate: TButton;
    btnedtGame: TButton;
    btndelentry: TButton;
    btnClear: TButton;
    procedure btnLogoutClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BTNForwardClick(Sender: TObject);
    procedure BTNbackClick(Sender: TObject);
    procedure TSProfileShow(Sender: TObject);
    procedure TSBookerShow(Sender: TObject);
    procedure TBScoresShow(Sender: TObject);
    procedure TBAdminShow(Sender: TObject);
    procedure btnsdateClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnBookClick(Sender: TObject);
    procedure sbnEventSelectDownClick(Sender: TObject);
    procedure sbnEventSelectUpClick(Sender: TObject);
    procedure IMGProfilePicClick(Sender: TObject);
    procedure btnUnbookClick(Sender: TObject);
    procedure btnEvent_EditClick(Sender: TObject);
    procedure btnEvent_NewClick(Sender: TObject);
    procedure btnEvent_CancelClick(Sender: TObject);
    procedure CBRankSelect(Sender: TObject);
    procedure edtNSChange(Sender: TObject);
    procedure btnBanClick(Sender: TObject);
    procedure btnUnbanClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnWho_BookedClick(Sender: TObject);
    procedure btnsortClick(Sender: TObject);
    procedure CBSortviaChange(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure btnSNickClick(Sender: TObject);
    procedure btnSEventClick(Sender: TObject);
    procedure btnsGameClick(Sender: TObject);
    procedure btnLFFClick(Sender: TObject);
    procedure PNLMainClick(Sender: TObject);
    procedure btnedtGameClick(Sender: TObject);
    procedure BtnedtDateClick(Sender: TObject);
    procedure btnedtEventClick(Sender: TObject);
    procedure btnedtScoreClick(Sender: TObject);
    procedure btndelentryClick(Sender: TObject);
    procedure pnlHanroLaremanCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure Panel4CanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
  private

  procedure rebuildfilter(idex : Integer);
  var
  isortselect : Integer;
  basending : Boolean;
  sfilter : string;
  iselect : Integer;

  const
  ASortby : array[0..4] of string =('UD_Nickname ', 'Score_UD_Score ', 'Score_Event_name ', 'Score_Event_Date ', 'Score_Event_Game '); //A constent to save some common phrases
    { Private declarations }
  public
    procedure Score_UI_refresh;
    procedure Userselect;
    { Public declarations }
  end;

var
  MMS: TMMS;
  easter : Boolean = true;  //easter egg enitialization

implementation


{$R *.dfm}

procedure TMMS.BTNbackClick(Sender: TObject);
begin
PCMain.SelectNextPage(false, false);
if (PCMain.ActivePageIndex=2) and (mll.iPL < 7) then
begin
PCMain.SelectNextPage(false, false);
end;

end;

procedure TMMS.btnBookClick(Sender: TObject);
begin
mll.Event_book;
end;

procedure TMMS.btnClearClick(Sender: TObject);
begin
mll.ADScoreQ.Filtered:=false;
btnClear.Visible:=false;
end;

procedure TMMS.btndelentryClick(Sender: TObject);
begin
with mll.ADCconnect do
begin
mll.adscore.Locate('Score_ID', mll.ADScoreQ.FieldByName('Score_ID').text, []);
mll.adscore.Delete;
mll.adscore.Refresh;
mll.ADScoreQ.Active:=false;
MLL.ADScoreQ.Active:=true;
Score_UI_refresh;
end;
end;

procedure TMMS.BtnedtDateClick(Sender: TObject);
var
ddate: TDate;
begin
try
  ddate:=mll.Date_get('Please give a new date');
  mll.Score_Edit('Score_Event_Date', DateToStr(ddate));
except
  mll.Message_Show('Failed to edit data');
end;

end;

procedure TMMS.btnedtEventClick(Sender: TObject);
var
sname:string;
begin
try
  sname:=mll.Text_Input('Adjust the name of the Event then', mll.ADScoreQ.FieldByName('Score_Event_name').text);
  mll.Score_Edit('Score_Event_name', sname);
except
  mll.Message_Show('Failed to edit data');
end;

end;

procedure TMMS.btnedtGameClick(Sender: TObject);
var
sgame:string;
begin
try
  sgame:=mll.Text_Input('Adjust the name of the game then', mll.ADScoreQ.FieldByName('Score_Event_Game').text);
  mll.Score_Edit('Score_Event_Game', sgame);
except
  mll.Message_Show('Failed to edit data');
end;

end;

procedure TMMS.btnedtScoreClick(Sender: TObject);
var
iscore : Integer;
begin
try
  iscore:=mll.int_Input('Adjust the score of the user then', mll.ADScoreQ.FieldByName('Score_UD_Score').AsInteger);
  mll.Score_Edit('Score_UD_Score', IntToStr(iscore));
except
  mll.Message_Show('Failed to edit data');//Error message if these procedure fails
end;
end;

procedure TMMS.btnEvent_CancelClick(Sender: TObject); //The remover and canceller, for clearing out junk
begin
if MLL.YN_Qeustion('Are you sure about these?')then
  begin
    if mll.ddate>=date then
      begin
        if MLL.YN_Qeustion('Warning, these thing does not automatically refund users!') then
          begin
            mll.Event_Cancel;
          end;
      end
    else mll.Event_Cancel;
  end;

end;

procedure TMMS.btnEvent_EditClick(Sender: TObject);
begin
MLL.Event_Edit;
end;

procedure TMMS.btnEvent_NewClick(Sender: TObject);
begin
mll.Event_New;
end;

procedure TMMS.BTNForwardClick(Sender: TObject);
begin
PCMain.SelectNextPage(true, false);
if (PCMain.ActivePageIndex=2) and (mll.iPL < 7) then
begin
PCMain.SelectNextPage(true, false);
end;

end;

procedure TMMS.btnLFFClick(Sender: TObject);
begin
mll.Score_LFF;
end;

procedure TMMS.btnLogoutClick(Sender: TObject);
begin
MLL.Logout;
end;

procedure TMMS.btnsortClick(Sender: TObject);
begin
if basending = true then
begin
basending:=false;
mll.ADScoreQ.Sort:=ASortby[isortselect] + 'DESC';
btnsort.Caption:='Sort Asending'
end
else
begin
basending:=true;
mll.ADScoreQ.Sort:=ASortby[isortselect] + 'ASC';
btnsort.Caption:='Sort Desending';
end;
end;

procedure TMMS.btnUnbanClick(Sender: TObject); //The unban button for those who've not commited enought crimes to warrent termination
begin
if (mll.iPL>=9) or (mll.iPL>iselect) then
  begin
    DMAccount.ADUDMSF.Edit;
    DMAccount.ADUDMSF.FieldValues['UD_Banned']:=False;
    DMAccount.ADUDMSF.post;
    DMAccount.ADUDMSF.Refresh;
    DMAccount.ADTuserdata.Refresh;
    Userselect;
  end
else
  begin
    mll.Message_Show('You lack the required rank to unban this user');
  end;
end;

procedure TMMS.btnUnbookClick(Sender: TObject);
begin
mll.Event_unbook;
end;

procedure TMMS.btnWho_BookedClick(Sender: TObject);
begin
mll.Message_WB;
end;

procedure TMMS.Button1Click(Sender: TObject);
begin
MLL.Event_Next;
end;

procedure TMMS.btnsGameClick(Sender: TObject);
begin
sfilter:=MLL.Text_Input('Please enter a name of a game', '');
rebuildfilter(0);
end;

procedure TMMS.btnSEventClick(Sender: TObject);
begin
sfilter:=MLL.Text_Input('Please enter the name of said event', '');
rebuildfilter(2);
end;

procedure TMMS.btnBanClick(Sender: TObject); //The ban button, a quick way to terminate a user's account and preventing them from simply making a new one
begin
if (mll.iPL>=9) or (mll.iPL>iselect) then
  begin
    DMAccount.ADUDMSF.Edit;
    DMAccount.ADUDMSF.FieldValues['UD_Banned']:=true;
    DMAccount.ADUDMSF.post;
    DMAccount.ADUDMSF.Refresh;
    DMAccount.ADTuserdata.Refresh;
    Userselect;
  end
else
  begin
    mll.Message_Show('You lack the required rank to ban this user');
  end;
end;

procedure TMMS.btnsdateClick(Sender: TObject);
begin
sfilter:=DateToStr(MLL.Date_get('Specify a date'));
rebuildfilter(3);
end;

procedure TMMS.btnSNickClick(Sender: TObject);
begin
sfilter:=MLL.Text_Input('Please enter a name', '');
rebuildfilter(0);
end;

procedure TMMS.CBRankSelect(Sender: TObject);
begin
iselect:=CBRank.ItemIndex;
if (mll.iPL>=9) or (mll.iPL>iselect) then
begin
DMAccount.ADUDMSF.Edit;
DMAccount.ADUDMSF.FieldValues['UD_Prem_level']:=iselect;
DMAccount.ADUDMSF.post;
Userselect;
end
else
begin
  mll.Message_Show('You lack the required rank to promote this user');
end;

end;

procedure TMMS.CBSortviaChange(Sender: TObject);
begin
isortselect:=CBSortvia.ItemIndex;
end;

procedure TMMS.edtNSChange(Sender: TObject);
begin
  if edtNS.Text= '' then
    begin
      DMAccount.ADUDMSF.Filtered:=false;
    end
  else
    begin
      with DMAccount.ADUDMSF do
        begin
Filtered:=false;
Filter:='UD_Username LIKE ' + QuotedStr('%'+edtNS.Text+'%') ;
Filtered:=true;
Refresh;
Userselect;
        end;
    end;

end;

procedure TMMS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Application.Terminate;
end;

procedure TMMS.FormShow(Sender: TObject);
begin
PCMain.ActivePageIndex:=0;
pnlHanroLareman.Width:=pnlHanroLareman.Width+1;

if mll.ipl >= 5 then  //Determines what menu items show up based on the player's permision level
begin
    btnedtScore.Visible:=true;
    btnedtEvent.Visible:=true;
    BtnedtDate.Visible:=true;
    btnedtGame.Visible:=true;
    btndelentry.Visible:=true;
      if MLL.iPL >= 7
        then btnLFF.Visible:=true
        else btnLFF.Visible:=False;
  end
else
  begin
    btnedtScore.Visible:=false;
    btnedtEvent.Visible:=false;
    BtnedtDate.Visible:=false;
    btnedtGame.Visible:=false;
    btndelentry.Visible:=false;
    btnLFF.Visible:=False;
  end;
end;

procedure TMMS.IMGProfilePicClick(Sender: TObject);
begin
mll.NewProfilePick;
end;



procedure TMMS.Panel4CanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
Score_UI_refresh;
end;

procedure TMMS.pnlHanroLaremanCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
  var Isplit: Integer;
begin
if (NewWidth div 600) < 1 then
begin
  DMusers.Columns.Items[0].Width:=200;    //Customised tables
DMusers.Columns.Items[1].Width:=200;
DMusers.Columns.Items[2].Width:=100;
DMusers.Columns.Items[3].Width:=70;
end
else
begin
  Isplit:=(NewWidth-106) div 5;
  DMusers.Columns.Items[0].Width:=(2*Isplit);
  DMusers.Columns.Items[1].Width:=(2*Isplit);
  DMusers.Columns.Items[2].Width:=Isplit;
end;

end;

procedure TMMS.PNLMainClick(Sender: TObject);

begin
if easter then
begin
mll.Message_Show('Welcome to the main menu!');
easter:=False;
end;
end;

procedure TMMS.rebuildfilter(idex: Integer);
begin
  try
    MLL.ADScoreQ.Filtered:=false;
    mll.ADScoreQ.Filter:=ASortby[idex]+ 'like ' + QuotedStr('%' + sfilter + '%');
    if idex = 3 then mll.ADScoreQ.Filter:=ASortby[idex]+ 'like ' + sfilter;
    MLL.ADScoreQ.Filtered:=true;
    btnClear.Visible:=true;
  except
    mll.Message_Show('Filter settings where invalid');
    btnClear.Click;
  end;
end;

procedure TMMS.sbnEventSelectDownClick(Sender: TObject);
begin
mll.Event_Next;
end;

procedure TMMS.sbnEventSelectUpClick(Sender: TObject);
begin
mll.Event_back;
end;

procedure TMMS.Score_UI_refresh;
var
ispliter:integer;
begin
WBInfo.Silent:=True;
DBGScore.Columns.Items[5].Visible:=false; //Delphi has a habit of forgetting how I set these up

if DBGScore.Width <= 700 then
begin
DBGScore.Columns.Items[0].Width:=200;
DBGScore.Columns.Items[1].Width:=50;
DBGScore.Columns.Items[2].Width:=200;
DBGScore.Columns.Items[3].Width:=100;
DBGScore.Columns.Items[4].Width:=150;
end
else
begin
ispliter:= ((DBGScore.Width-25) div 7);

DBGScore.Columns.Items[0].Width:=2*ispliter;
DBGScore.Columns.Items[1].Width:=ispliter div 2;
DBGScore.Columns.Items[2].Width:=2*ispliter;
DBGScore.Columns.Items[3].Width:=ispliter;
DBGScore.Columns.Items[4].Width:=3*ispliter div 2;

end;



DBGScore.Columns.Items[0].Title.Caption:='Nickname';
DBGScore.Columns.Items[1].Title.Caption:='Score';
DBGScore.Columns.Items[2].Title.Caption:='Name';
DBGScore.Columns.Items[3].Title.Caption:='Date';
DBGScore.Columns.Items[4].Title.Caption:='Game';

basending:= true;
isortselect:=1;
mll.ADScoreQ.Sort:=ASortby[isortselect] + 'ASC';
end;

procedure TMMS.TBAdminShow(Sender: TObject);  //Delphi has a habit of forgetting how I set these up
begin
PNLMain.caption:='Admin center';

DBGTLog.Columns.Items[0].Width:=100;
DBGTLog.Columns.Items[1].Width:=100;
DBGTLog.Columns.Items[2].Width:=75;
DBGTLog.Columns.Items[3].Width:=500;

DBGTLog.Columns.Items[0].Title.Caption:='Date';
DBGTLog.Columns.Items[1].Title.Caption:='Username';
DBGTLog.Columns.Items[2].Title.Caption:='Change';
DBGTLog.Columns.Items[3].Title.Caption:='Reason';

end;


procedure TMMS.TBScoresShow(Sender: TObject);
begin
PNLMain.caption:='Scores';
Score_UI_refresh;
end;

procedure TMMS.TSBookerShow(Sender: TObject);
begin
PNLMain.caption:='Booker';
end;

procedure TMMS.TSProfileShow(Sender: TObject);
begin
PNLMain.caption:='Profile';
end;

procedure TMMS.Userselect;  //Updates the UI based on the selected user
begin                       //Mainly prevents admins from banning themselves or giving themselves money
iselect:=CBRank.ItemIndex;
try
  CBRank.ItemIndex:=DMAccount.ADUDMSF.FieldValues['UD_Prem_level'];
    if DMAccount.ADUDMSF.FieldValues['UD_Username']=DMAccount.DBget('UD_Username')
      then
        begin
          CBRank.Enabled:= false;
          DBEWallet.Enabled:=false;
          btnBan.Visible:=false;
          btnUnban.Visible:=false;
        end
      else
        begin
          CBRank.Enabled:=true;
          DBEWallet.Enabled:=true;
          if DMAccount.ADUDMSF.FieldValues['UD_Banned'] then
            begin
              btnUnban.Visible:=true;
              btnban.Visible:=false;
            end
          else
            begin
              btnUnban.Visible:=false;
              btnBan.Visible:=true;
            end;
        end;
except
  CBRank.Enabled:= false;
  DBEWallet.Enabled:=false;
  btnBan.Visible:=false;
  btnUnban.Visible:=false;
end;
end;

end.
