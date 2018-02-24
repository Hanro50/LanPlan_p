unit GFDialog_u;
//spawns custom dialog messages
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, OleCtrls, SHDocVw, Grids, DBGrids, DMMainLinkLibary_u;

type
  TGFInput2 = class(TForm)    //A lot of UI was copy and pasted and since not all of it is ever even called the names have remained standard
    PCDialog: TPageControl;
    pnlMemo: TPanel;
    Panel22: TPanel;
    Panel23: TPanel;
    Panel24: TPanel;
    Panel25: TPanel;
    Button2: TButton;
    Panel11: TPanel;
    Panel26: TPanel;
    lblQ3: TLabel;
    memOut: TMemo;
    Panel15: TPanel;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    pnlDate: TPanel;
    Panel32: TPanel;
    Panel33: TPanel;
    Panel34: TPanel;
    Panel35: TPanel;
    Button3: TButton;
    Panel36: TPanel;
    lblQ5: TLabel;
    Panel37: TPanel;
    Panel38: TPanel;
    MCDate: TMonthCalendar;
    Panel1: TPanel;
    Panel2: TPanel;
    TabSheet3: TTabSheet;
    pnlWeb: TPanel;
    Panel41: TPanel;
    Panel42: TPanel;
    Panel43: TPanel;
    Panel40: TPanel;
    btnLURL: TButton;
    Panel45: TPanel;
    btnDoneURL: TButton;
    Panel44: TPanel;
    lblQ10: TLabel;
    edtURL: TEdit;
    WBPreview: TWebBrowser;
    Panel46: TPanel;
    Panel47: TPanel;
    TabSheet4: TTabSheet;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Button1: TButton;
    Panel8: TPanel;
    Panel9: TPanel;
    Label1: TLabel;
    Panel10: TPanel;
    DBWB: TDBGrid;
    procedure btnLURLClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnDoneURLClick(Sender: TObject);
  private
  var
  sURL :string;
  bdone : boolean;
  procedure wait;
    { Private declarations }
  public
  function Memo_Input(sQeustion, sdefault : string) : string; //Text input
  function URL_get(sQuestion : string): string;  //text input
  function Date_get(sQeustion : string) : TDate; //Date input

  procedure Message_WB(iEventID : Integer); //Shows who has booked for an event
    { Public declarations }
  end;

var
  GFInput2: TGFInput2;

implementation

{$R *.dfm}

procedure TGFInput2.btnDoneURLClick(Sender: TObject);
begin
bdone:=true;
end;

procedure TGFInput2.btnLURLClick(Sender: TObject);
begin
try
WBPreview.Navigate(edtURL.Text);
sURL:=edtURL.text;
btnDoneURL.Enabled:=true;
except
edtURL.text:='Error Loading preview!'; //Just incase something goes wrong with the Web component
end;
end;

function TGFInput2.Date_get(sQeustion: string): TDate;
begin
MCDate.Date:=Date;
PCDialog.ActivePageIndex:=1;
lblQ5.Caption:=sQeustion;
GFInput2.Show;
Wait;
Result:=MCDate.Date;
GFInput2.Hide;
end;

procedure TGFInput2.FormCreate(Sender: TObject);
begin
WBPreview.Silent:=true;
end;

procedure TGFInput2.FormShow(Sender: TObject);
begin
GFInput2.Width:=500;
GFInput2.Height:=500;
end;

function TGFInput2.Memo_Input(sQeustion, sdefault: string): string;
begin
PCDialog.ActivePageIndex:=0;
lblQ3.Height:= 33 + ((Length(sQeustion) div 20) * 33);
lblQ3.Caption:=sQeustion;
memOut.Lines.clear;
memout.Lines.add(sdefault);
GFInput2.Show;
Wait;
Result:=memOut.Lines.Text;
GFInput2.hide;
end;

procedure TGFInput2.Message_WB(iEventID: Integer);
begin
PCDialog.ActivePageIndex:=3;
mll.ADWhoBooked.Filtered:=false;
mll.ADWhoBooked.Filter:='Event_ID =' + IntToStr(iEventID);
MLL.ADWhoBooked.Filtered:=true;

GFInput2.show;

DBWB.Columns.Items[0].Visible:=false;   //Delphi's buggy GUI will be Delphi's buggy gui
DBWB.Columns.Items[1].Visible:=false;
DBWB.Columns.Items[2].Visible:=false;

DBWB.Columns.Items[0].Width:=155;
DBWB.Columns.Items[0].Alignment:=taCenter;
DBWB.Columns.Items[0].Title.Caption:='Username';
DBWB.Columns.Items[0].Title.Alignment:=taCenter;
DBWB.Columns.Items[0].Visible:=true;

DBWB.Columns.Items[1].Width:=155;
DBWB.Columns.Items[1].Alignment:=taCenter;
DBWB.Columns.Items[1].Title.Caption:='Nickname';
DBWB.Columns.Items[1].Title.Alignment:=taCenter;
DBWB.Columns.Items[1].Visible:=true;

wait;
GFInput2.hide;
end;

function TGFInput2.URL_get(sQuestion: string): string;
begin
PCDialog.ActivePageIndex:=2;
lblQ10.Height:= 33 + ((Length(sQuestion) div 20) * 33);
btnDoneURL.Enabled:=false; //turned false as the user has to load a page into the previewer
WBPreview.Navigate('');
edtURL.Text:='';
lblQ10.Caption:=sQuestion;
GFInput2.Show;
Wait;
Result:=sURL;
GFInput2.hide;
end;

procedure TGFInput2.wait;
begin
bdone:=false;
while bdone=False do
begin
sleep(100);
Application.ProcessMessages;
end;
end;

end.
