//
//  Lineseg.m
//  HwpParser
//
//  Created by Wonsang Hwang on 7/16/25.
//

#import "Lineseg.h"

NS_ASSUME_NONNULL_BEGIN

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

- (HTMLElement *)convertToHtml
{
    HTMLElement* div = [[HTMLElement alloc] initWithTagName:@"div"];
    NSMutableDictionary* att = [@{
        @"box-sizing" : @"border-box"    ,
        @"position" : @"absolute",
        @"left" : [self convertHwpunitToPt:self.textpos],
        @"top" : [self convertHwpunitToPt:self.vertpos],
        @"height" : [self convertHwpunitToPt:self.vertsize],
    }mutableCopy];
    
    [div setAttributes:att];
    
    return div;
}
@end

NS_ASSUME_NONNULL_END
