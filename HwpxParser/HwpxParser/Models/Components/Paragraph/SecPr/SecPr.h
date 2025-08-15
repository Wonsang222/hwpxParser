//
//  SecPr.h
//  HwpxParser
//
//  Created by Wonsang Hwang on 8/13/25.
//

#import <Foundation/Foundation.h>
@import HTMLKit;

@class StartNum;
@class Grid;
@class PagePr;
@class FootNotePr;
@class EndNotePr;
@class PageBorderFill;
@class LineNumberShape;

NS_ASSUME_NONNULL_BEGIN

@interface SecPr : NSObject
@property(nonnull, strong) NSString *identification;
@property(nonnull, strong) NSString *textDirection;
@property(nonnull, strong) NSString *spaceColumns;
@property(nonnull, strong) NSString *tabStop;
@property(nonnull, strong) NSString *tabStopVal;
@property(nonnull, strong) NSString *tabStopUnit;
@property(nonnull, strong) NSString *outlineShapeIDRef;
@property(nonnull, strong) NSString *memoShapeIDRef;
@property(nonnull, strong) NSString *textVerticalWidthHead;
@property(nonnull, strong) NSString *masterPageCnt;

// nullable
@property(nullable, strong) LineNumberShape* lineNumberShape;
@property(nullable, strong) StartNum *startNum;
@property(nullable, strong) Grid *grid;
@property(strong) PagePr* pagePr;
@property(nullable, strong) FootNotePr* footNotePr;
@property(nullable, strong) EndNotePr* endNotePr;
@property(nullable, strong) PageBorderFill* pageBorderFill;
-(HTMLElement*)getHtml;

@end

NS_ASSUME_NONNULL_END
