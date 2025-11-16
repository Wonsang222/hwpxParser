//
//  Lineseg.m
//  HwpParser
//
//  Created by Wonsang Hwang on 7/16/25.
//

#import "Lineseg.h"
#import "../../../Extensions/NSObject+ParsingHelper.h"
#import "../../../Models/Design/HH_Head.h"
@import HTMLKit;

@implementation Lineseg

@synthesize textpos;
@synthesize vertpos;
@synthesize vertsize;
@synthesize textheight;
@synthesize baseline;
@synthesize spacing;
@synthesize horzpos;
@synthesize horzsize;
@synthesize flags;

- (HTMLElement*)getOuterP:(HH_Head *)head WithID:(NSString *)identification
{
    HTMLElement *div = [[HTMLElement alloc]initWithTagName:@"div"];
    // line - height 계산
    NSMutableDictionary *paraPr = [[head getParaPr:identification]mutableCopy];
    
    NSString *lineHeight = @"line-height";
    
    float value = [paraPr[lineHeight] floatValue] * [self.textheight floatValue];
    NSString *strVal = [NSString stringWithFormat:@"%.2fpx", value];
    paraPr[lineHeight] = strVal;
    paraPr[@"position"] = @"relative";
    paraPr[@"height"] = @"auto";
    NSString *style = [self convertDic:paraPr];
    
    [div setAttributes:[@{@"style" : style}mutableCopy]];
    
    return div;
}

- (BOOL)isNewPage
{
    if ([self.vertpos isEqualToString:@"0"]) {
        return YES;
    }
    return NO;
}
@end

