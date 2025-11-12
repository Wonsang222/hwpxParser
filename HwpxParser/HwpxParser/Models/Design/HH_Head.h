//
//  HH_Head.h
//  HwpxParser
//
//  Created by 인스웨이브 on 11/11/25.
//

#import <Foundation/Foundation.h>
@class HH_BeginNum;
@class HH_RefList;
@class HH_CompatibleDocument;
@class HH_DocOption;
@class HH_TrackchageConfig;

NS_ASSUME_NONNULL_BEGIN

@interface HH_Head : NSObject
@property(strong) NSString *version;
@property(strong) NSString *secCnt;
@property(strong) HH_BeginNum * beginNum;
@property(strong) HH_RefList * refList;
@property(strong, nullable) HH_CompatibleDocument * compatibleDocument;
@property(strong, nullable) HH_DocOption * docOption;
@property(strong, nullable) HH_TrackchageConfig * trackchageConfig;

-(NSMutableDictionary*)getparaPr:(NSString*)num;

@end

NS_ASSUME_NONNULL_END


/*
 | 항목                       | XML 위치                                                  | 설명                             | CSS 변환                                                |
 | ------------------------ | ------------------------------------------------------- | ------------------------------ | ----------------------------------------------------- |
 | **정렬**                   | `<hh:align horizontal="JUSTIFY" vertical="BASELINE" />` | 문단의 가로/세로 정렬                   | `text-align: justify; vertical-align: baseline;`      |
 | **들여쓰기(intent)**         | `<hc:intent value="-2744" unit="HWPUNIT" />`            | 첫 줄 들여쓰기 (음수면 내어쓰기)            | `text-indent: -2744hwpu;`                             |
 | **왼쪽 여백**                | `<hc:left value="0" />`                                 | 문단 왼쪽 여백                       | `margin-left: 0hwpu;`                                 |
 | **오른쪽 여백**               | `<hc:right value="0" />`                                | 문단 오른쪽 여백                      | `margin-right: 0hwpu;`                                |
 | **문단 위 여백**              | `<hc:prev value="0" />`                                 | 이전 문단과의 간격                     | `margin-top: 0hwpu;`                                  |
 | **문단 아래 여백**             | `<hc:next value="0" />`                                 | 다음 문단과의 간격                     | `margin-bottom: 0hwpu;`                               |
 | **줄 간격(type/value)**     | `<hh:lineSpacing type="PERCENT" value="60" />`          | 줄 간격 설정 (HWP는 160% 기본)         | `line-height: 1.6;` (기본 160%라면) → `line-height: 0.6;` |
 | **단어 분리 설정**             | `<hh:breakSetting breakLatinWord="KEEP_WORD" />`        | 줄바꿈 시 단어 분리 여부                 | `word-break: keep-all;`                               |
 | **줄바꿈 방식(lineWrap)**     | `lineWrap="BREAK"`                                      | 줄 넘김 설정                        | `white-space: normal;`                                |
 | **테두리(borderFillIDRef)** | `<hh:border borderFillIDRef="3" />`                     | 테두리 스타일 ID (borderFill.xml 참조) | 나중에 borderFill 테이블에서 불러와 `border: ...;` 로 적용          |
 | **snapToGrid**           | 속성값 `"1"`                                               | 문단이 글자 격자에 맞춰짐                 | 보통 CSS에서 무시 가능 (HWP 고유 개념)                            |
 | **fontLineHeight**       | `"0"`                                                   | 글꼴 라인 높이 자동 여부                 | 보통 무시 가능                                              |

 */
