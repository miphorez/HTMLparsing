object frm_HTMLparsing: Tfrm_HTMLparsing
  Left = 0
  Top = 0
  Caption = #1054#1085#1083#1072#1081#1085' '#1082#1086#1085#1090#1088#1086#1083#1100' '#1079#1072' '#1089#1072#1081#1090#1086#1084
  ClientHeight = 662
  ClientWidth = 1060
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnHide = FormHide
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object p_main: TPanel
    Left = 0
    Top = 0
    Width = 1060
    Height = 662
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object spl_memo: TSplitter
      Left = 0
      Top = 566
      Width = 1060
      Height = 3
      Cursor = crVSplit
      Align = alBottom
      ExplicitTop = 30
      ExplicitWidth = 270
    end
    object p_memo: TPanel
      Left = 0
      Top = 569
      Width = 1060
      Height = 93
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 0
      object m_HTML: TMemo
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 1054
        Height = 87
        Align = alClient
        Enabled = False
        Lines.Strings = (
          '')
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
        WordWrap = False
        OnClick = m_HTMLClick
      end
    end
    object p_site: TPanel
      Left = 0
      Top = 27
      Width = 1060
      Height = 539
      Margins.Top = 0
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object wb_Site: TWebBrowser
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 1054
        Height = 533
        Align = alClient
        TabOrder = 0
        OnDocumentComplete = wb_SiteDocumentComplete
        ExplicitLeft = 284
        ExplicitTop = 117
        ExplicitWidth = 300
        ExplicitHeight = 150
        ControlData = {
          4C000000EF6C0000163700000100000001020000000000000000000000000000
          000000004C000000000000000000000001000000E0D057007335CF11AE690800
          2B2E12620E000000000000004C0000000114020000000000C000000000000046
          8000000000000000000000000000000000000000000000000000000000000000
          00000000000000000100000000000000000000000000000000000000}
      end
    end
    object p_edit: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 5
      Width = 1054
      Height = 20
      Margins.Top = 5
      Margins.Bottom = 2
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      inline fr_eSite: Tfr_EditSave
        AlignWithMargins = True
        Left = 0
        Top = 0
        Width = 932
        Height = 20
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alClient
        TabOrder = 0
        ExplicitWidth = 932
        inherited p_edit: TPanel
          Width = 932
          ExplicitWidth = 932
          inherited btn_save: TSpeedButton
            Left = 912
            ExplicitLeft = 576
          end
          inherited btn_open: TSpeedButton
            Left = 892
            ExplicitLeft = 556
          end
          inherited p_text: TPanel
            Width = 845
            ExplicitWidth = 845
            inherited e_text: TEdit
              Width = 838
              ExplicitWidth = 838
            end
          end
        end
      end
      object btn_GoSite: TButton
        Left = 932
        Top = 0
        Width = 122
        Height = 20
        Align = alRight
        Caption = #1055#1077#1088#1077#1081#1090#1080' '#1082' '#1074#1086#1087#1088#1086#1089#1091
        TabOrder = 1
        OnClick = btn_GoSiteClick
      end
    end
  end
  object ti_HTMLp: TTrayIcon
    AnimateInterval = 500
    Hint = #1054#1085#1083#1072#1081#1085' '#1082#1086#1085#1090#1088#1086#1083#1100' '#1079#1072' '#1089#1072#1081#1090#1086#1084
    BalloonHint = #1054#1085#1083#1072#1081#1085' '#1082#1086#1085#1090#1088#1086#1083#1100' '#1079#1072' '#1089#1072#1081#1090#1086#1084
    Icons = IconOne
    Visible = True
    OnDblClick = ti_HTMLpDblClick
    Left = 880
    Top = 12
  end
  object IconOne: TImageList
    Left = 882
    Top = 48
    Bitmap = {
      494C010102003800400010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      00009F8970009C6C35009B590F009B6323009B6220009B5A11009C692F009E86
      6900000000000000000000000000000000000000000000000000000000000000
      00009F897000D7C4AE00D7BD9F00D7C1A700D7C0A600D7BDA000D7C3AC009E86
      6900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A09689009E6D
      3500AE7F4C00C69E6E00CDA57400DFC29B00D5B28400DBBD9400C89D6A00BA91
      60009F6A2D00A093840000000000000000000000000000000000A09689009E6D
      3500AE7F4C00E8D8C5005F34FB005F34FB005F34FB005F34FB00E9D8C300BA91
      60009F6A2D00A093840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A0978B00A26A2800C79E
      6E00FBEDD600A5692F00FAEAD000DDBB9100D7B38500FDF2DF00BC874700F8EB
      D600D4B58D00A1651F00A09383000000000000000000A0978B00A26A2800C79E
      6E00FBEDD600DBC3AC005426FB005426FB005426FB005426FB00E4CFB500F8EB
      D600D4B58D00A1651F00A0938300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A57A4700D7BA9500C599
      6500B8804100C99B6400F8E9D100E3C7A100DAB98C00F9ECD700D4AC7A00BA83
      3F00C5975F00DBC2A100A3723A000000000000000000A57A4700D7BA9500C599
      6500B8804100E9D7C1004B1BFB004B1BFB004B1BFB004B1BFB00EEDECA00BA83
      3F00C5975F00DBC2A100A3723A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A2907A00BB8E5600FBEFD800FCE8
      C800C2925700E0C29B00C4955C00BB833E00BA823C00C5945900D9B58900C394
      5600FEF4DF00FDF2D800B9906100A48B6E00A2907A00BB8E5600FBEFD800FCE8
      C800C2925700F3E7D700E7D5BE00E4CDB200E3CDB100E8D4BD00F0E1D000C394
      5600FEF4DF00FDF2D800B9906100A48B6E000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000AB855600E5CDAB00FEEDCF00F8E8
      CD00C99A5F00FDF2E100FEECCF00E5C69F00DFBF9500FDF3DF00FBEDD000CA9F
      6600F5E3CC00FDEFD500EFDEC500AC804A00AB855600E5CDAB00FEEDCF00F8E8
      CD00C99A5F00FEFAF300FFF7EC00F5E8D900F2E5D500FEFAF200FDF8EC00CA9F
      6600F5E3CC00FDEFD500EFDEC500AC804A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B4864700FDF5E900FEF4E200EEDA
      BC00DEBB8C00FEF7E800FDF3E100E9CFAD00E3C69C00FEF7E800FEF5E300E2C4
      9B00E9D1AD00FDF4E200FEF4E200B3844700B4864700FDF5E900FEF4E200EEDA
      BC00DEBB8C00FFFCF6005F34FB005F34FB005F34FB005F34FB00FFFBF400E2C4
      9B00E9D1AD00FDF4E200FEF4E200B38447000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BE8D4800E5C79E00E0C09400DAB4
      7F00D8B17700E5C9A000E3C39900DCB78200D8B17800E5C89F00E1C09400DBB7
      8300D7AF7500E3C59B00E2C29600BD8A4400BE8D4800E5C79E00E0C09400DAB4
      7F00D8B17700F5E9D9006136FB006136FB006136FB006136FB00F3E6D400DBB7
      8300D7AF7500E3C59B00E2C29600BD8A44000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C2955400FEF8EC00FDF5E700E3C4
      9700E4C39300FEF8EB00FDF6E800E6C89D00E3C29100FEF7EB00FDF6EA00E5C8
      9E00E2C08F00FEF6E900FDF5E500BB894900C2955400FEF8EC00FDF5E700E3C4
      9700E4C39300FFFCF7005D31FB005D31FB005D31FB005D31FB00FEFBF700E5C8
      9E00E2C08F00FEF6E900FDF5E500BB8949000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C59C5F00FEF7ED00FFF8EF00F5E7
      CF00E8C89A00FEF9F000FFF9EE00EFDBBC00ECD3AC00FFF9F100FEF9F100EBD3
      AC00F2DEBF00FDF7EE00FFF5E700C1945500C59C5F00FEF7ED00FFF8EF00F5E7
      CF00E8C89A00FFFDF9004E1FFB004E1FFB004E1FFB004E1FFB00FFFDF900EBD3
      AC00F2DEBF00FDF7EE00FFF5E700C19455000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BB9F7300F2E0C400FEFCF500FFFB
      F400E6C18700FEFCF600FEFAF500F4E1C500EFD8B400FFFBF600FEFBF700E8C6
      9000FCF4EA00FFFBF300F3E5D000C3A06B00BB9F7300F2E0C400FEFCF500FFFB
      F400E6C18700FFFEFB004919FB004919FB004919FB004919FB00FFFDFC00E8C6
      9000FCF4EA00FFFBF300F3E5D000C3A06B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A79B8900DEBA7E00FEFCF500FFFD
      FA00EBCA9300EFD3A600E7C07F00E6BB7500E5BA7200E6BF7E00EED1A100E9C5
      8900FFFDF900FFFCF600DEBD8800AE9D8400A79B8900DEBA7E00FEFCF500FFFD
      FA00EBCA9300F9EDDB004B1BFB004B1BFB004B1BFB004B1BFB00F8EDD900E9C5
      8900FFFDF900FFFCF600DEBD8800AE9D84000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C3A77A00EDD5AA00F0D2
      9F00EECC9300F2D6A900FEFDFC00F8E8D000F5E1BE00FEFDFB00F4DFBB00EDC9
      8C00EFCF9A00EED8B100CBAB75000000000000000000C3A77A00EDD5AA00F0D2
      9F00EECC9300FAEFDD004B1BFB004B1BFB004B1BFB004B1BFB00FBF2E400EDC9
      8C00EFCF9A00EED8B100CBAB7500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A1988E00D1B07700EFD5
      A600FFFDF900F2D49D00FEFBF700F9EBD200F7E3C100FFFDFB00F1D09500FEFA
      F300EFDAB600D8B47400A3998D000000000000000000A1988E00D1B07700EFD5
      A600FFFDF900FAEED8004B1BFB004B1BFB004B1BFB004B1BFB00F9ECD500FEFA
      F300EFDAB600D8B47400A3998D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BCA7
      8300E8C78E00F4DCB100F6DDAE00FAECD400F8E5C300F8E3BE00F3D7A400E6C9
      9300C3AB8100000000000000000000000000000000000000000000000000BCA7
      8300E8C78E00FBF1E0004B1BFB004B1BFB004B1BFB004B1BFB00FAEFDB00E6C9
      9300C3AB81000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A89C8B00C7AD7F00DBB77800D8B67900DBB87700DBB87700C9AE7E00AC9E
      8900000000000000000000000000000000000000000000000000000000000000
      0000A89C8B00E9DECC00F1E2C900EFE2C900F1E3C900F1E3C900E9DFCB00AC9E
      8900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00F00FF00F00000000C003C00300000000
      8001800100000000800180010000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000080018001000000008001800100000000
      E007E00700000000F00FF00F0000000000000000000000000000000000000000
      000000000000}
  end
  object MainMenu: TMainMenu
    Left = 816
    Top = 12
    object mi_Exit: TMenuItem
      Caption = #1042#1099#1093#1086#1076
      OnClick = mi_ExitClick
    end
    object N1: TMenuItem
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      object mi_autostart: TMenuItem
        Caption = #1040#1074#1090#1086#1079#1072#1075#1088#1091#1079#1082#1072
        Checked = True
        OnClick = mi_autostartClick
      end
    end
  end
end