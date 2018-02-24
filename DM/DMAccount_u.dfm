object DMAccount: TDMAccount
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 365
  Width = 395
  object ADTuserdata: TADOTable
    Active = True
    Connection = MLL.ADCconnect
    CursorType = ctStatic
    TableName = 'UserData'
    Left = 24
    Top = 8
    object ADTuserdataUD_ID: TAutoIncField
      FieldName = 'UD_ID'
      ReadOnly = True
    end
    object ADTuserdataUD_Username: TWideStringField
      FieldName = 'UD_Username'
      Size = 255
    end
    object ADTuserdataUD_Nickname: TWideStringField
      FieldName = 'UD_Nickname'
      Size = 255
    end
    object ADTuserdataUD_Email: TWideStringField
      FieldName = 'UD_Email'
      Size = 255
    end
    object ADTuserdataUD_Prem_level: TFloatField
      FieldName = 'UD_Prem_level'
    end
    object ADTuserdataUD_Password: TWideStringField
      FieldName = 'UD_Password'
      Size = 255
    end
    object ADTuserdataUD_Banned: TBooleanField
      FieldName = 'UD_Banned'
    end
    object ADTuserdataUD_Wallet: TBCDField
      FieldName = 'UD_Wallet'
      Precision = 19
    end
  end
  object IDEincripter: TIdEncoderMIME
    FillChar = '='
    Left = 24
    Top = 128
  end
  object DSTuserdata: TDataSource
    DataSet = ADTuserdata
    Left = 24
    Top = 64
  end
  object ADUDMSF: TADOTable
    Connection = MLL.ADCconnect
    CursorType = ctStatic
    AfterScroll = ADUDMSFAfterScroll
    TableName = 'UserData'
    Left = 24
    Top = 256
    object ADUDMSFUD_Username: TWideStringField
      FieldName = 'UD_Username'
      Size = 255
    end
    object ADUDMSFUD_Nickname: TWideStringField
      FieldName = 'UD_Nickname'
      Size = 255
    end
    object ADUDMSFUD_Prem_level: TFloatField
      FieldName = 'UD_Prem_level'
    end
    object ADUDMSFUD_Banned: TBooleanField
      FieldName = 'UD_Banned'
    end
    object ADUDMSFUD_Wallet: TBCDField
      FieldName = 'UD_Wallet'
      Precision = 19
    end
  end
  object DSUDMSF: TDataSource
    DataSet = ADUDMSF
    Left = 24
    Top = 304
  end
end
