//
//  SecPr.h
//  HwpxParser
//
//  Created by Wonsang Hwang on 8/13/25.
//

#import <Foundation/Foundation.h>
#import "StartNum.h"
#import "Grid.h"
#import "PagePr.h"
#import "Note/FootNotePr.h"
#import "Note/EndNotePr.h"
#import "PageBorderFill.h"
#import "LineNumberShape.h"

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
@property(nullable, strong) PagePr* pagePr;
@property(nullable, strong) FootNotePr* footNotePr;
@property(nullable, strong) EndNotePr* endNotePr;
@property(nullable, strong) PageBorderFill* pageBorderFill;

@end

NS_ASSUME_NONNULL_END
