unit GFDebug_u;
//NOTICE
//DEBUGGER
//THESE ISN"T PART OF MY PAT
//Meant for debugging only

//NOTICE
//DEBUGGER
//THESE ISN"T PART OF MY PAT
//Meant for debugging only

//NOTICE
//DEBUGGER
//THESE ISN"T PART OF MY PAT
//Meant for debugging only

//NOTICE
//DEBUGGER
//THESE ISN"T PART OF MY PAT
//Meant for debugging only

//NOTICE
//DEBUGGER
//THESE ISN"T PART OF MY PAT
//Meant for debugging only

//NOTICE
//DEBUGGER
//THESE ISN"T PART OF MY PAT
//Meant for debugging only

//NOTICE
//DEBUGGER
//THESE ISN"T PART OF MY PAT
//Meant for debugging only

//NOTICE
//DEBUGGER
//THESE ISN"T PART OF MY PAT
//Meant for debugging only

//NOTICE
//DEBUGGER
//THESE ISN"T PART OF MY PAT
//Meant for debugging only

//NOTICE
//DEBUGGER
//THESE ISN"T PART OF MY PAT
//Meant for debugging only
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DMEvents_u, Grids, DBGrids, StdCtrls, Mask, DBCtrls, DMAccount_u, DMfinance_u,
  DB;

type
  TGFDebug = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    btnQText: TButton;
    btnQYN: TButton;
    btnQMemo: TButton;
    btnTOutput: TButton;
    btnPasword: TButton;
    btnQDate: TButton;
    btnQURL: TButton;
    btnQReal: TButton;
    Button1: TButton;
    DBGrid3: TDBGrid;
    DBGrid4: TDBGrid;
    DataSource1: TDataSource;
    procedure btnQTextClick(Sender: TObject);
    procedure btnQYNClick(Sender: TObject);
    procedure btnQMemoClick(Sender: TObject);
    procedure btnTOutputClick(Sender: TObject);
    procedure btnPaswordClick(Sender: TObject);
    procedure btnQDateClick(Sender: TObject);
    procedure btnQURLClick(Sender: TObject);
    procedure btnQRealClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  GFDebug: TGFDebug;

implementation
uses
DMMainLinkLibary_u;

{$R *.dfm}

procedure TGFDebug.btnPaswordClick(Sender: TObject);
begin
ShowMessage(mll.Password_Input('Hello world', 'Test'));
end;

procedure TGFDebug.btnQDateClick(Sender: TObject);
begin
ShowMessage(DateToStr(mll.Date_get('Hello world Man')));
end;

procedure TGFDebug.btnQMemoClick(Sender: TObject);
begin
ShowMessage(mll.Memo_Input('Hello world', 'TESTING 102'));
end;

procedure TGFDebug.btnQRealClick(Sender: TObject);
begin
ShowMessage(FloatToStr(mll.real_Input('Random input', StrToFloat('5.99') )));
end;

procedure TGFDebug.btnQTextClick(Sender: TObject);
begin
showmessage(mll.Text_Input('Quastion here','1'));
end;

procedure TGFDebug.btnQURLClick(Sender: TObject);
begin
ShowMessage(mll.URL_get('I reject your reality and subsitute my own'));
end;

procedure TGFDebug.btnQYNClick(Sender: TObject);
begin
if mll.YN_Qeustion('test') then ShowMessage('true') else ShowMessage('false');
end;

procedure TGFDebug.btnTOutputClick(Sender: TObject);
begin
mll.Message_Show('Hello world');
end;

procedure TGFDebug.Button1Click(Sender: TObject);
begin
ShowMessage(IntToStr(MLL.int_Input('Input a number kid', 404)));

end;

end.
