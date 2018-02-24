object GFDebug: TGFDebug
  Left = 0
  Top = 0
  Caption = 'GFDebug'
  ClientHeight = 452
  ClientWidth = 713
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 713
    Height = 452
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Debug'
      object DBGrid1: TDBGrid
        Left = 3
        Top = 3
        Width = 320
        Height = 120
        DataSource = DMEvents.DSEvents
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object DBGrid2: TDBGrid
        Left = 3
        Top = 129
        Width = 320
        Height = 120
        DataSource = DMAccount.DSTuserdata
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object btnQText: TButton
        Left = 56
        Top = 305
        Width = 75
        Height = 25
        Caption = 'btnQText'
        TabOrder = 2
        OnClick = btnQTextClick
      end
      object btnQYN: TButton
        Left = 56
        Top = 336
        Width = 75
        Height = 25
        Caption = 'btnYN'
        TabOrder = 3
        OnClick = btnQYNClick
      end
      object btnQMemo: TButton
        Left = 56
        Top = 367
        Width = 75
        Height = 25
        Caption = 'btnQMemo'
        TabOrder = 4
        OnClick = btnQMemoClick
      end
      object btnTOutput: TButton
        Left = 152
        Top = 305
        Width = 75
        Height = 25
        Caption = 'btnTOutput'
        TabOrder = 5
        OnClick = btnTOutputClick
      end
      object btnPasword: TButton
        Left = 152
        Top = 336
        Width = 75
        Height = 25
        Caption = 'btnQPasword'
        TabOrder = 6
        OnClick = btnPaswordClick
      end
      object btnQDate: TButton
        Left = 152
        Top = 367
        Width = 75
        Height = 25
        Caption = 'btnQDate'
        TabOrder = 7
        OnClick = btnQDateClick
      end
      object btnQURL: TButton
        Left = 233
        Top = 305
        Width = 75
        Height = 25
        Caption = 'btnQURL'
        TabOrder = 8
        OnClick = btnQURLClick
      end
      object btnQReal: TButton
        Left = 233
        Top = 336
        Width = 75
        Height = 25
        Caption = 'btnQReal'
        TabOrder = 9
        OnClick = btnQRealClick
      end
      object Button1: TButton
        Left = 233
        Top = 367
        Width = 75
        Height = 25
        Caption = 'btnQint'
        TabOrder = 10
        OnClick = Button1Click
      end
      object DBGrid3: TDBGrid
        Left = 329
        Top = 3
        Width = 320
        Height = 120
        DataSource = DMFinance.DSfin
        TabOrder = 11
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object DBGrid4: TDBGrid
        Left = 329
        Top = 129
        Width = 320
        Height = 120
        DataSource = DataSource1
        TabOrder = 12
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = MLL.ADUD_Event
    Left = 384
    Top = 312
  end
end
