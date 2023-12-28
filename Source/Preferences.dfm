object FPreferences: TFPreferences
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Preferences'
  ClientHeight = 394
  ClientWidth = 596
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 13
  object AdvPageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 521
    Height = 394
    ActivePage = TabGeoCoding
    Align = alLeft
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 0
    ExplicitHeight = 393
    object AdvTabGeneral: TTabSheet
      Caption = 'General'
      object Label1: TLabel
        Left = 16
        Top = 16
        Width = 97
        Height = 13
        Caption = 'Metadata language:'
      end
      object ComboBox1: TComboBox
        Left = 119
        Top = 13
        Width = 282
        Height = 21
        Style = csDropDownList
        TabOrder = 0
      end
      object CheckBox1: TCheckBox
        Left = 16
        Top = 48
        Width = 265
        Height = 17
        Caption = '-in preview, let GUI temporary rotate images'
        TabOrder = 1
      end
      object RgStartupFolder: TRadioGroup
        Left = 16
        Top = 102
        Width = 385
        Height = 73
        Caption = 'Default startup folder'
        ItemIndex = 0
        Items.Strings = (
          '-start in last visited folder'
          '-start in:')
        TabOrder = 2
        OnClick = RadioGroupClick
      end
      object EdStartupFolder: TEdit
        Left = 87
        Top = 145
        Width = 264
        Height = 21
        TabOrder = 3
      end
      object BtnStartupFolder: TButton
        Left = 357
        Top = 145
        Width = 28
        Height = 22
        Caption = '...'
        TabOrder = 4
        OnClick = BtnBrowseFolder
      end
      object RgExportMetaFolder: TRadioGroup
        Left = 16
        Top = 193
        Width = 385
        Height = 73
        Caption = 'Default export metadata folder'
        ItemIndex = 0
        Items.Strings = (
          '-working folder'
          '-save in:')
        TabOrder = 5
        OnClick = RadioGroupClick
      end
      object EdExportMetaFolder: TEdit
        Left = 87
        Top = 236
        Width = 264
        Height = 21
        TabOrder = 6
      end
      object BtnExportMetaFolder: TButton
        Left = 357
        Top = 236
        Width = 28
        Height = 22
        Caption = '...'
        TabOrder = 7
        OnClick = BtnBrowseFolder
      end
      object LabeledEdit1: TLabeledEdit
        Left = 16
        Top = 272
        Width = 25
        Height = 21
        EditLabel.Width = 323
        EditLabel.Height = 21
        EditLabel.Caption = 
          '-separator character displayed for multi-value tags (keywords, e' +
          'tc)'
        LabelPosition = lpRight
        MaxLength = 1
        TabOrder = 8
        Text = ''
      end
      object CheckBox2: TCheckBox
        Left = 16
        Top = 71
        Width = 297
        Height = 17
        Caption = '-enable internet access for OSM Map (requires restart)'
        TabOrder = 9
      end
      object CheckBox3: TCheckBox
        Left = 16
        Top = 321
        Width = 185
        Height = 17
        Caption = '-save Filelist Details state on exit'
        TabOrder = 10
      end
    end
    object AdvTabSheetThumbs: TTabSheet
      Caption = 'Thumbnails'
      ImageIndex = 2
      object GpxCleanThumbNails: TGroupBox
        Left = 20
        Top = 151
        Width = 385
        Height = 115
        Caption = 'Cleanup Thumbnails (Admin required)'
        TabOrder = 5
        object Label2: TLabel
          Left = 247
          Top = 35
          Width = 45
          Height = 13
          Caption = 'Clean set'
          Layout = tlCenter
        end
      end
      object RadioGroup3: TRadioGroup
        Left = 20
        Top = 3
        Width = 385
        Height = 40
        Caption = 'Thumbnails size'
        Columns = 3
        ItemIndex = 0
        Items.Strings = (
          '-96pix'
          '-128pix'
          '-160pix')
        TabOrder = 0
      end
      object ChkThumbAutoGenerate: TCheckBox
        Left = 20
        Top = 62
        Width = 385
        Height = 17
        Caption = 'Generate thumbnails as needed'
        TabOrder = 1
      end
      object BtnSetupClean: TBitBtn
        Left = 37
        Top = 181
        Width = 210
        Height = 25
        Caption = 'Setup Disk cleanup for thumbnails'
        Glyph.Data = {
          5E060000424D5E06000000000000360400002800000015000000170000000100
          08000000000028020000130B0000130B00000001000000010000C6730000CE7B
          0000D67B0000BD730800CE7B0800CE840800D6840800D68C0800DE8C0800DE94
          0800E7940800E79C0800D68C1000DE941000E79C1000E7A51000CE941800D694
          1800DE941800D69C1800DE9C1800DEA51800EFA51800AD6B2100B5732100D69C
          2100DE9C2100DEA52100E7A52100DEA52900BD7B3100BD843100BD844200BD8C
          4A00AD9C5200A5A55200ADA55200D6A55200D6AD5200ADA55A007B8C6B008C94
          6B008C9C6B008CA56B00C69C7300ADA57300DEBD7300DEC6840073AD940063B5
          9C0063BD9C0063C69C006BBDA500DEC6A500E7CEA5004AB5B500E7CEB500E7D6
          B5004AB5BD00EFDEC60084BDCE00C6CECE00E7DECE00EFE7D600EFE7DE0000A5
          E70010A5E70008ADE70021ADE70021B5E7004AB5E70052BDE7004AC6E70000B5
          EF0000C6EF0039C6EF0042C6EF0008CEEF0021CEEF004ACEEF0052CEEF007BD6
          EF00ADD6EF007BDEEF009CDEEF00BDDEEF00C6DEEF00F7EFEF00F7F7EF0000B5
          F70000BDF70000C6F70000CEF70000D6F700CEE7F700CEEFF700DEEFF700E7EF
          F700EFF7F700F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00636363636363
          636363636363636363636363636363000000636363636363636363603D576363
          636363636363630000006363636363636362524228173E586363636363636300
          00006363636363626046495A2904032C63636363636363000000636363636355
          4449595A29040400204063636363630000006363636355415A5A5A5A29050404
          0618406363636300000063636255435A5A5A5A5A2A05050505051E6363636300
          0000636361455A5A5A5A5A5A2A050505050504215763630000006362474A5B5B
          5A5A5A5B2A0C0C06060606043563630000006356495B5B5B5B5B5B5B2A0C0C0C
          0C0C060C1F576300000063515B5B5B5B5B5B5B4A2B0C08080807060604385800
          0000632D27232323232323223037373A373A3A37373C63000000571014111212
          11111108314A4A5B5B5B5B4A4A48630000005710141414121212120D314A5B5B
          5B5B5B5B5B4C630000005710141414141414140D314A5B5C5C5C5B5B5B4C6300
          000057101B1A1A141414140E325C5C5C5C5C5C5B5C4C6300000057191B1B1B1B
          1B1A1A0E325C5C5C5C5C5C5C5C4C6300000057191B1B1B1B1B1B1A0E325C5C5C
          5C5C5C5C5C4C63000000633B362F25111B1B1B0E325D5C5C5C4A4851545E6300
          000063636363583E2E191B16325D5D4D51606363636363000000636363636358
          6339261D344E505E636363636363630000006363636363636363635762616362
          6363636363636300000063636363636363636363636363636363636363636300
          0000}
        TabOrder = 2
        OnClick = BtnSetupCleanClick
      end
      object EdThumbCleanset: TMaskEdit
        Left = 318
        Top = 183
        Width = 51
        Height = 21
        Hint = 
          'Defines an Id used by the Disk Cleanup program. If unsure leave ' +
          'it to the default value  0000'
        EditMask = '9999;1;0'
        MaxLength = 4
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        Text = '    '
      end
      object BtnClean: TBitBtn
        Left = 37
        Top = 224
        Width = 210
        Height = 25
        Caption = 'Cleanup thumbnails'
        Glyph.Data = {
          56070000424D560700000000000036040000280000001E000000190000000100
          08000000000020030000130B0000130B00000001000000010000F7BD00002184
          21002929290029422900294A2900298C29003131310039393900EFC639004242
          4200EFCE4200F7CE42004A4A4A00524A4A0052525200F7CE5200636363006B63
          63006B6B6B0073737300EFD67300F7DE7B00848484008C8C8C00EFD68C009494
          94009C9C9C00FFE79C00ADA5A500ADADAD00B5ADAD00B5B5B500BDBDB500BDBD
          BD00C6C6C600CECECE00D6CECE00D6D6D600DEDED600DEDEDE00E7E7DE00E7E7
          E700EFE7E700EFEFEF00F7EFEF00FFF7EF00FFFFEF00F7F7F700FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00303030303030
          3030303030303030303030303030303030303030303030300000303030303030
          3030303030303030303030303030303030303030303030300000303030303030
          303030302B221C1A1F232B303030303030303030303030300000303030303030
          302B221C1A1A17121D1D1D1F232B303030303030303030300000303030302B22
          1C1A1A17120C09091D1D1D1D1D1D1F232F3030303030303000003030231C1A1A
          17120C07070501071E1D1D1D1D1D1D1D1D21252F303030300000303016171009
          0707070606040306211F1F1E1D1D1D1D1D1D1D1D21252F3000003030130E0606
          0606060606060E1C252322211F1F1E1D1D1D1D1D1D1D1D2100003030120C0606
          0602020E19232828282726252322211F1F1E1D1D1D1D1D1D00003030100C0202
          0C19232828282828282828282726252322211F1F1E1D1D1D0000303010111923
          2828282828282828282828282828282727252322211F1F1E000030302F2B2928
          282828282828282828282828282828282828272725232221000030303030302D
          2B18140A0800002828282828282828282828282828272725000030300F0B0000
          3000000000000028282828282828282828282828292B2F300000303000000000
          3000000000000029282828282828282828292B2F303030300000303000000000
          30000000000000302F2B29282828292B2F303030303030300000303000000000
          30000000000000303030302F2B2F303030303030303030300000303030303030
          3030303030303030303030303030303030303030303030300000303000000000
          3000000000000030303030303030303030303030303030300000303000000000
          3000000000000030303030303030303030303030303030300000303000000000
          300000000000003030303030303030303030303030303030000030300F0B0000
          300000000000003030303030303030303030303030303030000030303030302D
          301B150F0B000030303030303030303030303030303030300000303030303030
          3030303030303030303030303030303030303030303030300000303030303030
          3030303030303030303030303030303030303030303030300000}
        TabOrder = 4
        OnClick = BtnCleanClick
      end
      object BtnGenThumbs: TBitBtn
        Left = 20
        Top = 105
        Width = 210
        Height = 25
        Hint = 
          'Generating thumbnails is also available in the context menu of t' +
          'he filelist when in Thumbnail mode'
        Caption = 'Generate Thumbnails now'
        Glyph.Data = {
          66060000424D660600000000000036040000280000001C000000140000000100
          08000000000030020000230B0000230B0000000100000001000042422900424A
          2900424A310042523100425A31004A5A3100425A3900426339004A6339005263
          39005A6339004A6B4200526B42005A6B4200636B420052734200A5734200AD73
          4200AD734A005A7B4A00637B4A00AD7B4A00637B5200AD7B52006B8452007384
          52007B845200AD84520073845A00B5845A007B8C5A00FF9C5A00738463007B84
          6300738C63007B8C6300B58C630094946300FF9C6300B58C6B00B5946B00BD94
          6B009C9C6B00A59C6B00FFA56B008C947300BD947300949C7300A59C7300BD9C
          7300FFAD7300949C7B00BD9C7B00C6A57B00CEAD7B00FFB57B009CA58400C6A5
          8400FFB58400A5AD8C00C6AD8C00CEAD8C00E7B58C00FFBD8C00FFC68C00CEAD
          9400ADB59400CEB59400E7BD9400FFBD9400FFC69400ADB59C00CEB59C00BDBD
          9C00CEBD9C00FFC69C00FFCE9C00CEBDA500D6BDA500D6C6A500EFC6A500FFCE
          A500D6C6AD00DEC6AD00CECEAD00EFCEAD00FFCEAD00FFD6AD00D6C6B500DEC6
          B500DECEB500DED6B500FFD6B500FFDEB500DECEBD00DED6BD00F7DEBD00FFDE
          BD00FFE7BD00DED6C600E7D6C600DEDEC600EFDEC600F7DEC600FFE7C600FFEF
          C600E7DECE00F7E7CE00FFEFCE00FFE7D600F7EFD600FFEFD600F7EFDE00FFEF
          DE00FFF7DE00F7EFE700FFEFE700FFF7E700FFF7EF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00777777777777
          777777777777777777777777777777777777777777777777111111101015171B
          1D24242731313434393C3C4343484A4D4D4D7777111111101015171B1D242427
          2E31343443484E524D4D4E585A52777711111110101517171B2424283C3C3948
          4D4A434E4D4F5258585877771111111010121517172424273C3C4D524E525258
          5A635E5E5F5A77771111111010101215292E34313C3C4339484D525A5E5E5F63
          645E777701010101010101010101010103050A0A0A0A0D0E0D0D0D0D0E0D7777
          0101020607070B0B0C1316162F2A2B353E3E3E3E557175757575777707070707
          070C131C202323237460503E556D6B747474747474747777160C07070B182123
          233B6370747474747474747474747474747477772323161618232323236E7171
          7171717171717171717171717171777723232323233838496B6F6F6F6F6F6F6F
          6F6F6F6F6F6F6F6F6F6F777723232338546F6F6F6F6F6F6F716F6F6F716F6F6F
          6F6F6F6F6F6F77775B5B6C6C6C6C6C6C6C6C6C6C5C5C6161516C6C6C6C6C6C6C
          6F5777773A3A3A5D62626262453A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A7777
          3737373A5762613F373737373737373737373737373737373737777732323232
          323A323232323232323232323232323232323232323277773232323232323232
          3232323232323232323232323232323232327777262626262626262626262626
          2626262626262626262626262626777726262626262626262626262626262626
          26262626262626262626}
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        OnClick = BtnGenThumbsClick
      end
    end
    object TabGeoCoding: TTabSheet
      Caption = 'GeoCoding'
      ImageIndex = 3
      object GrpGeoCodeGeneral: TGroupBox
        Left = 17
        Top = 13
        Width = 493
        Height = 347
        Caption = 'GeoCoding'
        TabOrder = 0
        object ChkGeoCodeDialog: TCheckBox
          Left = 67
          Top = 49
          Width = 365
          Height = 17
          Caption = 'Enable Geocode dialog (Get coordinates of location)'
          TabOrder = 0
        end
        object ChkReverseGeoCodeDialog: TCheckBox
          Left = 67
          Top = 74
          Width = 365
          Height = 17
          Caption = 'Enable reverse Geocode dialog (Get location of coordinates)'
          TabOrder = 1
        end
        object ChkGeoCodingEnable: TCheckBox
          Left = 67
          Top = 25
          Width = 365
          Height = 17
          Caption = 'Enable GeoCoding'
          TabOrder = 2
        end
      end
      object GrpGeoCode: TGroupBox
        Left = 24
        Top = 117
        Width = 464
        Height = 108
        Caption = 'GeoCode Maps:'
        TabOrder = 1
        object Label3: TLabel
          Left = 140
          Top = 75
          Width = 146
          Height = 13
          Caption = '(Min. time between calls in Ms)'
        end
        object EdGeoCodeUrl: TLabeledEdit
          Left = 60
          Top = 19
          Width = 365
          Height = 21
          EditLabel.Width = 19
          EditLabel.Height = 21
          EditLabel.Caption = 'URL'
          LabelPosition = lpLeft
          TabOrder = 0
          Text = ''
        end
        object UpdThrottleGeoCode: TUpDown
          Left = 109
          Top = 75
          Width = 16
          Height = 21
          Associate = EdThrottleGeoCode
          Min = 500
          Max = 10000
          Increment = 50
          Position = 1000
          TabOrder = 1
        end
        object EdThrottleGeoCode: TLabeledEdit
          Left = 60
          Top = 75
          Width = 49
          Height = 21
          EditLabel.Width = 38
          EditLabel.Height = 21
          EditLabel.Caption = 'Throttle'
          LabelPosition = lpLeft
          TabOrder = 2
          Text = '1000'
        end
        object EdGeoCodeApiKey: TLabeledEdit
          Left = 60
          Top = 46
          Width = 365
          Height = 21
          EditLabel.Width = 36
          EditLabel.Height = 21
          EditLabel.Caption = 'Api Key'
          LabelPosition = lpLeft
          TabOrder = 3
          Text = ''
        end
      end
      object GrpOverPass: TGroupBox
        Left = 24
        Top = 231
        Width = 464
        Height = 80
        Caption = 'OverPass Api'
        TabOrder = 2
        object Label4: TLabel
          Left = 140
          Top = 54
          Width = 146
          Height = 13
          Caption = '(Min. time between calls in Ms)'
        end
        object EdThrottleOverPass: TLabeledEdit
          Left = 60
          Top = 50
          Width = 49
          Height = 21
          EditLabel.Width = 38
          EditLabel.Height = 21
          EditLabel.Caption = 'Throttle'
          LabelPosition = lpLeft
          TabOrder = 0
          Text = '10'
        end
        object UpdThrottleOverpass: TUpDown
          Left = 109
          Top = 50
          Width = 16
          Height = 21
          Associate = EdThrottleOverPass
          Min = 10
          Max = 10000
          Position = 10
          TabOrder = 1
        end
        object EdOverPassUrl: TLabeledEdit
          Left = 60
          Top = 23
          Width = 365
          Height = 21
          EditLabel.Width = 19
          EditLabel.Height = 21
          EditLabel.Caption = 'URL'
          LabelPosition = lpLeft
          TabOrder = 2
          Text = ''
        end
      end
    end
    object AdvTabOther: TTabSheet
      Caption = 'Other'
      object Label5: TLabel
        Left = 104
        Top = 190
        Width = 141
        Height = 13
        Caption = 'Hint pause timeout in Millisecs'
      end
      object RgETOverride: TRadioGroup
        Left = 16
        Top = 62
        Width = 480
        Height = 73
        Caption = 'ExifTool.exe location'
        ItemIndex = 0
        Items.Strings = (
          '-Default search (See Windows documentation on CreateProcess)'
          '-Specify')
        TabOrder = 2
        OnClick = RadioGroupClick
      end
      object CheckBox4: TCheckBox
        Left = 16
        Top = 16
        Width = 337
        Height = 17
        Caption = '-Workspace: Move focus to next tag/line after value is entered'
        TabOrder = 0
      end
      object EdETOverride: TEdit
        Left = 87
        Top = 105
        Width = 365
        Height = 21
        TabOrder = 3
      end
      object BtnETOverride: TButton
        Left = 460
        Top = 105
        Width = 28
        Height = 22
        Caption = '...'
        TabOrder = 4
        OnClick = BtnBrowseFolder
      end
      object CheckBox5: TCheckBox
        Left = 16
        Top = 39
        Width = 337
        Height = 17
        Caption = '-Workspace: Double Click adds/removes tags'
        TabOrder = 1
      end
      object CheckBox6: TCheckBox
        Left = 16
        Top = 141
        Width = 337
        Height = 17
        Caption = '-Filelist: Show Folders in Filelist'
        TabOrder = 5
      end
      object HintPause: TEdit
        Left = 16
        Top = 187
        Width = 66
        Height = 21
        TabOrder = 6
        Text = '0'
      end
      object UpDHintPause: TUpDown
        Left = 82
        Top = 187
        Width = 16
        Height = 21
        Associate = HintPause
        Max = 10000
        Increment = 10
        TabOrder = 7
      end
      object CheckBox7: TCheckBox
        Left = 16
        Top = 164
        Width = 337
        Height = 17
        Caption = '-Filelist: Show Breadcrumb (Address Bar) in Filelist'
        TabOrder = 8
      end
    end
  end
  object BtnCancel: TButton
    Left = 527
    Top = 310
    Width = 67
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object BtnSave: TButton
    Left = 527
    Top = 356
    Width = 67
    Height = 25
    Caption = 'Save'
    ModalResult = 1
    TabOrder = 2
    OnClick = BtnSaveClick
  end
end
