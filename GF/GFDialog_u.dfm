object GFInput2: TGFInput2
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'GFinput2'
  ClientHeight = 500
  ClientWidth = 500
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PCDialog: TPageControl
    Left = 0
    Top = 0
    Width = 500
    Height = 500
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 0
    TabStop = False
    object TabSheet1: TTabSheet
      Caption = 'TSMemo'
      TabVisible = False
      object pnlMemo: TPanel
        Left = 0
        Top = 0
        Width = 492
        Height = 490
        Align = alClient
        Caption = 'Panel1'
        Color = 2763306
        ParentBackground = False
        TabOrder = 0
        object Panel22: TPanel
          Left = 1
          Top = 1
          Width = 80
          Height = 437
          Align = alLeft
          BevelEdges = []
          BevelOuter = bvNone
          Color = 2763306
          ParentBackground = False
          TabOrder = 0
        end
        object Panel23: TPanel
          Left = 411
          Top = 1
          Width = 80
          Height = 437
          Align = alRight
          BevelOuter = bvNone
          Color = 2763306
          ParentBackground = False
          TabOrder = 1
        end
        object Panel24: TPanel
          Left = 1
          Top = 438
          Width = 490
          Height = 51
          Align = alBottom
          BevelOuter = bvNone
          Color = 2763306
          ParentBackground = False
          TabOrder = 2
          object Panel25: TPanel
            Left = 410
            Top = 0
            Width = 80
            Height = 51
            Align = alRight
            BevelOuter = bvNone
            Color = 2763306
            ParentBackground = False
            TabOrder = 0
          end
          object Button2: TButton
            Left = 80
            Top = 0
            Width = 175
            Height = 51
            Align = alLeft
            Caption = 'Done'
            Style = bsCommandLink
            TabOrder = 1
            OnClick = btnDoneURLClick
          end
          object Panel11: TPanel
            Left = 0
            Top = 0
            Width = 80
            Height = 51
            Align = alLeft
            BevelOuter = bvNone
            Color = 2763306
            ParentBackground = False
            TabOrder = 2
          end
        end
        object Panel26: TPanel
          Left = 81
          Top = 1
          Width = 330
          Height = 437
          Align = alClient
          BevelOuter = bvNone
          Color = 2763306
          ParentBackground = False
          TabOrder = 3
          object lblQ3: TLabel
            Left = 0
            Top = 9
            Width = 330
            Height = 33
            Align = alTop
            Alignment = taCenter
            BiDiMode = bdLeftToRight
            Caption = 'lblQ'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clHighlightText
            Font.Height = -27
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentBiDiMode = False
            ParentFont = False
            Layout = tlCenter
            WordWrap = True
            ExplicitWidth = 46
          end
          object memOut: TMemo
            Left = 0
            Top = 42
            Width = 330
            Height = 395
            Align = alClient
            BevelInner = bvNone
            BevelOuter = bvNone
            BorderStyle = bsNone
            Color = 2434341
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clHighlightText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Lines.Strings = (
              'Input Text here')
            ParentFont = False
            TabOrder = 0
          end
          object Panel15: TPanel
            Left = 0
            Top = 0
            Width = 330
            Height = 9
            Align = alTop
            BevelOuter = bvNone
            Color = 2763306
            ParentBackground = False
            TabOrder = 1
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'TSDate'
      ImageIndex = 1
      TabVisible = False
      object pnlDate: TPanel
        Left = 0
        Top = 0
        Width = 492
        Height = 490
        Align = alClient
        Caption = 'Panel1'
        Color = 2763306
        ParentBackground = False
        TabOrder = 0
        object Panel32: TPanel
          Left = 1
          Top = 1
          Width = 48
          Height = 437
          Align = alLeft
          BevelEdges = []
          BevelOuter = bvNone
          Color = 2763306
          ParentBackground = False
          TabOrder = 0
        end
        object Panel33: TPanel
          Left = 440
          Top = 1
          Width = 51
          Height = 437
          Align = alRight
          BevelOuter = bvNone
          Color = 2763306
          ParentBackground = False
          TabOrder = 1
        end
        object Panel34: TPanel
          Left = 1
          Top = 438
          Width = 490
          Height = 51
          Align = alBottom
          BevelOuter = bvNone
          Color = 2763306
          ParentBackground = False
          TabOrder = 2
          object Panel35: TPanel
            Left = 0
            Top = 0
            Width = 80
            Height = 51
            Align = alLeft
            BevelOuter = bvNone
            Color = 2763306
            ParentBackground = False
            TabOrder = 0
          end
          object Button3: TButton
            Left = 80
            Top = 0
            Width = 175
            Height = 51
            Align = alLeft
            Caption = 'Done'
            Style = bsCommandLink
            TabOrder = 1
            OnClick = btnDoneURLClick
          end
        end
        object Panel36: TPanel
          Left = 49
          Top = 1
          Width = 391
          Height = 437
          Align = alClient
          BevelOuter = bvNone
          Color = 2763306
          ParentBackground = False
          TabOrder = 3
          object lblQ5: TLabel
            Left = 0
            Top = 25
            Width = 391
            Height = 24
            Align = alTop
            Alignment = taCenter
            BiDiMode = bdLeftToRight
            Caption = 'lblQ5'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clHighlightText
            Font.Height = -20
            Font.Name = 'Tahoma'
            Font.Pitch = fpVariable
            Font.Style = []
            ParentBiDiMode = False
            ParentFont = False
            Layout = tlCenter
            WordWrap = True
            ExplicitWidth = 46
          end
          object Panel37: TPanel
            Left = 0
            Top = 0
            Width = 391
            Height = 25
            Align = alTop
            BevelOuter = bvNone
            Color = 2763306
            ParentBackground = False
            TabOrder = 0
          end
          object Panel38: TPanel
            Left = 0
            Top = 49
            Width = 391
            Height = 319
            Align = alClient
            BevelOuter = bvNone
            Color = 2763306
            ParentBackground = False
            TabOrder = 1
            object MCDate: TMonthCalendar
              AlignWithMargins = True
              Left = 3
              Top = 25
              Width = 385
              Height = 291
              Align = alClient
              BiDiMode = bdRightToLeft
              CalColors.BackColor = 2763306
              CalColors.TitleBackColor = clBackground
              CalColors.TitleTextColor = clBlack
              CalColors.MonthBackColor = clGray
              Date = 43032.777274178240000000
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentBiDiMode = False
              ParentFont = False
              TabOrder = 0
            end
            object Panel2: TPanel
              Left = 0
              Top = 0
              Width = 391
              Height = 22
              Align = alTop
              BevelOuter = bvNone
              Color = 2763306
              ParentBackground = False
              TabOrder = 1
            end
          end
          object Panel1: TPanel
            Left = 0
            Top = 368
            Width = 391
            Height = 69
            Align = alBottom
            BevelOuter = bvNone
            Color = 2763306
            ParentBackground = False
            TabOrder = 2
          end
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'TSWeb'
      ImageIndex = 2
      TabVisible = False
      object pnlWeb: TPanel
        Left = 0
        Top = 0
        Width = 492
        Height = 490
        Align = alClient
        Caption = 'Panel1'
        Color = 2763306
        ParentBackground = False
        TabOrder = 0
        object Panel41: TPanel
          Left = 411
          Top = 33
          Width = 80
          Height = 405
          Align = alRight
          BevelOuter = bvNone
          Color = 2763306
          ParentBackground = False
          TabOrder = 0
        end
        object Panel42: TPanel
          Left = 1
          Top = 438
          Width = 490
          Height = 51
          Align = alBottom
          BevelOuter = bvNone
          Color = 2763306
          ParentBackground = False
          TabOrder = 1
          object Panel43: TPanel
            Left = 0
            Top = 0
            Width = 80
            Height = 51
            Align = alLeft
            BevelOuter = bvNone
            Color = 2763306
            ParentBackground = False
            TabOrder = 0
            object Panel40: TPanel
              Left = 0
              Top = 0
              Width = 80
              Height = 51
              Align = alLeft
              BevelEdges = []
              BevelOuter = bvNone
              Color = 2763306
              ParentBackground = False
              TabOrder = 0
            end
          end
          object btnLURL: TButton
            Left = 260
            Top = 0
            Width = 150
            Height = 51
            Align = alRight
            Caption = 'Load URL'
            Style = bsCommandLink
            TabOrder = 1
            OnClick = btnLURLClick
          end
          object Panel45: TPanel
            Left = 410
            Top = 0
            Width = 80
            Height = 51
            Align = alRight
            BevelOuter = bvNone
            Color = 2763306
            ParentBackground = False
            TabOrder = 2
          end
          object btnDoneURL: TButton
            Left = 80
            Top = 0
            Width = 150
            Height = 51
            Align = alLeft
            Caption = 'Done'
            Style = bsCommandLink
            TabOrder = 3
            OnClick = btnDoneURLClick
          end
        end
        object Panel44: TPanel
          Left = 81
          Top = 33
          Width = 330
          Height = 405
          Align = alClient
          BevelOuter = bvNone
          Color = 2763306
          ParentBackground = False
          TabOrder = 2
          object lblQ10: TLabel
            Left = 0
            Top = 0
            Width = 330
            Height = 33
            Align = alTop
            Alignment = taCenter
            BiDiMode = bdLeftToRight
            Caption = 'lblQ'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clHighlightText
            Font.Height = -27
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentBiDiMode = False
            ParentFont = False
            Layout = tlCenter
            WordWrap = True
            ExplicitWidth = 46
          end
          object edtURL: TEdit
            AlignWithMargins = True
            Left = 3
            Top = 370
            Width = 324
            Height = 32
            Align = alBottom
            Alignment = taCenter
            BevelEdges = []
            BevelInner = bvNone
            BevelOuter = bvNone
            BiDiMode = bdLeftToRight
            BorderStyle = bsNone
            Color = 2434341
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clHighlightText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentBiDiMode = False
            ParentFont = False
            TabOrder = 0
            TextHint = 'Enter a Link to a website here '
          end
          object WBPreview: TWebBrowser
            Left = 0
            Top = 33
            Width = 330
            Height = 334
            Align = alClient
            TabOrder = 1
            ExplicitWidth = 388
            ExplicitHeight = 192
            ControlData = {
              4C0000001B220000852200000100000001020000000000000000000000000000
              000000004C000000000000000000000001000000E0D057007335CF11AE690800
              2B2E12620A000000000000004C0000000114020000000000C000000000000046
              8000000000000000000000000000000000000000000000000000000000000000
              00000000000000000100000000000000000000000000000000000000}
          end
        end
        object Panel46: TPanel
          Left = 1
          Top = 33
          Width = 80
          Height = 405
          Align = alLeft
          BevelOuter = bvNone
          Color = 2763306
          ParentBackground = False
          TabOrder = 3
        end
        object Panel47: TPanel
          Left = 1
          Top = 1
          Width = 490
          Height = 32
          Align = alTop
          BevelOuter = bvNone
          Color = 2763306
          ParentBackground = False
          TabOrder = 4
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'TSWB'
      ImageIndex = 3
      TabVisible = False
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 492
        Height = 490
        Align = alClient
        Caption = 'Panel1'
        Color = 2763306
        ParentBackground = False
        TabOrder = 0
        object Panel4: TPanel
          Left = 1
          Top = 1
          Width = 80
          Height = 437
          Align = alLeft
          BevelEdges = []
          BevelOuter = bvNone
          Color = 2763306
          ParentBackground = False
          TabOrder = 0
        end
        object Panel5: TPanel
          Left = 411
          Top = 1
          Width = 80
          Height = 437
          Align = alRight
          BevelOuter = bvNone
          Color = 2763306
          ParentBackground = False
          TabOrder = 1
        end
        object Panel6: TPanel
          Left = 1
          Top = 438
          Width = 490
          Height = 51
          Align = alBottom
          BevelOuter = bvNone
          Color = 2763306
          ParentBackground = False
          TabOrder = 2
          object Panel7: TPanel
            Left = 410
            Top = 0
            Width = 80
            Height = 51
            Align = alRight
            BevelOuter = bvNone
            Color = 2763306
            ParentBackground = False
            TabOrder = 0
          end
          object Button1: TButton
            Left = 80
            Top = 0
            Width = 175
            Height = 51
            Align = alLeft
            Caption = 'Done'
            Style = bsCommandLink
            TabOrder = 1
            OnClick = btnDoneURLClick
          end
          object Panel8: TPanel
            Left = 0
            Top = 0
            Width = 80
            Height = 51
            Align = alLeft
            BevelOuter = bvNone
            Color = 2763306
            ParentBackground = False
            TabOrder = 2
          end
        end
        object Panel9: TPanel
          Left = 81
          Top = 1
          Width = 330
          Height = 437
          Align = alClient
          BevelOuter = bvNone
          Color = 2763306
          ParentBackground = False
          TabOrder = 3
          object Label1: TLabel
            Left = 0
            Top = 9
            Width = 330
            Height = 66
            Align = alTop
            Alignment = taCenter
            BiDiMode = bdLeftToRight
            Caption = 'Players who have booked a seat so far'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clHighlightText
            Font.Height = -27
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentBiDiMode = False
            ParentFont = False
            Layout = tlCenter
            WordWrap = True
            ExplicitWidth = 323
          end
          object Panel10: TPanel
            Left = 0
            Top = 0
            Width = 330
            Height = 9
            Align = alTop
            BevelOuter = bvNone
            Color = 2763306
            ParentBackground = False
            TabOrder = 0
          end
          object DBWB: TDBGrid
            Left = 0
            Top = 75
            Width = 330
            Height = 362
            ParentCustomHint = False
            Align = alClient
            BiDiMode = bdLeftToRight
            Ctl3D = False
            DataSource = MLL.DSWhoBooked
            DrawingStyle = gdsGradient
            FixedColor = 2763306
            GradientEndColor = 2763306
            GradientStartColor = 2763306
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Options = [dgTitles, dgColumnResize]
            ParentBiDiMode = False
            ParentColor = True
            ParentCtl3D = False
            ParentFont = False
            ParentShowHint = False
            ReadOnly = True
            ShowHint = False
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWhite
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
          end
        end
      end
    end
  end
end