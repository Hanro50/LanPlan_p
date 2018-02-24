unit DMEvents_u;
//These modual house the event system. Every edit to the event table will pass throught here
interface

uses
  SysUtils, Classes, DB, ADODB, ExtCtrls, DBCtrls, Forms, Variants;

type
  TDMEvents = class(TForm)
    ADEvents: TADOTable;
    DSEvents: TDataSource;
    ADEventsEvent_ID: TAutoIncField;
    ADEventsEvent_Name: TWideStringField;
    ADEventsEvent_Price: TBCDField;
    ADEventsEvent_Total_seats: TIntegerField;
    ADEventsEvent_Website: TWideStringField;
    ADEventsEvent_Perm_Required: TIntegerField;
    ADEventsEvent_Discription: TWideMemoField;
    ADEventsEvent_Date: TDateTimeField;
    procedure DataModuleCreate(Sender: TObject);
  private
  const
  Fpath: string = 'Events\';
    { Private declarations }
  public
  procedure ID_get;
  Procedure Event_Next; //The next event buttons on the main menu link to these command
  Procedure Event_Back; //The previous event buttons on the main menu link to these command
  Procedure Event_book; //The book button activates the procedure
  Procedure Event_Unbook;

  function Event_New(  Event_Name, Event_Website, Event_Discription :string; //The backend for the GFbooker screen
                        Event_Price : real;
                        Event_Total_seats, Event_Perm_Required : Integer;
                        Event_Date : Tdate) : Boolean;

  procedure Event_edit(  Event_Name, Event_Website, Event_Discription :string;
                        Event_Price : real;
                        Event_Total_seats, Event_Perm_Required : Integer;
                        Event_Date : Tdate);
  var
  EID : string;   //Event ID
    { Public declarations }
  end;

var
  DMEvents: TDMEvents;

implementation
uses
DMMainLinkLibary_u, DMAccount_u;


{$R *.dfm}




 { TDMEvents }



procedure TDMEvents.DataModuleCreate(Sender: TObject);
begin
ID_get;
ADEvents.Active:=true;
end;

procedure TDMEvents.Event_Back;
begin
  ADEvents.Prior;
end;

procedure TDMEvents.Event_book;
begin
with mll.ADCconnect do
  begin
    mll.ADUD_Event.Insert;
    mll.ADUD_Event['UD_ID']:=mll.UD_ID;
    MLL.ADUD_Event['Event_ID']:=EID;
    mll.ADUD_Event.Post;
    mll.ADWhoBooked.Active:=false;
    mll.ADWhoBooked.Active:=true;
  end;
mll.Event_refresh;
end;

procedure TDMEvents.Event_edit(Event_Name, Event_Website,
  Event_Discription: string; Event_Price: real; Event_Total_seats,
  Event_Perm_Required: Integer; Event_Date: Tdate);
begin
  try
    with mll.ADCconnect do
      begin
        ADEvents.Edit;
        ADEvents['Event_Name']:=Event_Name;
        ADEvents['Event_Price']:=Event_Price;
        ADEvents['Event_Total_seats']:=Event_Total_seats;
        ADEvents['Event_Website']:=Event_Website;
        ADEvents['Event_Discription']:=Event_Discription;
        ADEvents['Event_Perm_Required']:=Event_Perm_Required;
        ADEvents['Event_Date']:=Event_Date;
        ADEvents.Post;
        mll.Message_Show('Success');
        ADEvents.Refresh;
      end;
  except
    mll.Message_Show('Failed to save!');
  end;
end;

function TDMEvents.Event_New(Event_Name, Event_Website,
  Event_Discription: string; Event_Price: real; Event_Total_seats,
  Event_Perm_Required: Integer; Event_Date: Tdate): Boolean;
begin
  try
    with mll.ADCconnect do
      begin
        ADEvents.Insert;   //the insert procedure
        ADEvents['Event_Name']:=Event_Name;
        ADEvents['Event_Price']:=Event_Price;
        ADEvents['Event_Total_seats']:=Event_Total_seats;
        ADEvents['Event_Website']:=Event_Website;
        ADEvents['Event_Discription']:=Event_Discription;
        ADEvents['Event_Perm_Required']:=Event_Perm_Required;
        ADEvents['Event_Date']:=Event_Date;
        ADEvents.Post;
        ADEvents.Refresh;
      end;
    mll.Message_Show('Success');
    Result:=true;
  except
    mll.Message_Show('Failed to save!');
    Result:=false;
  end;

end;

procedure TDMEvents.Event_Next;
begin
  ADEvents.next;
end;

procedure TDMEvents.Event_Unbook;
begin
  if mll.ADUD_Event.Locate('UD_ID;Event_ID', VarArrayOf([mll.UD_ID, DMEvents.EID]), []) then
    begin
      with mll.ADCconnect do
        begin
          mll.ADUD_Event.Delete;
          mll.Event_refresh;
          mll.ADWhoBooked.Active:=false;
          mll.ADWhoBooked.Active:=true;
        end;
    end;
end;

procedure TDMEvents.ID_get;
var
DBedit : TDBEdit;
begin
DBedit := TDBEdit.Create(MLL.ADCconnect);
try
  DBedit.DataSource:=DSEvents;
  DBedit.DataField:='Event_ID';
  EID:=DBedit.Text;
finally
  DBedit.Free;
end;
end;

end.


















