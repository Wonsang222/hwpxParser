//
//  PagePr.m
//  HwpParser
//
//  Created by 인스웨이브 on 7/1/25.
//

#import "PagePr.h"

@implementation PagePr

@synthesize landscape;
@synthesize width;
@synthesize height;
@synthesize gutterType;

@synthesize margin;

- (void)setMargin:(Margin *)newMargin {
    margin = newMargin;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"PagePr{landscape=%@, width=%@, height=%@, gutterType=%@, margin=%@}", 
            self.landscape, self.width, self.height, self.gutterType, self.margin];
}

- (HTMLElement *)getHtml
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
    } mutableCopy];
    
    [div setAttributes:att];
    return div;
}

@end
