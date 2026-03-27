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
    NSMutableString *baseStyle = [NSMutableString string];
    baseStyle = [self buildCssString:baseStyle withKey:@"top"    withValue:[self convertUnsignedIntToPt:self.vertpos]];
    baseStyle = [self buildCssString:baseStyle withKey:@"left"   withValue:[self convertUnsignedIntToPt:self.horzpos]];
    baseStyle = [self buildCssString:baseStyle withKey:@"width"  withValue:[self convertUnsignedIntToPt:self.horzsize]];
    baseStyle = [self buildCssString:baseStyle withKey:@"height" withValue:[self convertUnsignedIntToPt:self.vertsize]];

    NSMutableString *relativeStyle = [[self buildCssString:[baseStyle mutableCopy] withKey:@"position" withValue:@"relative"] mutableCopy];
    NSMutableString *absoluteStyle = [[self buildCssString:[baseStyle mutableCopy] withKey:@"position" withValue:@"absolute"] mutableCopy];

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
@end

