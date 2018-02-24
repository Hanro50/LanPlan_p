unit DMfinance_u;
//Handles everything to do with finance and is meant to be open for change if
//any club policies come into play
interface

uses
  SysUtils, Classes, DB, ADODB, DMMainLinkLibary_u, DMAccount_u;

type
  TDMFinance = class(TDataModule)
    ADFin: TADOTable;
    DSfin: TDataSource;
    ADFinfin_Date: TDateTimeField;
    ADFinUD_ID: TIntegerField;
    ADFinfin_Change: TBCDField;
    ADFinfin_reason: TWideStringField;
    ADFinQ: TADOTable;
    ADFinQfin_Date: TDateTimeField;
    ADFinQUD_Username: TWideStringField;
    ADFinQfin_Change: TBCDField;
    ADFinQfin_reason: TWideStringField;
    ADFinfin_ID: TAutoIncField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure F_Change(RChange : real; sReason : string); //records data

    function F_UserDraw(RChange : real; sReason : string) : Boolean; //checks data and then records it

    procedure F_MassRefund(Event_ID : Integer; RChange : real; sReason : string);
    { Public declarations }
  end;

var
  DMFinance: TDMFinance;

implementation

{$R *.dfm}

{ TDMFinance }


{ TDMFinance }

procedure TDMFinance.DataModuleCreate(Sender: TObject);
begin
ADFin.Active:=true;
ADFinQ.Active:=true;
end;

procedure TDMFinance.F_Change(RChange: real; sReason: string);
begin
  with mll.ADCconnect do
    begin
      ADFin.Insert;
      ADFin['fin_date']:=Date;
      ADFin['UD_ID']:=mll.UD_ID;
      ADFin['fin_change']:=RChange;
      ADFin['fin_reason']:=sReason;
      ADFin.post;
    end;


end;

procedure TDMFinance.F_MassRefund(Event_ID: Integer; RChange: real;
  sReason: string);
begin

end;

function TDMFinance.F_UserDraw(RChange: real;
  sReason: string): Boolean;
var rmincredit, rnbalance : real;
begin
case mll.iPL of
0 : rmincredit:=0;  //New users havn't officially been picked up by the club jet so thier denied access to booking on credit
1 : rmincredit:=-500; //normal users are given slack as they're already paying monthly membership fees
2 : rmincredit:=-1500;  //VIP's are typically either poeple who've donated a lot to the club or temporary users who are qeusts at the club
3 : rmincredit:=-3000;  //Special members include people paying in advance...or just members who have a good amount of respect within the club
4 : rmincredit:=-5000;  //Helpers render services too the club like repairing computers or cleaning the club lan spot/house
5 : rmincredit:=-6000;  //Generally just the marketer, normally a outside person/member at random at the moment
else rmincredit := -10000 end; //Staff like the Honorariums sometimes requist that there pay goes directly into keeping thier account balances above zero, thought the club's finance department is a tad slow at times

rnbalance:=(DMAccount.ADTuserdata['UD_Wallet'] + RChange);
if rnbalance <= rmincredit then
  begin
    mll.Message_Show('Insuffesiont funds');
    Result:=false;
  end
else
  begin
    with mll.ADCconnect do
      begin
        DMAccount.ADTuserdata.Edit;
        DMAccount.ADTuserdata['UD_Wallet']:=rnbalance;
        DMAccount.ADTuserdata.post;
      end;
    F_Change(RChange, sReason);
    Result:=true;
  end;



end;



end.
