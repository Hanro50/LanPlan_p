object MLL: TMLL
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 301
  Width = 427
  object ADCconnect: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.ACE.OLEDB.12.0;User ID=Admin;Data Source=Serv' +
      'erData.accdb;Mode=Share Deny None;Persist Security Info=False;Je' +
      't OLEDB:System database="";Jet OLEDB:Registry Path="";Jet OLEDB:' +
      'Database Password="";Jet OLEDB:Engine Type=6;Jet OLEDB:Database ' +
      'Locking Mode=1;Jet OLEDB:Global Partial Bulk Ops=2;Jet OLEDB:Glo' +
      'bal Bulk Transactions=1;Jet OLEDB:New Database Password="";Jet O' +
      'LEDB:Create System Database=False;Jet OLEDB:Encrypt Database=Fal' +
      'se;Jet OLEDB:Don'#39't Copy Locale on Compact=False;Jet OLEDB:Compac' +
      't Without Replica Repair=False;Jet OLEDB:SFP=False;Jet OLEDB:Sup' +
      'port Complex Data=False;Jet OLEDB:Bypass UserInfo Validation=Fal' +
      'se'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.ACE.OLEDB.12.0'
    Left = 176
    Top = 224
  end
  object OPDProfile: TOpenPictureDialog
    Filter = 'Portable Network Graphics (*.png)|*.png'
    Left = 240
    Top = 224
  end
  object ADUD_Event: TADOTable
    Active = True
    Connection = ADCconnect
    CursorType = ctStatic
    TableName = 'Events_UD junction'
    Left = 24
    Top = 120
    object ADUD_EventUD_ID: TIntegerField
      FieldName = 'UD_ID'
    end
    object ADUD_EventEvent_ID: TIntegerField
      FieldName = 'Event_ID'
    end
  end
  object ADWhoBooked: TADOTable
    Active = True
    Connection = ADCconnect
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    TableName = 'WB Query'
    Left = 24
    Top = 224
    object ADWhoBookedUD_Username: TWideStringField
      Alignment = taCenter
      DisplayLabel = 'Username'
      DisplayWidth = 30
      FieldName = 'UD_Username'
      Size = 255
    end
    object ADWhoBookedUD_Nickname: TWideStringField
      Alignment = taCenter
      DisplayLabel = 'Nickname:'
      DisplayWidth = 30
      FieldName = 'UD_Nickname'
      Size = 255
    end
    object ADWhoBookedEvent_ID: TAutoIncField
      FieldName = 'Event_ID'
      ReadOnly = True
    end
  end
  object DSWhoBooked: TDataSource
    DataSet = ADWhoBooked
    Left = 104
    Top = 224
  end
  object ADScoreQ: TADOTable
    Active = True
    Connection = ADCconnect
    CursorType = ctStatic
    TableName = 'Score Query'
    Left = 24
    Top = 176
  end
  object DSScoreQ: TDataSource
    DataSet = ADScoreQ
    Left = 104
    Top = 176
  end
  object OTDScore_load: TOpenTextFileDialog
    Left = 240
    Top = 168
  end
  object adscore: TADOTable
    Active = True
    Connection = ADCconnect
    CursorType = ctStatic
    TableName = 'Scores'
    Left = 24
    Top = 64
  end
end
