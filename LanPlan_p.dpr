program LanPlan_p;

uses
  Forms,
  GFBox_u in 'GF\GFBox_u.pas',
  GFlogin_u in 'GF\GFlogin_u.pas',
  GFMainMenu_u in 'GF\GFMainMenu_u.pas' {Form1},
  DMAccount_u in 'DM\DMAccount_u.pas' {DMAccount: TDataModule},
  DMfinance_u in 'DM\DMfinance_u.pas' {DMFinance: TDataModule},
  GFBooker_u in 'GF\GFBooker_u.pas' {EEdit},
  DMEvents_u in 'DM\DMEvents_u.pas' {DMEvents: TDataModule},
  GFDebug_u in 'GF\GFDebug_u.pas' {GFDebug},
  DMMainLinkLibary_u in 'DM\DMMainLinkLibary_u.pas',
  GFDialog_u in 'GF\GFDialog_u.pas' {GFInput2};

{MLL: TDataModule}


//register_u in 'register_u.pas';
{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TLwin, Lwin);
  Application.CreateForm(TMLL, MLL);
  Application.CreateForm(TDMAccount, DMAccount);
  Application.CreateForm(TDMFinance, DMFinance);
  Application.CreateForm(TDMEvents, DMEvents);
  Application.CreateForm(TEEdit, EEdit);
  Application.CreateForm(TMMS, MMS);
  Application.CreateForm(TGFDebug, GFDebug);
  Application.CreateForm(TGFInput, GFInput);
  Application.CreateForm(TGFInput2, GFInput2);
  Application.Run;
end.
