//
//  Margin.m
//  HwpxParser
//
//  Created by WonsangHwang on 8/12/25.
//

#import "Margin.h"
#import "../../../Extensions/NSObject+ParsingHelper.h"

@implementation Margin

@synthesize top;
@synthesize bottom;
@synthesize left;
@synthesize right;
@synthesize header;
@synthesize footer;
@synthesize gutter;

- (NSMutableDictionary *)getMarginPt
{
    NSMutableDictionary *margins = [@{
        @"top" : self.top,
        @"bottom" : self.bottom,
        @"left" : self.left,
        @"right" : self.right
    }mutableCopy];
    
    return margins;
}
@end


