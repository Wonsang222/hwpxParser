//
//  InMargin.m
//  HwpParser
//
//  Created by WonsangHwang on 7/11/25.
//

#import "InMargin.h"
#import "../../../Extensions/NSObject+ParsingHelper.h"

NS_ASSUME_NONNULL_BEGIN

@implementation InMargin
- (NSMutableDictionary *)getAtt
{
    return [@{
        @"padding-top" : [self convertUnsignedIntToPt:self.top],
        @"padding-bottom" : [self convertUnsignedIntToPt:self.bottom],
        @"padding-left" : [self convertUnsignedIntToPt:self.left],
        @"padding-right" : [self convertUnsignedIntToPt:self.right],
    }mutableCopy];
}
@end

NS_ASSUME_NONNULL_END
