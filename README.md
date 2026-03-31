# HwpxParser

HWPX(한글 XML) 문서를 HTML로 변환하는 macOS 콘솔 애플리케이션입니다.

---

## 개요

HWPX는 한글과컴퓨터의 워드프로세서 HWP 문서를 XML 기반으로 표현한 포맷입니다.
HwpxParser는 HWPX 파일을 파싱하여 웹 브라우저에서 볼 수 있는 HTML 파일로 변환합니다.

---

## 처리 흐름

```
HWPX 파일 (.hwpx)
      ↓  압축 해제 (UnzipManager)
Base.xml / Header.xml
      ↓  XML 파싱 (XMLParser)
Objective-C 모델 객체 트리
      ↓  HTML 변환 (convertToHtml)
HTMLElement 트리
      ↓  RenderingManager
최종 HTML 파일
```

---

## 주요 컴포넌트

### XMLParser
HWPX의 XML 구조를 Objective-C 객체로 자동 매핑합니다.
XML 요소명을 클래스명으로 변환하고, `NSClassFromString`으로 인스턴스를 동적으로 생성합니다.

- `hp:` 네임스페이스 → 본문 모델 클래스 (Paragraph, Run, Tbl, Pic 등)
- `hh:` 네임스페이스 → 문서 설계 클래스 (`HH_` 접두사, HH_Style, HH_Font 등)

### RenderingManager
기본 HTML 문서 구조(`<html>`, `<head>`, `<body>`)를 생성합니다.

### Models
파싱된 데이터를 담는 계층적 모델 구조입니다.

---

## 모델 구조

### 문서 계층

```
Sec (섹션)
└── Paragraph (단락)
    ├── Linesegarray
    │   └── Lineseg (줄 위치/크기 정보)
    └── Run (문자 포맷팅 단위)
        ├── Text       — 텍스트
        ├── Tbl        — 표
        └── Pic        — 이미지
```

### 표 계층

```
Tbl (표)
└── Tr (행)
    └── Tc (셀)
        └── SubList (셀 내부 단락 목록)
            └── Paragraph
```

### 이미지 계층

```
Pic
├── Img          — 이미지 파일 참조
├── ImgRect      — 이미지 영역
├── ImgClip      — 이미지 클리핑
├── InMargin     — 내부 여백
└── LineShape    — 테두리 선
```

### 문서 설계 (Design)

`HH_` 접두사를 가진 클래스들이 문서의 스타일 및 설계 정보를 담당합니다.

| 클래스 | 역할 |
|--------|------|
| `HH_Head` | 문서 전체 설계 정보 |
| `HH_Style` | 개별 스타일 정의 |
| `HH_CharProperties` | 문자 속성 |
| `HH_ParaProperties` | 단락 속성 |
| `HH_BorderFill` | 테두리/채우기 |
| `HH_Font` | 글꼴 정보 |

---

## WrapperP — outMargin 표현

### 배경

HWPX의 표(`Tbl`), 이미지(`Pic`) 등 객체는 `hp:outMargin`을 통해 부모 영역 내에서의 위치(top, left, right, bottom)를 정의합니다.
HTML 변환 시 이 위치 정보를 표현하기 위해 **콘텐츠 요소**와 **위치 컨테이너**를 분리할 필요가 있으며, 이를 `WrapperP`로 해결했습니다.

### 구조

```objc
@interface WrapperP : NSObject
@property HTMLElement *outer;  // position:absolute + outMargin이 적용된 컨테이너 div
@property HTMLElement *inner;  // 실제 콘텐츠 요소 (<table>, <img> 등)
@end
```

### 동작

```
HWPX 객체 (Tbl, Pic 등)
       ↓  convertToHtml
   WrapperP
   ├── outer → <div style="position:absolute; top:Xpt; left:Ypt; ...">  ← outMargin
   └── inner → <table> / <img> / ...                                    ← 실제 콘텐츠
```

상위 레이어에서는 `outer`를 DOM에 삽입하고, 자식 노드 추가가 필요한 경우 `inner`에 접근합니다.

```objc
// 섹션 렌더링 (main.m)
for (WrapperP *section in sections) {
    [[doc body] appendNode:section.outer];
}

// 테이블 (Tbl.m)
WrapperP *wrapper = [WrapperP new];
wrapper.outer = wrapperDiv;  // position:absolute 컨테이너
wrapper.inner = table;       // <table> 요소
```

### outMargin CSS 포맷

```
top:%@; left:%@; right:%@; bottom:%@;
```

---

## 유틸리티

### NSObject+ParsingHelper (카테고리)

모든 모델 클래스에서 공통으로 사용하는 헬퍼 메서드를 제공합니다.

| 메서드 | 역할 |
|--------|------|
| `convertUnsignedIntToPt:` | HWP 단위 → pt 변환 |
| `convertDic:` | 딕셔너리 → CSS 문자열 변환 |
| `initializeWithMutableArray` | NSMutableArray 프로퍼티 자동 초기화 |
| `outMarginFormat` | outMargin CSS 포맷 문자열 반환 |

### 단위 변환

HWPX는 내부적으로 `hwpunit`이라는 단위를 사용합니다.

```
1 pt = 100 hwpunit
예) 1200 hwpunit = 12pt
```

---

## 기술 스택

- **언어**: Objective-C
- **플랫폼**: macOS
- **XML 파싱**: NSXMLParser
- **HTML 생성**: HTMLKit
- **ZIP 처리**: UnzipManager
