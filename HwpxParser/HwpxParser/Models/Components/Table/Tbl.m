//
//  Table.m
//  HwpParser
//
//  Created by 인스웨이브 on 7/1/25.
//

#import "Tbl.h"
#import "../../../Extensions/NSObject+ParsingHelper.h"
#import "../Pic/InMargin.h"
#import "CellZone.h"
#import "Label.h"
#import "Tr.h"
@import HTMLKit;

@implementation Tbl

@synthesize pageBreak;
@synthesize repeatHeader;
@synthesize rowCnt;
@synthesize colCnt;
@synthesize noAdjust;
@synthesize cellSpacing;
@synthesize borderFillIDRef;
@synthesize inMargin;
@synthesize cellZone;
@synthesize tr;
@synthesize label;


-(instancetype)init {
    self = [super init];
    [self initializeWithMutableArray];
    return self;
}

- (NSMutableArray<NSString *> *)getInMarin
{
    NSMutableArray *result = [[NSMutableArray alloc] init];
    NSString *top = self.inMargin.top;
    NSString *left = self.inMargin.left;
    NSString *right = self.inMargin.right;
    NSString *bottom = self.inMargin.bottom;
    
    [result addObject:top];
    [result addObject:left];
    [result addObject:right];
    [result addObject:bottom];
    return result;
}

-(HTMLElement*_Nonnull)converting;
{
    // borderfill 에 따라서 att 변경되어야함. Todo
    
    NSMutableArray *sizes = [self getSize];
    NSString* height = [sizes firstObject];
    NSString* width = [sizes lastObject];
    
    NSMutableArray *outmargins = [self getOutMargin];
    NSString *outMarginTop = outmargins[0];
    NSString *outMarginLeft = outmargins[1];
    NSString *outMarginRight = outmargins[2];
    NSString *outMarginBottom = outmargins[3];
    
    NSMutableArray *inMargins = [self getInMarin];
    NSString *inMarginTop = inMargins[0];
    NSString *inMarginLeft = inMargins[1];
    NSString *inMarginRight = inMargins[2];
    NSString *inMarginBottom = inMargins[3];
    
    NSMutableDictionary* att = [@{
        @"box-sizing" : @"border-box",
        @"height" : [self convertUnsignedIntToPt:height],
        @"width" : [self convertUnsignedIntToPt:width],
        @"margin-top" : [self convertUnsignedIntToPt:outMarginTop],
        @"margin-bottom" : [self convertUnsignedIntToPt:outMarginBottom],
        @"margin-left" : [self convertUnsignedIntToPt:outMarginLeft],
        @"margin-right" : [self convertUnsignedIntToPt:outMarginRight],
        @"padding-top" : [self convertUnsignedIntToPt:inMarginTop],
        @"padding-right" : [self convertUnsignedIntToPt:inMarginRight],
        @"padding-bottom" : [self convertUnsignedIntToPt:inMarginBottom],
        @"padding-left" : [self convertUnsignedIntToPt:inMarginLeft],
        @"table-layout" : @"fixed",
        @"position" : @"relative",
    } mutableCopy];
    
    HTMLElement *tbl = [[HTMLElement alloc] initWithTagName:@"table" attributes:att];
    
    NSString* attString = [self createAttribute:att];
    [tbl setAttributes:[@{@"style" : attString } mutableCopy]];
    
    for (Tr* tableRow in self.tr) {
        
    }

    return tbl;
}

@end

