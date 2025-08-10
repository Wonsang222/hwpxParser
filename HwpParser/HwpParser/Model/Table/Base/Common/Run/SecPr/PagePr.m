//
//  PagePr.m
//  HwpParser
//
//  Created by 인스웨이브 on 7/1/25.
//

#import "PagePr.h"
#import "../../../../../../Extension/NSObject+AttributeSetter.h"

@implementation PagePr

@synthesize landscape;
@synthesize width;
@synthesize height;
@synthesize gutterType;

@synthesize margin;

- (HTMLElement*)getHtml
{
    HTMLElement* div = [[HTMLElement alloc] initWithTagName:@"div"];
    
    NSMutableDictionary* att = [@{
        @"box-sizing" : @"border-box",
        @"position" : @"relative",
        @"height" : [self convertHwpunitToPt:self.height],
        @"width" : [self convertHwpunitToPt:self.width],
        @"padding-top" : [self convertHwpunitToPt:self.margin.top],
        @"padding-bottom" : [self convertHwpunitToPt:self.margin.bottom],
        @"padding-left" : [self convertHwpunitToPt:self.margin.left],
        @"padding-right" : [self convertHwpunitToPt:self.margin.right],
        @"background-color" : @"red"
        
    } mutableCopy];
    
    NSString* attString = [self createAttribute:att];
    [div setAttributes:[@{@"style" : attString } mutableCopy]];
    return div;
}

@end
