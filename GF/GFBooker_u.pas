unit GFBooker_u;
//The gui for adding/editeting events
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DMMainLinkLibary_u, DB, StdCtrls, Mask, DBCtrls, OleCtrls, SHDocVw,
  ExtCtrls, Spin;

type
  TEEdit = class(TForm)     //GUI was pulled from main event menu
    PNLBooker: TPanel;
    PNLBookerButtons: TPanel;
    pnlmisc: TPanel;
    pnlWebsite: TPanel;
    WBInfo: TWebBrowser;
    pnlDisc: TPanel;
    memEventDisc: TMemo;
    btnEdit_date: TButton;
    btnEdit_name: TButton;
    btnEdit_URL: TButton;
    btnEdit_disc: TButton;
    btnEdit_namePrice: TButton;
    btnEdit_Mseats: TButton;
    btnSave: TButton;
    btnDiscard: TButton;
    btnInfo: TButton;
    btnPTB: TButton;
    PNLsumarry: TPanel;
    lblBooked: TLabel;
    pnlDetail: TPanel;
    lblSpacesBooked: TLabel;
    lblPrice: TLabel;
    lblDate: TLabel;
    sbnEventSelect: TSpinButton;
    procedure btnInfoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnDiscardClick(Sender: TObject);
    procedure btnEdit_nameClick(Sender: TObject);
    procedure btnEdit_dateClick(Sender: TObject);
    procedure btnEdit_MseatsClick(Sender: TObject);
    procedure btnEdit_discClick(Sender: TObject);
    procedure btnPTBClick(Sender: TObject);
    procedure btnEdit_namePriceClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnEdit_URLClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure sbnEventSelectUpClick(Sender: TObject);
    procedure sbnEventSelectDownClick(Sender: TObject);
  private

    var
    bname, bDOF, bMS, bPrice, bdisc, bPTB :boolean;

    Event_Name, Event_Website, Event_Discription: string; //These items break the naming convention to make it easier to manage the "new_Event" and "Edit_Event" functions as they require a ton of vairiables
    Event_Price: real;                                    //There names are based on what thier records correspond to in the event's table
    Event_Total_seats, Event_Perm_Required: Integer;
    Event_Date: Tdate;


  public
  procedure New_Event;
  Procedure Edit_event;
  var
  sname, sdisc, sURL : string;

  iMS, iSB, iTS, iPerm : Integer;
  ddate : TDate;
  rprice : real;
  //sdate :
  bNewevent : Boolean;
    { Public declarations }
  end;

var
  EEdit: TEEdit;

implementation

uses DMEvents_u;

{$R *.dfm}


procedure TEEdit.btnDiscardClick(Sender: TObject);
begin
if mll.YN_Qeustion('Are you sure you want to exit now?') then
  begin
    EEdit.Hide;
    mll.MainMenu;
  end;
end;

procedure TEEdit.btnEdit_dateClick(Sender: TObject);
var
DTdate : Tdate;
begin
EEdit.Enabled:=False;
if bNewevent=false then
  begin
    if mll.YN_Qeustion('Are you sure about these?') then
      begin
        DTdate := mll.Date_get('Please enter a date');
        if DTdate >= Date then //Who here is a time travelor again?
          begin
            lblDate.Caption:=DateToStr(DTdate);
            mll.Message_Show('Success');
            Event_Date:=DTdate;
          end
        else
          begin
            mll.Message_Show('ERROR: You cannot set it in the past');
          end;
      end;
  end
else
  begin
    DTdate:= mll.Date_get('Please enter a date for these event');
    if DTdate >= Date then
          begin
            lblDate.Caption:=DateToStr(DTdate);
            mll.Message_Show('Success');
            bDOF:=true;
            Event_Date:=DTdate;
          end
        else
          begin
            Application.HandleMessage;
            mll.Message_Show('ERROR: You cannot set the date in the past, Doctor');
          end;
  end;
EEdit.Enabled:=true;
end;

