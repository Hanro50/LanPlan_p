unit GFib_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls;

type
  TGFInput = class(TForm)
    Panel1: TPanel;
    edtin: TEdit;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    lblQ: TLabel;
    PCmain: TPageControl;
    TBSText: TTabSheet;
    TBSDebug: TTabSheet;
    btnTI: TButton;
    BTNdone: TButton;
    Panel6: TPanel;
    procedure btnTIClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
  var
  BDone : Boolean;
  procedure done;
    { Private declarations }
  public
  function Text_Input(sQeustion, sdefault : string) : string;
    { Public declarations }
  end;

var
  GFInput: TGFInput;



implementation
uses
DMMainLinkLibary_u, THWait_u;
{$R *.dfm}

{ TGFInput }

procedure TGFInput.btnTIClick(Sender: TObject);
begin
TBSText.PageControl.ActivePageIndex:=0;
Text_Input('1', '1');
end;

procedure TGFInput.done;
begin
BDone:=true;
end;

procedure TGFInput.FormCreate(Sender: TObject);
begin
BDone:=false;
end;

function TGFInput.Text_Input(sQeustion, sdefault : string) : string;
begin
//




end;

end.



