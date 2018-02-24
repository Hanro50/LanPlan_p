object DMFinance: TDMFinance
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 260
  Width = 413
  object ADFin: TADOTable
    Active = True
    Connection = MLL.ADCconnect
    CursorType = ctStatic
    TableName = 'Finance'
    Left = 144
    Top = 64
    object ADFinfin_ID: TAutoIncField
      FieldName = 'fin_ID'
      ReadOnly = True
    end
    object ADFinfin_Date: TDateTimeField
      FieldName = 'fin_Date'
    end
    object ADFinUD_ID: TIntegerField
      FieldName = 'UD_ID'
    end
    object ADFinfin_Change: TBCDField
      FieldName = 'fin_Change'
      Precision = 19
    end
    object ADFinfin_reason: TWideStringField
      FieldName = 'fin_reason'
      Size = 255
    end
  end
  object DSfin: TDataSource
    DataSet = ADFinQ
    Left = 64
    Top = 72
  end
  object ADFinQ: TADOTable
    Active = True
    Connection = MLL.ADCconnect
    CursorType = ctStatic
    TableName = 'Finance Query'
    Left = 144
    Top = 120
    object ADFinQfin_Date: TDateTimeField
      DisplayWidth = 14
      FieldName = 'fin_Date'
    end
    object ADFinQUD_Username: TWideStringField
      DisplayWidth = 14
      FieldName = 'UD_Username'
      Size = 255
    end
    object ADFinQfin_Change: TBCDField
      DisplayWidth = 10
      FieldName = 'fin_Change'
      Precision = 19
    end
    object ADFinQfin_reason: TWideStringField
      DisplayWidth = 71
      FieldName = 'fin_reason'
      Size = 255
    end
  end
end
