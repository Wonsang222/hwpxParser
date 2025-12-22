# HwpxParser 프로젝트 정리

## 목표

- Objective-C로 작성
- Hwpx 파일을 파싱해서 Html로 컨버팅 후, WKWebview 화면으로 송출
- [https://standard.go.kr](https://standard.go.kr/) 공식문서를 참조해서 컴포넌트 구성

```
// 프로젝트 폴더 트리
├── HwpxParser
│   ├── Delegate
│   │   └── ContentDelegate.h
│   ├── Extensions
│   │   ├── NSObject+ParsingHelper.h
│   │   └── NSObject+ParsingHelper.m
│   ├── main.h
│   ├── main.m
│   ├── Models
│   │   ├── Base
│   │   │   ├── AbstractShape
│   │   │   │   ├── AbstractShapeObjectType.h
│   │   │   │   ├── AbstractShapeObjectType.m
│   │   │   │   ├── Margin.h
│   │   │   │   ├── Margin.m
│   │   │   │   ├── OutMargin.h
│   │   │   │   ├── OutMargin.m
│   │   │   │   ├── Pos.h
│   │   │   │   ├── Pos.m
│   │   │   │   ├── Sz.h
│   │   │   │   └── Sz.m
│   │   │   └── AbstractShapeComponent
│   │   │       ├── AbstractShapeComponentType.h
│   │   │       ├── AbstractShapeComponentType.m
│   │   │       ├── CurSz.h
│   │   │       ├── CurSz.m
│   │   │       ├── Flip.h
│   │   │       ├── Flip.m
│   │   │       ├── MatrixType
│   │   │       │   ├── MatrixType.h
│   │   │       │   ├── MatrixType.m
│   │   │       │   ├── RotMatrix.h
│   │   │       │   ├── RotMatrix.m
│   │   │       │   ├── ScaMatrix.h
│   │   │       │   ├── ScaMatrix.m
│   │   │       │   ├── TransMatrix.h
│   │   │       │   └── TransMatrix.m
│   │   │       ├── Offset.h
│   │   │       ├── Offset.m
│   │   │       ├── OrgSz.h
│   │   │       ├── OrgSz.m
│   │   │       ├── RenderingInfo.h
│   │   │       ├── RenderingInfo.m
│   │   │       ├── RotationInfo.h
│   │   │       └── RotationInfo.m
│   │   ├── Components
│   │   │   ├── Paragraph
│   │   │   │   ├── Lineseg.h
│   │   │   │   ├── Lineseg.m
│   │   │   │   ├── Linesegarray.h
│   │   │   │   ├── Linesegarray.m
│   │   │   │   ├── Paragraph.h
│   │   │   │   ├── Paragraph.m
│   │   │   │   ├── Run.h
│   │   │   │   ├── Run.m
│   │   │   │   ├── SecPr
│   │   │   │   │   ├── Grid.h
│   │   │   │   │   ├── Grid.m
│   │   │   │   │   ├── LineNumberShape.h
│   │   │   │   │   ├── LineNumberShape.m
│   │   │   │   │   ├── MasterPage.h
│   │   │   │   │   ├── MasterPage.m
│   │   │   │   │   ├── Note
│   │   │   │   │   │   ├── AutoNumFormat.h
│   │   │   │   │   │   ├── AutoNumFormat.m
│   │   │   │   │   │   ├── EndNotePr.h
│   │   │   │   │   │   ├── EndNotePr.m
│   │   │   │   │   │   ├── FootNotePr.h
│   │   │   │   │   │   ├── FootNotePr.m
│   │   │   │   │   │   ├── NoteLine.h
│   │   │   │   │   │   ├── NoteLine.m
│   │   │   │   │   │   ├── NoteSpacing.h
│   │   │   │   │   │   ├── NoteSpacing.m
│   │   │   │   │   │   ├── NoteUmbrella.h
│   │   │   │   │   │   ├── Numbering.h
│   │   │   │   │   │   ├── Numbering.m
│   │   │   │   │   │   ├── Placement.h
│   │   │   │   │   │   └── Placement.m
│   │   │   │   │   ├── PageBorderFill.h
│   │   │   │   │   ├── PageBorderFill.m
│   │   │   │   │   ├── PagePr.h
│   │   │   │   │   ├── PagePr.m
│   │   │   │   │   ├── Presentation.h
│   │   │   │   │   ├── Presentation.m
│   │   │   │   │   ├── SecPr.h
│   │   │   │   │   ├── SecPr.m
│   │   │   │   │   ├── StartNum.h
│   │   │   │   │   └── StartNum.m
│   │   │   │   ├── SubList.h
│   │   │   │   ├── SubList.m
│   │   │   │   └── Text
│   │   │   │       ├── Text.h
│   │   │   │       └── Text.m
│   │   │   ├── Pic
│   │   │   │   ├── Img.h
│   │   │   │   ├── Img.m
│   │   │   │   ├── ImgClip.h
│   │   │   │   ├── ImgClip.m
│   │   │   │   ├── ImgDim.h
│   │   │   │   ├── ImgDim.m
│   │   │   │   ├── ImgRect.h
│   │   │   │   ├── ImgRect.m
│   │   │   │   ├── InMargin.h
│   │   │   │   ├── InMargin.m
│   │   │   │   ├── LineShape.h
│   │   │   │   ├── LineShape.m
│   │   │   │   ├── Pic.h
│   │   │   │   ├── Pic.m
│   │   │   │   ├── PointType.h
│   │   │   │   ├── PointType.m
│   │   │   │   ├── Pt0.h
│   │   │   │   ├── Pt0.m
│   │   │   │   ├── Pt1.h
│   │   │   │   ├── Pt1.m
│   │   │   │   ├── Pt2.h
│   │   │   │   ├── Pt2.m
│   │   │   │   ├── Pt3.h
│   │   │   │   └── Pt3.m
│   │   │   ├── Sec
│   │   │   │   ├── Sec.h
│   │   │   │   └── Sec.m
│   │   │   └── Table
│   │   │       ├── CellAddr.h
│   │   │       ├── CellAddr.m
│   │   │       ├── CellMargin.h
│   │   │       ├── CellMargin.m
│   │   │       ├── CellSpan.h
│   │   │       ├── CellSpan.m
│   │   │       ├── CellSz.h
│   │   │       ├── CellSz.m
│   │   │       ├── CellZone.h
│   │   │       ├── CellZone.m
│   │   │       ├── Label.h
│   │   │       ├── Label.m
│   │   │       ├── Tbl.h
│   │   │       ├── Tbl.m
│   │   │       ├── Tc.h
│   │   │       ├── Tc.m
│   │   │       ├── Tr.h
│   │   │       └── Tr.m
│   │   └── Design
│   │       ├── BorderFill
│   │       │   ├── HH_BackSlash.h
│   │       │   ├── HH_BackSlash.m
│   │       │   ├── HH_BorderFill.h
│   │       │   ├── HH_BorderFill.m
│   │       │   ├── HH_BottomBorder.h
│   │       │   ├── HH_BottomBorder.m
│   │       │   ├── HH_Diagonal.h
│   │       │   ├── HH_Diagonal.m
│   │       │   ├── HH_FillBrush.h
│   │       │   ├── HH_FillBrush.m
│   │       │   ├── HH_LeftBorder.h
│   │       │   ├── HH_LeftBorder.m
│   │       │   ├── HH_RightBorder.h
│   │       │   ├── HH_RightBorder.m
│   │       │   ├── HH_Slash.h
│   │       │   ├── HH_Slash.m
│   │       │   ├── HH_Switches.h
│   │       │   ├── HH_Switches.m
│   │       │   ├── HH_TopBorder.h
│   │       │   ├── HH_TopBorder.m
│   │       │   ├── HH_WinBrush.h
│   │       │   └── HH_WinBrush.m
│   │       ├── HH_Align.h
│   │       ├── HH_Align.m
│   │       ├── HH_AutoSpacing.h
│   │       ├── HH_AutoSpacing.m
│   │       ├── HH_BeginNum.h
│   │       ├── HH_BeginNum.m
│   │       ├── HH_Border.h
│   │       ├── HH_Border.m
│   │       ├── HH_BorderFills.h
│   │       ├── HH_BorderFills.m
│   │       ├── HH_BreakSetting.h
│   │       ├── HH_BreakSetting.m
│   │       ├── HH_Cases.h
│   │       ├── HH_Cases.m
│   │       ├── HH_CharPr.h
│   │       ├── HH_CharPr.m
│   │       ├── HH_CharProperties.h
│   │       ├── HH_CharProperties.m
│   │       ├── HH_CompatibleDocument.h
│   │       ├── HH_CompatibleDocument.m
│   │       ├── HH_Defaults.h
│   │       ├── HH_Defaults.m
│   │       ├── HH_DocOption.h
│   │       ├── HH_DocOption.m
│   │       ├── HH_Font.h
│   │       ├── HH_Font.m
│   │       ├── HH_Fontface.h
│   │       ├── HH_Fontface.m
│   │       ├── HH_Fontfaces.h
│   │       ├── HH_Fontfaces.m
│   │       ├── HH_FontRef.h
│   │       ├── HH_FontRef.m
│   │       ├── HH_Head.h
│   │       ├── HH_Head.m
│   │       ├── HH_Heading.h
│   │       ├── HH_Heading.m
│   │       ├── HH_Intent.h
│   │       ├── HH_Intent.m
│   │       ├── HH_LayoutCompatibility.h
│   │       ├── HH_LayoutCompatibility.m
│   │       ├── HH_Left.h
│   │       ├── HH_Left.m
│   │       ├── HH_LineSpacing.h
│   │       ├── HH_LineSpacing.m
│   │       ├── HH_Linkinfo.h
│   │       ├── HH_Linkinfo.m
│   │       ├── HH_Margin.h
│   │       ├── HH_Margin.m
│   │       ├── HH_MemoPr.h
│   │       ├── HH_MemoPr.m
│   │       ├── HH_MemoProperties.h
│   │       ├── HH_MemoProperties.m
│   │       ├── HH_Next.h
│   │       ├── HH_Next.m
│   │       ├── HH_Numbering.h
│   │       ├── HH_Numbering.m
│   │       ├── HH_Numberings.h
│   │       ├── HH_Numberings.m
│   │       ├── HH_Offset.h
│   │       ├── HH_Offset.m
│   │       ├── HH_Outline.h
│   │       ├── HH_Outline.m
│   │       ├── HH_ParaHead.h
│   │       ├── HH_ParaHead.m
│   │       ├── HH_ParaPr.h
│   │       ├── HH_ParaPr.m
│   │       ├── HH_ParaProperties.h
│   │       ├── HH_ParaProperties.m
│   │       ├── HH_Prev.h
│   │       ├── HH_Prev.m
│   │       ├── HH_Ratio.h
│   │       ├── HH_Ratio.m
│   │       ├── HH_RefList.h
│   │       ├── HH_RefList.m
│   │       ├── HH_RelSz.h
│   │       ├── HH_RelSz.m
│   │       ├── HH_Right.h
│   │       ├── HH_Right.m
│   │       ├── HH_Shadow.h
│   │       ├── HH_Shadow.m
│   │       ├── HH_Spacing.h
│   │       ├── HH_Spacing.m
│   │       ├── HH_Strikeout.h
│   │       ├── HH_Strikeout.m
│   │       ├── HH_Style.h
│   │       ├── HH_Style.m
│   │       ├── HH_Styles.h
│   │       ├── HH_Styles.m
│   │       ├── HH_SubstFont.h
│   │       ├── HH_SubstFont.m
│   │       ├── HH_TabItem.h
│   │       ├── HH_TabItem.m
│   │       ├── HH_TabPr.h
│   │       ├── HH_TabPr.m
│   │       ├── HH_TabProperties.h
│   │       ├── HH_TabProperties.m
│   │       ├── HH_TrackchageConfig.h
│   │       ├── HH_TrackchageConfig.m
│   │       ├── HH_TypeInfo.h
│   │       ├── HH_TypeInfo.m
│   │       ├── HH_Underline.h
│   │       └── HH_Underline.m
│   ├── RenderingManager
│   │   ├── RenderingManager.h
│   │   └── RenderingManager.m
│   ├── result
│   │   ├── BinData
│   │   │   ├── image1.jpg
│   │   │   ├── image2.jpg
│   │   │   ├── image3.jpg
│   │   │   ├── image4.bmp
│   │   │   ├── image5.jpg
│   │   │   ├── image6.bmp
│   │   │   ├── image7.bmp
│   │   │   ├── image8.jpg
│   │   │   └── image9.jpg
│   │   ├── image1.jpg
│   │   └── test.html
│   ├── TestFiles
│   │   ├── Output
│   │   │   ├── Contents
│   │   │   │   ├── content.hpf
│   │   │   │   ├── header.xml
│   │   │   │   └── section0.xml
│   │   │   ├── META-INF
│   │   │   │   ├── container.xml
│   │   │   │   └── manifest.xml
│   │   │   ├── mimetype
│   │   │   ├── Preview
│   │   │   │   ├── PrvImage.png
│   │   │   │   └── PrvText.txt
│   │   │   ├── settings.xml
│   │   │   ├── table-example.html
│   │   │   └── version.xml
│   │   └── Temp
│   │       ├── header.xml
│   │       ├── Para.xml
│   │       └── Table.xml
│   ├── UnZipManager
│   │   ├── UnzipManager.h
│   │   └── UnzipManager.m
│   ├── Utils
│   │   ├── FsManager.h
│   │   └── FsManager.m
│   └── XmlParsingManager
│       ├── XMLParser.h
│       └── XMLParser.m
└── HwpxParser.xcodeproj
    ├── project.pbxproj
    ├── project.xcworkspace
    │   ├── contents.xcworkspacedata
    │   ├── xcshareddata
    │   │   └── swiftpm
    │   │       ├── configuration
    │   │       └── Package.resolved
    │   └── xcuserdata
    │       ├── hwangwonsang.xcuserdatad
    │       │   └── UserInterfaceState.xcuserstate
    │       └── inswave.xcuserdatad
    │           ├── IDEFindNavigatorScopes.plist
    │           └── UserInterfaceState.xcuserstate
    └── xcuserdata
        ├── hwangwonsang.xcuserdatad
        │   └── xcschemes
        │       └── xcschememanagement.plist
        └── inswave.xcuserdatad
            ├── xcdebugger
            │   └── Breakpoints_v2.xcbkptlist
            └── xcschemes
                └── xcschememanagement.plist
```
