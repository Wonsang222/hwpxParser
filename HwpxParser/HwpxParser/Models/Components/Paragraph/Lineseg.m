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

- (NSDictionary*)getOuterP:(HH_Head *)head WithID:(NSString *)identification
{
    // line - height 계산
    NSMutableDictionary *paraPr = [[head getParaPr:identification]mutableCopy];
    
    NSString *lineHeight = @"line-height";
    
    float value = [paraPr[lineHeight] floatValue] * [self.textheight floatValue];
    NSString *strVal = [NSString stringWithFormat:@"%.2fpx", value];
    paraPr[lineHeight] = strVal;
    
    return paraPr;
}

- (BOOL)isNewPage
{
    if ([self.vertpos isEqualToString:@"0"]) {
        return YES;
    }
    return NO;
}
@end

