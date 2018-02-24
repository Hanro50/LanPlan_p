unit GFBox_u;
//spawns custom dialog messages
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, IdBaseComponent, IdThreadComponent,
  IWBaseComponent, IWBaseHTMLComponent, IWBaseHTML40Component, IWExtCtrls,
  IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl, IWGrids,
  IWCompCalendar, OleCtrls, SHDocVw, GFDialog_u;

type
  TGFInput = class(TForm) //A lot of UI was copy and pasted and since not all of it is ever even called the names have remained standard
    PCBox: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    pnlBoolean: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    btnYes: TButton;
    Panel12: TPanel;
    lblQ2: TLabel;
    btnNO: TButton;
    Panel13: TPanel;
    Panel14: TPanel;
    pnlText: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    btndone: TButton;
    Panel6: TPanel;
    lblQ: TLabel;
    edtout: TEdit;
    Panel16: TPanel;
    TabSheet4: TTabSheet;
    pnlMessage: TPanel;
    Panel20: TPanel;
    Button1: TButton;
    Panel28: TPanel;
    lblOut: TLabel;
    Panel29: TPanel;
    btnADP: TButton;
    Panel48: TPanel;
    TabSheet7: TTabSheet;
    Panel30: TPanel;
    Panel1: TPanel;
    Panel7: TPanel;
    Panel11: TPanel;
    procedure FormShow(Sender: TObject);
    procedure btnDoneClick(Sender: TObject);
    procedure btnYesClick(Sender: TObject);
    procedure btnNOClick(Sender: TObject);
    procedure btnADPClick(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);

  private
  var
  procedure Wait;
  procedure refresh;
    { Private declarations }
  public
  function Text_Input(sQeustion, sdefault : string) : string; //gets text input
  function int_Input(sQeustion : string; iDefault : Integer) : Integer; //gets integer input
  function real_Input(sQeustion : string; Rdefault : real) : real; //gets real input
  Function Password_Input(sQeustion, sdefault : string) : string; //gets text input with pasword mask
  function YN_Qeustion(sQeustion : string) : Boolean; //gets boolean input
  function Memo_Input(sQeustion, sdefault : string) : string; //gets text input, but only more
  function Date_get(sQeustion : string) : TDate; //gets date input
  function URL_get(sQuestion : string): string; //gets text(Links) input

  procedure Message_Show(sInput : string); //custom showmessage
  procedure Message_WB(iEventID : Integer); //Check who's booked for an event

    { Public declarations }
  end;

var
  GFInput: TGFInput;
  soutput : string;
  bdone : Boolean;
  bNY : Boolean;



implementation
{$R *.dfm}

{ TGFInput }



procedure TGFInput.btnADPClick(Sender: TObject);
begin
if Pos('.', edtout.Text) = 0  then
begin
  edtout.Text:=edtout.Text+'.';
end;

end;

procedure TGFInput.btnDoneClick(Sender: TObject);
begin
bdone:=true;
end;


procedure TGFInput.btnNOClick(Sender: TObject);
begin
bNY:=false;
bdone:=true;
end;

procedure TGFInput.btnYesClick(Sender: TObject);
begin
bNY:=true;
bdone:=true;
end;

function TGFInput.Date_get(sQeustion: string): TDate;
begin
Result:=GFInput2.Date_get(sQeustion);    //GFBOX and GFDialog use to be one module and where split due to a GUI bug in delphi
end;

procedure TGFInput.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
GFInput.refresh;

end;

procedure TGFInput.FormShow(Sender: TObject);
begin
GFInput.Width:=450;
GFInput.Height:=300;
end;

function TGFInput.int_Input(sQeustion: string; iDefault: Integer): Integer; //The editor might claim that this procedure is faulty
var                                                                         //It isn't, it just doesn't detect that the result gets set in the try block
bError : Boolean;
begin
edtout.NumbersOnly:=true;
bError:=true;
while bError do
  begin
    try
      Result:=StrToint(Text_Input(sQeustion, intToStr(idefault)));
      bError:=False;
    except
      Message_Show('Error, Invalid numbers where entered');
      bError:=true; //causes these procdure to loop again, thus the wanser can never NOT be set
    end;
  end;
  edtout.NumbersOnly:=False;
end;

function TGFInput.Memo_Input(sQeustion, sdefault: string): string;
begin
Result:=GFInput2.Memo_Input(sQeustion, sdefault); //GFBOX and GFDialog use to be one module and where split due to a GUI bug in delphi
end;

procedure TGFInput.Message_Show(sInput: string);
begin
PCBox.ActivePageIndex:=2;
lblOut.Caption:=sInput;
GFInput.Show;
Wait;
GFInput.Hide;
end;



procedure TGFInput.Message_WB(iEventID: Integer);
begin
GFInput2.Message_WB(iEventID); //GFBOX and GFDialog use to be one module and where split due to a GUI bug in delphi
end;

function TGFInput.Password_Input(sQeustion, sdefault: string): string;
begin
EdtOut.PasswordChar:='*';
result:=Text_Input(sQeustion, sdefault);
EdtOut.Text:='';
EdtOut.PasswordChar:=#0;
end;


function TGFInput.real_Input(sQeustion: string; Rdefault: real): real; //The editor might claim that this procedure is faulty
var                                                                    //It isn't, it just doesn't detect that the result gets set in the try block
bError : Boolean;
begin
  btnADP.Visible:=true;
  edtout.NumbersOnly:=true;
  bError:=true;
    while bError do
      begin
        try
          Result:=StrToFloat(Text_Input(sQeustion, FloatToStr(Rdefault)));
          bError:=False;
        except
          Message_Show('Error, Invalid numbers where entered');
          bError:=true; //causes these procdure to loop again, thus the wanser can never NOT be set
        end;
      end;
  edtout.NumbersOnly:=False;
end;

procedure TGFInput.refresh;
begin
bdone:=true;
PCBox.Realign;
PCBox.Align:=alClient;
sleep(101);
bdone:=false;
end;

function TGFInput.Text_Input(sQeustion, sdefault : string) : string;
begin
PCBox.ActivePageIndex:=0;
GFInput.Show;
lblQ.Caption:=sQeustion;
EdtOut.Text:=sdefault;
Wait;
Result:=EdtOut.Text;
GFInput.Hide;
btnADP.Visible:=false;
end;



function TGFInput.URL_get(sQuestion: string): string;
begin
Result:=GFInput2.URL_get(sQuestion); //GFBOX and GFDialog use to be one module and where split due to a GUI bug in delphi
end;

procedure TGFInput.Wait;
begin
bdone:=false;
while bdone=False do
begin
sleep(100);
Application.ProcessMessages;
end;
end;

function TGFInput.YN_Qeustion(sQeustion: string): Boolean;
begin
PCBox.ActivePageIndex:=1;
lblQ2.Caption:=sQeustion;
GFInput.Show;
wait;
Result:=bNY;
GFInput.Hide;
end;

end.



