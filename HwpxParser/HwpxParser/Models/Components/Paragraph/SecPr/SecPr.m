//
//  SecPr.m
//  HwpxParser
//
//  Created by Wonsang Hwang on 8/13/25.
//

#import "SecPr.h"
#import "StartNum.h"
#import "Grid.h"
#import "PagePr.h"
#import "Note/FootNotePr.h"
#import "Note/EndNotePr.h"
#import "PageBorderFill.h"
#import "LineNumberShape.h"

NS_ASSUME_NONNULL_BEGIN

@implementation SecPr
@synthesize identification;
@synthesize textDirection;
@synthesize spaceColumns;
@synthesize tabStop;
@synthesize tabStopVal;
@synthesize tabStopUnit;
@synthesize outlineShapeIDRef;
@synthesize memoShapeIDRef;
@synthesize textVerticalWidthHead;
@synthesize masterPageCnt;
@synthesize startNum;
@synthesize grid;
@synthesize pagePr;
@synthesize footNotePr;
@synthesize endNotePr;
@synthesize pageBorderFill;

-(HTMLElement*)getHtml
{
    return [pagePr getHtml];
}

@end

NS_ASSUME_NONNULL_END
