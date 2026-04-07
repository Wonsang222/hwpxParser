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
#import "../../../Models/MarginSender.h"
#import "../../Design/HH_Head.h"
@import HTMLKit;

extern HH_Head *head;

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

- (MarginSender*)getInMarin
{
    NSString *top = self.inMargin.top;
    NSString *left = self.inMargin.left;
    MarginSender* marginSender = [MarginSender new];
    marginSender.top = top;
    marginSender.left = left;

    return marginSender;
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

    res[@"display"] = @"table";
    res[@"border-collapse"] = @"collapse";
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
    NSString *position = @"position:relative; ";
    NSString *css = [[[self convertDic:[self getOwn]] stringByAppendingString:position]stringByAppendingString:[self getSize]];
    [table setAttributes:[@{
        @"style": css
    }mutableCopy]];
    
    for (Tr* tableRow in self.tr) {
        if ([tableRow respondsToSelector:@selector(getHtml:)]) {
            HTMLElement* tr = [tableRow getHtml:[self getInMarin]];
            [table appendNode:tr];
        }
    }
    
    WrapperP *wrapper = [WrapperP new];
    [wrapperDiv appendNode:table];
    wrapper.outer = wrapperDiv;
    wrapper.inner = table;
    
    return wrapper;
}

@end

