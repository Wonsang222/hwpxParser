//
//  Lineseg.m
//  HwpParser
//
//  Created by Wonsang Hwang on 7/16/25.
//

#import "Lineseg.h"
#import "../../../Extensions/NSObject+ParsingHelper.h"
#import "../../../Models/Design/HH_Head.h"
#import "../../../Models/WrapperP.h"
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

- (WrapperP *)getOuterP
{
    // outerDiv(absolute) : top, left, width, height 모두 필요
    NSMutableString *absoluteStyle = [NSMutableString string];
    absoluteStyle = [self buildCssString:absoluteStyle withKey:@"top"      withValue:[self convertUnsignedIntToPt:self.vertpos]];
    absoluteStyle = [self buildCssString:absoluteStyle withKey:@"left"     withValue:[self convertUnsignedIntToPt:self.horzpos]];
    absoluteStyle = [self buildCssString:absoluteStyle withKey:@"width"    withValue:[self convertUnsignedIntToPt:self.horzsize]];
    absoluteStyle = [self buildCssString:absoluteStyle withKey:@"height"   withValue:[self convertUnsignedIntToPt:self.vertsize]];
    absoluteStyle = [self buildCssString:absoluteStyle withKey:@"position" withValue:@"absolute"];

    // innerDiv(relative) : top, left 없이 width, height 만 적용
    NSMutableString *relativeStyle = [NSMutableString string];
    relativeStyle = [self buildCssString:relativeStyle withKey:@"width"    withValue:[self convertUnsignedIntToPt:self.horzsize]];
    relativeStyle = [self buildCssString:relativeStyle withKey:@"height"   withValue:[self convertUnsignedIntToPt:self.vertsize]];
    relativeStyle = [self buildCssString:relativeStyle withKey:@"position" withValue:@"relative"];
    

    HTMLElement *outerDiv = [[HTMLElement alloc] initWithTagName:@"div"];
    [outerDiv setAttributes:[@{@"style": absoluteStyle} mutableCopy]];

    HTMLElement *innerDiv = [[HTMLElement alloc] initWithTagName:@"div"];
    [innerDiv setAttributes:[@{@"style": relativeStyle} mutableCopy]];

    [outerDiv appendNode:innerDiv];

    WrapperP *wrapper = [[WrapperP alloc] init];
    wrapper.outer = outerDiv;
    wrapper.inner = innerDiv;

    return wrapper;
}

- (BOOL)isNewPage
{
    if ([self.vertpos isEqualToString:@"0"]) {
        return YES;
    }
    return NO;
}

- (void)addHorzpos:(CGFloat)intent
{
    CGFloat horz = [self.horzpos floatValue];
    horz = (horz + intent) / 2;
    self.horzpos = [NSString stringWithFormat:@"%f", horz];
}

@end

