//
//  Margin.m
//  HwpxParser
//
//  Created by 인스웨이브 on 8/12/25.
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
        @"padding-top" : [self convertUnsignedIntToPt:self.top ?: @"0"],
        @"padding-bottom" : [self convertUnsignedIntToPt:self.bottom ?: @"0"],
        @"padding-left" : [self convertUnsignedIntToPt:self.left ?: @"0"],
        @"padding-right" : [self convertUnsignedIntToPt:self.right ?: @"0"],
    }mutableCopy];
    
    return margins;
}
@end


