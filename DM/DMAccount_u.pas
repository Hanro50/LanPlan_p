unit DMAccount_u;
//Handles the login and register procedures
interface

uses
  SysUtils, Classes, DB, ADODB, IdBaseComponent, IdCoder, IdCoder3to4,
  IdCoderMIME, Variants, Dialogs;

type
  TDMAccount = class(TDataModule)
    ADTuserdata: TADOTable;
    IDEincripter: TIdEncoderMIME;
    DSTuserdata: TDataSource;
    ADTuserdataUD_ID: TAutoIncField;
    ADTuserdataUD_Username: TWideStringField;
    ADTuserdataUD_Nickname: TWideStringField;
    ADTuserdataUD_Email: TWideStringField;
    ADTuserdataUD_Prem_level: TFloatField;
    ADTuserdataUD_Password: TWideStringField;
    ADUDMSF: TADOTable;
    ADTuserdataUD_Banned: TBooleanField;
    ADTuserdataUD_Wallet: TBCDField;
    DSUDMSF: TDataSource;
    ADUDMSFUD_Username: TWideStringField;
    ADUDMSFUD_Prem_level: TFloatField;
    ADUDMSFUD_Banned: TBooleanField;
    ADUDMSFUD_Wallet: TBCDField;
    ADUDMSFUD_Nickname: TWideStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure ADUDMSFAfterScroll(DataSet: TDataSet);
  private


    { Private declarations }
  public
  var
  aUserdata : array[0..10] of string;
  //ID: Variant;
  function login(spassword, susername : string) : boolean;
  function regist(Suser, Spasword, Semail, Snick: string) : Boolean;
  function DBget(sfieldname:string) : Variant;
  function DBcheck(sfieldname, sdata : string) : Boolean;
    { Public declarations }
  end;

  Struct1 = record
  end;

var
  DMAccount: TDMAccount;

implementation

uses DMMainLinkLibary_u;

{$R *.dfm}

{ TDBcon }

procedure TDMAccount.ADUDMSFAfterScroll(DataSet: TDataSet);
begin
try
MLL.AMC_userselect;
except
  //The above command causes errors when the program is loading
  //These has to do with the load order of the moduals

  //So to avoid voilating the host machine its better to just pur these in a try block
end;
end;

procedure TDMAccount.DataModuleCreate(Sender: TObject);
begin
ADTuserdata.Active:=true;
ADUDMSF.Active:=true;
end;

function TDMAccount.DBcheck(sfieldname, sdata: string): Boolean;
begin
Result:=ADTuserdata.Locate(sfieldname, sdata, []);
end;

function TDMAccount.DBget(sfieldname: string): Variant;
begin
Result:= ADTuserdata.Lookup('UD_ID', mll.UD_ID, sfieldname);
end;

function TDMAccount.login(spassword, susername: string): boolean; //login prompt     
begin
spassword:=IDEincripter.Encode(spassword);
Result:=ADTuserdata.Locate('UD_Username;UD_Password', VarArrayOf([susername, spassword]), []);
if result = true then
  begin
    mll.UD_ID:= ADTuserdata.Lookup('UD_Username;UD_Password', VarArrayOf([susername, spassword]), 'UD_ID' );
    mll.iPL:= DBget('UD_Prem_level');
  end;
end;


function TDMAccount.regist(Suser, Spasword, Semail, Snick: string): Boolean;
begin
if DBcheck('UD_Username', Suser) = true then
  begin
    mll.Message_Show('Username taken');   //Checks wheater username is taken
    Result:=false;
    exit;
  end
else if DBcheck('UD_Email', Semail) = true then
  begin
    mll.Message_Show('Email taken');   //Checks wheater email is taken
    Result:=false;
    exit;
  end
else if DBcheck('UD_Nickname', Snick) = true then
  begin
    mll.Message_Show('Nickname taken'); //checks wheater nickname is taken
    Result:=false;
    exit;
  end
else if system.Length(Suser) < 3 then //checks if usernmame is correct lenght
  begin
    mll.Message_Show('Username must be 3 or more characters long');
    Result:=false;
    exit;
  end
else if (system.Length(Semail) < 3)  then //checks if email is off valid lenght
  begin
    mll.Message_Show('Email must be 3 or more characters long');
    Result:=false;
    exit;
  end
else if (Pos('@', Semail) = 0) then   //checks if email has a @simble
  begin
    mll.Message_Show('Email must contain a "@" character');
    Result:=false;
    exit;
  end
else if system.Length(Spasword) < 8 then   //checks if password is of a long enought lenght
  begin
    mll.Message_Show('Pasword must be 8 or more characters long');
    Result:=false;
    exit;
  end
else if system.Length(Snick) < 3 then   //checks if nickname is the correct lenght
  begin
    mll.Message_Show('Your Nickname must be 3 or more characters long');
    Result:=false;
    exit;
  end
else
  begin
    Spasword:= IDEincripter.Encode(Spasword);
    with mll.ADCconnect do  //write to database procedure
      begin
        ADTuserdata.insert;
        ADTuserdata['UD_Username'] := suser;
        ADTuserdata['UD_Password'] := spasword;
        ADTuserdata['UD_Email']    := semail;
        ADTuserdata['UD_Nickname'] := snick;
        ADTuserdata['UD_Prem_level']:=00;
        ADTuserdata['UD_Banned']:=false;
        ADTuserdata['UD_Wallet']:=0;
        ADTuserdata.Post;
end;
mll.Message_Show('Wecome new user');
Result:=true;
end;
end;

end.
