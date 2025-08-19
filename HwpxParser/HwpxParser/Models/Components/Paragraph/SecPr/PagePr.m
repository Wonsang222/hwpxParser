//
//  PagePr.m
//  HwpParser
//
//  Created by 인스웨이브 on 7/1/25.
//

#import "PagePr.h"
#import "../../../../Extensions/NSObject+ParsingHelper.h"

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
        @"height" : [self convertUnsignedIntToPt:self.height],
        @"width" : [self convertUnsignedIntToPt:self.width],
        @"padding-top" : [self convertUnsignedIntToPt:self.margin.top],
        @"padding-bottom" : [self convertUnsignedIntToPt:self.margin.bottom],
        @"padding-left" : [self convertUnsignedIntToPt:self.margin.left],
        @"padding-right" : [self convertUnsignedIntToPt:self.margin.right],
        @"background-color" : @"red"
        
    } mutableCopy];
    
    NSString* attString = [self createAttribute:att];
    [div setAttributes:[@{@"style" : attString } mutableCopy]];
    return div;
}

@end
