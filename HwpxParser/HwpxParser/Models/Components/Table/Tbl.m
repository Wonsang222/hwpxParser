//
//  Table.m
//  HwpParser
//
//  Created by WonsangHwang on 7/1/25.
//

#import "Tbl.h"
#import "../../../Extensions/NSObject+ParsingHelper.h"
#import "../Pic/InMargin.h"
#import "CellZone.h"
#import "Label.h"
#import "Tr.h"
#import "../../../main.h"
#import "../../../Models/WrapperP.h"
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

- (NSString*)getInMarin
{
    NSString *top = [self convertUnsignedIntToPt:self.inMargin.top];
    NSString *left = [self convertUnsignedIntToPt:self.inMargin.left];
    NSString *right = [self convertUnsignedIntToPt:self.inMargin.right];
    NSString *bottom = [self convertUnsignedIntToPt:self.inMargin.bottom];

    return [NSString stringWithFormat:@"top:%@; left:%@; right:%@; bottom:%@;", top, left, right, bottom];
}

- (NSDictionary *)getCSS
{
    NSMutableDictionary *superVal = [super getCSS];
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
    // borderFill 반영
    NSDictionary *borderFill = [head getBorderFill:self.borderFillIDRef];
    [res addEntriesFromDictionary:borderFill];
    
    return res;
}

-(WrapperP*_Nonnull)convertToHtml;
{
    // absolute
    HTMLElement *wrapperDiv = [self getWrapperDiv];
    HTMLElement *table = [[HTMLElement alloc] initWithTagName:@"table"];
    NSMutableString *position = [@"position:relative; "mutableCopy];
    NSString *css = [position stringByAppendingString:[self getSize]];
    [table setAttributes:[@{
        @"style": css
    }mutableCopy]];
    
    WrapperP *wrapper = [WrapperP new];
    [wrapperDiv appendNode:table];
    wrapper.outer = wrapperDiv;
    wrapper.inner = table;
    
    for (Tr* tableRow in self.tr) {
        if ([tableRow respondsToSelector:@selector(getHtml:)]) {
            [tbl appendNode:[tableRow getHtml:<#(nonnull NSDictionary *)#>]];
        }
    }

    return wrapper;
}

@end