procedure TEEdit.btnEdit_discClick(Sender: TObject);
var
svar : string;
begin
EEdit.Enabled:=False;
svar:=memEventDisc.Lines.Text;
memEventDisc.Lines.clear;
memEventDisc.Lines.Add(mll.Memo_Input('Please enter a discription', svar));
Event_Discription:=memEventDisc.Lines.Text;
bdisc:=true;
EEdit.Enabled:=true;
end;

procedure TEEdit.btnEdit_MseatsClick(Sender: TObject);
var
iseats : Integer;
begin
EEdit.Enabled:=False;
iseats:=MLL.int_Input('Enter the max seats you want', 1);
if bNewevent=false then
  begin
    if iseats < mll.iTB then
      begin
        mll.Message_Show('Too many users have already booked a ticket for these event');
      end
    else
      begin
        Event_Total_seats:=iseats;
        lblSpacesBooked.Caption:=IntToStr(mll.iTB)+'/'+IntToStr(Event_Total_seats);
        mll.Message_Show('Success');
      end;
  end
else
  begin
    if iseats>0 then
      begin
        Event_Total_seats:=iseats;
        mll.Message_Show('Success');
        lblSpacesBooked.Caption:='0/'+IntToStr(Event_Total_seats);
        bMS:=true;
      end
    else
      begin
        mll.Message_Show('You need to reserve more then 0 seats!');
      end;

  end;
EEdit.Enabled:=true;
end;

procedure TEEdit.btnEdit_nameClick(Sender: TObject);
begin
  EEdit.Enabled:=False;
    if bNewevent then//The new name event
      begin
        if bname
          then Event_Name:= mll.Text_Input('Please enter a new name here', Event_Name)
            else Event_Name:= mll.Text_Input('Please enter a name', 'A113');
        bname:=true;
      end
    else
      begin
        Event_Name:= mll.Text_Input('Please enter a new name here', mll.sName);
      end;
  PNLsumarry.Caption:=Event_Name;
  EEdit.Enabled:=true;
end;

procedure TEEdit.btnEdit_namePriceClick(Sender: TObject);
var
rtemp : real;
begin
EEdit.Enabled:=False;
rtemp:= mll.real_Input('Please input a price', 0.01);
  if rtemp>=0 then
    begin
      Event_Price:= rtemp;
      mll.Message_Show('Success');
      bPrice:=true;
      lblPrice.Caption:='Price:'+FloatToStrF(Event_Price, ffCurrency, 8, 2);
    end
  else
    begin
      mll.Message_Show('You cannot charge less then 0');
    end;
EEdit.Enabled:=true;
end;

procedure TEEdit.btnEdit_URLClick(Sender: TObject);
begin
EEdit.Enabled:=False;
Event_Website:=mll.URL_get('Pick a website');
WBInfo.Navigate(Event_Website);
EEdit.Enabled:=true;
end;

procedure TEEdit.btnInfoClick(Sender: TObject);
begin
EEdit.Enabled:=False; //Displays help messages
  if bNewevent = true then
    begin
      MLL.Message_Show('Welcome to the new` event planner');
      MLL.Message_Show('You can use some of the buttons to the left to insert certain event peramiters');
      MLL.Message_Show('Or you can inser them directly');
      MLL.Message_Show('But please remember to instert values for almost everything');
      MLL.Message_Show('Although a URL link is an optional inclusions');
    end
  else
    begin
      MLL.Message_Show('Welcome to the event planner');
      MLL.Message_Show('You can use some of the buttons to the left to edit certain event peramiters');
      MLL.Message_Show('Please avoid just blanking out fields when editing them');
      MLL.Message_Show('However the URL link is optional and can be wiped');
    end;
EEdit.Enabled:=true;
end;


procedure TEEdit.btnPTBClick(Sender: TObject);
var
iPerm : Integer;
begin
EEdit.Enabled:=False;
iPerm:=mll.int_Input('Choose a value between 0-10', 0);
  if (iPerm <= 10) and (iPerm >= 0) then
    begin
      Event_Perm_Required:=iPerm;
      mll.Message_Show('Success');
      bPTB:=true;
    end
  else
    begin
      mll.Message_Show('Invladed value');
    end;
EEdit.Enabled:=true;
end;

