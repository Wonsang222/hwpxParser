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
    NSDictionary *css = [self getCSS];
    NSString *cssString = [self convertDic:css];
    HTMLElement *tbl = [[HTMLElement alloc] initWithTagName:@"table" attributes:[@{
        @"style" : cssString
    }mutableCopy]];
    
    
    for (Tr* tableRow in self.tr) {
        if ([tableRow respondsToSelector:@selector(getHtml)]) {
            [tbl appendNode:[tableRow getHtml]];
        }
    }

    return tbl;
}

@end

