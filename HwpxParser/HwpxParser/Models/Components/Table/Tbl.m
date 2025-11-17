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

- (NSMutableArray<NSString*> *)getInMarin
{
    NSMutableArray *result = [[NSMutableArray alloc] init];
    NSString *top = self.inMargin.top ?: @"0";
    NSString *left = self.inMargin.left ?: @"0";
    NSString *right = self.inMargin.right ?: @"0";
    NSString *bottom = self.inMargin.bottom ?: @"0";
    
    [result addObject:top];
    [result addObject:left];
    [result addObject:right];
    [result addObject:bottom];
    return result;
}

- (NSDictionary *)getCSS
{
    NSMutableDictionary *superVal = [super getCSS];
    NSDictionary *inMargin = [self.inMargin getAtt];
    [superVal addEntriesFromDictionary:inMargin];
    NSDictionary *own = [self getOwn];
    [superVal addEntriesFromDictionary:own];
    return superVal;
}

-(NSDictionary*)getOwn
{
    NSMutableDictionary* res = [@{}mutableCopy];
    // inline으로 강제
    res[@"display"] = @"inline-table";
    res[@"border-collapse"] = @"collapse";
    res[@"table-layout"] = @"fixed";
    return res;
}

-(HTMLElement*_Nonnull)convertToHtml;
{
    // borderfill 에 따라서 att 변경되어야함. Todo
    
    NSMutableArray *sizes = [self getSize];
    NSString* height = [sizes firstObject];
    NSString* width = [sizes lastObject];
    
    NSMutableArray *outmargins = [self getOMargin];
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
    
    NSMutableDictionary* attString = [self createAttribute:att];
    [tbl setAttributes:attString];
    
    for (Tr* tableRow in self.tr) {
        if ([tableRow respondsToSelector:@selector(getHtml)]) {
            [tbl appendNode:[tableRow getHtml]];
        }
    }

    return tbl;
}

@end

