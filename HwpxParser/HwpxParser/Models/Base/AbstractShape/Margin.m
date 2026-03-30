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
        @"top" : [self convertUnsignedIntToPt:self.top ?: @"0"],
        @"bottom" : [self convertUnsignedIntToPt:self.bottom ?: @"0"],
        @"left" : [self convertUnsignedIntToPt:self.left ?: @"0"],
        @"right" : [self convertUnsignedIntToPt:self.right ?: @"0"],
    }mutableCopy];
    
    return margins;
}
@end


