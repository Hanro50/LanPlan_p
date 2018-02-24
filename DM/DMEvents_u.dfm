object DMEvents: TDMEvents
  Left = 0
  Top = 0
  ClientHeight = 348
  ClientWidth = 442
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ADEvents: TADOTable
    Connection = MLL.ADCconnect
    CursorType = ctStatic
    TableDirect = True
    TableName = 'Events'
    Left = 32
    Top = 40
    object ADEventsEvent_ID: TAutoIncField
      FieldName = 'Event_ID'
      ReadOnly = True
    end
    object ADEventsEvent_Name: TWideStringField
      FieldName = 'Event_Name'
      Size = 255
    end
    object ADEventsEvent_Price: TBCDField
      FieldName = 'Event_Price'
      Precision = 19
    end
    object ADEventsEvent_Total_seats: TIntegerField
      FieldName = 'Event_Total_seats'
    end
    object ADEventsEvent_Website: TWideStringField
      FieldName = 'Event_Website'
      Size = 255
    end
    object ADEventsEvent_Perm_Required: TIntegerField
      FieldName = 'Event_Perm_Required'
    end
    object ADEventsEvent_Discription: TWideMemoField
      FieldName = 'Event_Discription'
      BlobType = ftWideMemo
    end
    object ADEventsEvent_Date: TDateTimeField
      FieldName = 'Event_Date'
    end
  end
  object DSEvents: TDataSource
    DataSet = ADEvents
    Left = 32
    Top = 104
  end
end
