object EEdit: TEEdit
  Left = 0
  Top = 0
  Caption = 'Event editor'
  ClientHeight = 622
  ClientWidth = 1011
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  ScreenSnap = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PNLBooker: TPanel
    Left = 0
    Top = 0
    Width = 1011
    Height = 622
    Align = alClient
    BevelEdges = []
    BevelOuter = bvNone
    Color = 1184274
    Font.Charset = DEFAULT_CHARSET
    Font.Color = -1
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    object PNLBookerButtons: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 95
      Width = 158
      Height = 524
      Align = alLeft
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Color = 2763306
      ParentBackground = False
      TabOrder = 0
      object btnEdit_date: TButton
        Left = 0
        Top = 41
        Width = 158
        Height = 41
        Hint = 'The date on which these event happens'
        Align = alTop
        Caption = 'Edit Date'
        ParentShowHint = False
        ShowHint = True
        Style = bsCommandLink
        TabOrder = 0
        OnClick = btnEdit_dateClick
      end
      object btnEdit_name: TButton
        Left = 0
        Top = 0
        Width = 158
        Height = 41
        Hint = 'The name of these event'
        Align = alTop
        Caption = 'Edit Name'
        ParentShowHint = False
        ShowHint = True
        Style = bsCommandLink
        TabOrder = 1
        OnClick = btnEdit_nameClick
      end
      object btnEdit_URL: TButton
        Left = 0
        Top = 205
        Width = 158
        Height = 41
        Hint = 'Insert a link on the event'#39's page'
        Align = alTop
        Caption = 'Edit web link'
        ParentShowHint = False
        ShowHint = True
        Style = bsCommandLink
        TabOrder = 2
        OnClick = btnEdit_URLClick
      end
      object btnEdit_disc: TButton
        Left = 0
        Top = 164
        Width = 158
        Height = 41
        Hint = 'Edit the discription of the event'
        Align = alTop
        Caption = 'Edit discription'
        ParentShowHint = False
        ShowHint = True
        Style = bsCommandLink
        TabOrder = 3
        OnClick = btnEdit_discClick
      end
      object btnEdit_namePrice: TButton
        Left = 0
        Top = 123
        Width = 158
        Height = 41
        Hint = 'How much it'#39'll cost a user to book for these event'
        Align = alTop
        Caption = 'Edit price'
        ParentShowHint = False
        ShowHint = True
        Style = bsCommandLink
        TabOrder = 4
        OnClick = btnEdit_namePriceClick
      end
      object btnEdit_Mseats: TButton
        Left = 0
        Top = 82
        Width = 158
        Height = 41
        Hint = 'The maxium amount of people who can signup for these event'
        Align = alTop
        Caption = 'Edit max seats'
        ParentShowHint = False
        ShowHint = True
        Style = bsCommandLink
        TabOrder = 5
        OnClick = btnEdit_MseatsClick
      end
      object btnSave: TButton
        Left = 0
        Top = 483
        Width = 158
        Height = 41
        Hint = 'Are you sure?'
        Align = alBottom
        Caption = 'Save settings'
        ParentShowHint = False
        ShowHint = True
        Style = bsCommandLink
        TabOrder = 6
        OnClick = btnSaveClick
      end
      object btnDiscard: TButton
        Left = 0
        Top = 442
        Width = 158
        Height = 41
        Hint = 'Don'#39't save the changes and return to the main menu'
        Align = alBottom
        Caption = 'Discard settings'
        ParentShowHint = False
        ShowHint = True
        Style = bsCommandLink
        TabOrder = 7
        OnClick = btnDiscardClick
      end
      object btnInfo: TButton
        Left = 0
        Top = 401
        Width = 158
        Height = 41
        Hint = 'Some basic info on these screen'
        Align = alBottom
        Caption = 'Info'
        ParentShowHint = False
        ShowHint = True
        Style = bsCommandLink
        TabOrder = 8
        OnClick = btnInfoClick
      end
      object btnPTB: TButton
        Left = 0
        Top = 246
        Width = 158
        Height = 41
        Hint = 
          'The permision level a user needs to haveto be allowed to book fo' +
          'r these event'
        Align = alTop
        Caption = 'Perm to book'
        ParentShowHint = False
        ShowHint = True
        Style = bsCommandLink
        TabOrder = 9
        OnClick = btnPTBClick
      end
    end
    object pnlmisc: TPanel
      AlignWithMargins = True
      Left = 167
      Top = 95
      Width = 841
      Height = 524
      Align = alClient
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Color = 1184274
      ParentBackground = False
      TabOrder = 1
      object pnlWebsite: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 317
        Width = 835
        Height = 204
        Align = alClient
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Color = 1184274
        ParentBackground = False
        TabOrder = 0
        object WBInfo: TWebBrowser
          Left = 0
          Top = 0
          Width = 835
          Height = 204
          Align = alClient
          TabOrder = 0
          OnEnter = btnEdit_URLClick
          ExplicitTop = 24
          ExplicitWidth = 746
          ExplicitHeight = 175
          ControlData = {
            4C0000004D560000161500000100000001020000000000000000000000000000
            000000004C000000000000000000000001000000E0D057007335CF11AE690800
            2B2E12620A000000000000004C0000000114020000000000C000000000000046
            8000000000000000000000000000000000000000000000000000000000000000
            00000000000000000100000000000000000000000000000000000000}
        end
      end
      object pnlDisc: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 835
        Height = 308
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Color = 1184274
        ParentBackground = False
        TabOrder = 1
        object memEventDisc: TMemo
          Left = 0
          Top = 0
          Width = 835
          Height = 308
          Align = alClient
          BevelEdges = []
          BevelInner = bvNone
          BevelOuter = bvNone
          Color = 2763306
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          OnClick = btnEdit_discClick
        end
      end
    end
    object PNLsumarry: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 1005
      Height = 86
      Align = alTop
      BevelEdges = [beBottom]
      BevelOuter = bvNone
      Caption = 'PNLsumarry'
      Color = 4473924
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -33
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 2
      OnClick = btnEdit_nameClick
      object lblBooked: TLabel
        Left = 0
        Top = 0
        Width = 97
        Height = 86
        Align = alLeft
        Alignment = taCenter
        AutoSize = False
        Caption = 'Unbooked'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        OnClick = btnPTBClick
      end
      object pnlDetail: TPanel
        Left = 865
        Top = 0
        Width = 120
        Height = 86
        Align = alRight
        BevelEdges = []
        BevelOuter = bvNone
        TabOrder = 0
        object lblSpacesBooked: TLabel
          Left = 0
          Top = 0
          Width = 120
          Height = 17
          Align = alTop
          Alignment = taCenter
          AutoSize = False
          Caption = '/'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
          OnClick = btnEdit_MseatsClick
          ExplicitLeft = -6
          ExplicitTop = -3
        end
        object lblPrice: TLabel
          Left = 0
          Top = 17
          Width = 120
          Height = 53
          Align = alClient
          Alignment = taCenter
          AutoSize = False
          Caption = 'Price:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
          OnClick = btnEdit_namePriceClick
          ExplicitLeft = 8
          ExplicitTop = 30
          ExplicitHeight = 24
        end
        object lblDate: TLabel
          Left = 0
          Top = 70
          Width = 120
          Height = 16
          Align = alBottom
          Alignment = taCenter
          Caption = 'Date'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = btnEdit_dateClick
          ExplicitWidth = 26
        end
      end
      object sbnEventSelect: TSpinButton
        Left = 985
        Top = 0
        Width = 20
        Height = 86
        Align = alRight
        Anchors = []
        Ctl3D = False
        DownGlyph.Data = {
          0E010000424D0E01000000000000360000002800000009000000060000000100
          200000000000D800000000000000000000000000000000000000008080000080
          8000008080000080800000808000008080000080800000808000008080000080
          8000008080000080800000808000000000000080800000808000008080000080
          8000008080000080800000808000000000000000000000000000008080000080
          8000008080000080800000808000000000000000000000000000000000000000
          0000008080000080800000808000000000000000000000000000000000000000
          0000000000000000000000808000008080000080800000808000008080000080
          800000808000008080000080800000808000}
        ParentCtl3D = False
        TabOrder = 1
        UpGlyph.Data = {
          0E010000424D0E01000000000000360000002800000009000000060000000100
          200000000000D800000000000000000000000000000000000000008080000080
          8000008080000080800000808000008080000080800000808000008080000080
          8000000000000000000000000000000000000000000000000000000000000080
          8000008080000080800000000000000000000000000000000000000000000080
          8000008080000080800000808000008080000000000000000000000000000080
          8000008080000080800000808000008080000080800000808000000000000080
          8000008080000080800000808000008080000080800000808000008080000080
          800000808000008080000080800000808000}
        OnDownClick = sbnEventSelectDownClick
        OnUpClick = sbnEventSelectUpClick
      end
    end
  end
end
