unit GFlogin_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Buttons, DMMainLinkLibary_u;

type
  TLwin = class(TForm) //A simple log in screen
    pnlLogin: TPanel;
    lbeLuser: TLabeledEdit;
    lbeLpass: TLabeledEdit;
    lblPrompt: TLabel;
    PCP: TPageControl;
    TBLogin: TTabSheet;
    TBRegister: TTabSheet;
    btnLLogin: TButton;
    btnLClose: TButton;
    btnLRegister: TButton;
    pnlRegister: TPanel;
    lbeRuser: TLabeledEdit;
    lbeRpass: TLabeledEdit;
    btnRLogin: TButton;
    btnRClose: TButton;
    btnRegister: TButton;
    lbeRNickname: TLabeledEdit;
    lbeREmail: TLabeledEdit;
    pnlMain: TPanel;
    procedure btnLCloseClick(Sender: TObject);
    procedure btnRLoginClick(Sender: TObject);
    procedure btnLRegisterClick(Sender: TObject);
    procedure btnLLoginClick(Sender: TObject);
    procedure btnRegisterClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lblPromptClick(Sender: TObject);
  private
    { Private declarations }
  public

  const
  bROOTOVERRIDE : Boolean = true; //override the login system for debug purposes
    { Public declarations }
  end;

var
Lwin: TLwin;
easter : Boolean = true; //easter egg enitialization
implementation
uses
GFMainMenu_u;



{$R *.dfm}

procedure TLwin.btnLCloseClick(Sender: TObject);
begin
Application.Terminate;
end;


procedure TLwin.btnLLoginClick(Sender: TObject);
var
bcheck: boolean;
begin
  try
    bcheck:=MLL.login(lbeLpass.text ,lbeLuser.text);
    if bcheck=false then
      begin
        mll.Message_Show('Login failed, Pasword or usernamer where incorrect');
      end;
  except
    mll.Message_Show('Login Error!');
  end;
  lbeLpass.Text:='';
  lbeRpass.Text:='';
end;

procedure TLwin.btnLRegisterClick(Sender: TObject);
begin
PCP.SelectNextPage(true, false);
lblPrompt.Caption:='Register';
end;

procedure TLwin.btnRegisterClick(Sender: TObject);
var
suser,spass,semail,snick, spass2:string;
bcheck : boolean;
begin
  suser := lbeRuser.text;
  spass := lbeRpass.text;
  semail:= lbeREmail.text;
  snick := lbeRNickname.Text;
  while spass<>spass2 do
    begin
      spass2:=mll.Password_Input('re-enter your password', 'Password');
      if spass<>spass2 then
        begin
          if mll.YN_Qeustion('Try again?') = false then
            begin
              exit;
            end;
        end;
    end;
  bcheck:= MLL.regist(suser, spass, semail, snick);
    if bcheck = true then
      begin
        mll.login(spass, suser);
      end;
  lbeLpass.Text:='';
  lbeRpass.Text:='';
end;

procedure TLwin.btnRLoginClick(Sender: TObject);
begin
PCP.SelectNextPage(true, false);
lblPrompt.Caption:='Login';
end;

procedure TLwin.FormCreate(Sender: TObject);
begin
PCP.ActivePageIndex:=0;
end;

procedure TLwin.lblPromptClick(Sender: TObject);
begin                                           //easter egg
if easter then
begin
mll.Message_Show('Copywrite HANCORP');
mll.Message_Show('Programer : HANRO LAREMAN');
mll.Message_Show('Do not fork code without permission');
easter:=false;
end;
end;

end.