procedure TEEdit.btnSaveClick(Sender: TObject);
begin
EEdit.Enabled:=true;
  if mll.YN_Qeustion('Are you sure about these?') then
    begin
      if bNewevent then //reference: bname, bDOF, bMS, bPrice, bdisc, bPTB
        begin
          if bname=false
            then mll.Message_Show('Name not set')
          else if bDOF = false
            then MLL.Message_Show('Date was not set')
          else if bMS = false
            then mll.Message_Show('No max seats indicated')
          else if bPrice = false
            then mll.Message_Show('You have not specified a price')
          else if bdisc = false
            then mll.Message_Show('You forgot the discription')
          else if bPTB = false
            then mll.Message_Show('You forgot to set a minimum permission Date')
          else
            begin
              BEEP;
              EEdit.Hide;
              mll.MainMenu;
              DMEvents.Event_New( Event_Name,      //Sends the data to the event module to be saved
                                  Event_Website,
                                  Event_Discription,
                                  Event_Price,
                                  Event_Total_seats,
                                  Event_Perm_Required,
                                  Event_Date);
              mll.Event_refresh;
            end;
        end
      else
        begin
          DMEvents.Event_edit( Event_Name,  //Sends the data to the event module to be saved
                               Event_Website,
                               Event_Discription,
                               Event_Price,
                               Event_Total_seats,
                               Event_Perm_Required,
                               Event_Date);
          mll.Event_refresh;
          EEdit.Hide;
          mll.MainMenu;
        end;
    end;
EEdit.Enabled:=true;
end;


procedure TEEdit.Edit_event;
begin
bNewevent:=false;
  with Mll do
    begin
      with ADCconnect do
        begin //Data load protocall
          Event_Name:=DMEvents.ADEvents.Lookup('Event_ID', DMEvents.EID, 'Event_Name');
          Event_Discription:=DMEvents.ADEvents.Lookup('Event_ID', DMEvents.EID, 'Event_Discription');
          Event_Total_seats:=DMEvents.ADEvents.Lookup('Event_ID', DMEvents.EID, 'Event_Total_seats');
          Event_Perm_Required:=DMEvents.ADEvents.Lookup('Event_ID', DMEvents.EID, 'Event_Perm_Required');
          Event_Price:=DMEvents.ADEvents.Lookup('Event_ID', DMEvents.EID, 'Event_Price');
          Event_Date:=DMEvents.ADEvents.Lookup('Event_ID', DMEvents.EID, 'Event_Date');

          lblDate.Caption:=DateToStr(Event_Date);
          PNLsumarry.Caption:=Event_Name;
          lblPrice.Caption:='Price:'+FloatToStrF(Event_Price, ffCurrency, 8, 2);
          lblBooked.Caption:='Edit Event';
          lblSpacesBooked.Caption:=IntToStr(iTB)+'/'+IntToStr(Event_Total_seats);
          memEventDisc.Lines.Clear;
          memEventDisc.Lines.Add(Event_Discription);
          WBInfo.Navigate(Event_Website);
        end;
    end;
end;

procedure TEEdit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Application.Terminate;
end;

procedure TEEdit.FormCreate(Sender: TObject);
begin
  WBInfo.Silent:=true
end;

procedure TEEdit.New_Event; //Loads the editor into new event mode
begin
  bNewevent:=true;
  bname:= false;
  bDOF:= false;
  bMS:= false;
  bPrice:= false;
  bdisc:= false;
  bPTB:= false;

  lblDate.Caption:='Date';
  PNLsumarry.Caption:='Please set a name';
  lblPrice.Caption:='Please enter a price';
  lblBooked.Caption:='New Event';
  memEventDisc.Lines.Clear;
  memEventDisc.Lines.Add('Click here to edit the discription');
  lblSpacesBooked.Caption:='New Event'
end;

procedure TEEdit.sbnEventSelectDownClick(Sender: TObject);
begin
mll.Message_Show('Warning: USELESS BUTTON'); //easter eggs :p
end;

procedure TEEdit.sbnEventSelectUpClick(Sender: TObject);
begin
mll.Message_Show('These are just for show' + #13 + QuotedStr('The easter egg hider'));
end;

end.
