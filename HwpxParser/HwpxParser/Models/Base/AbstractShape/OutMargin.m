//
//  OutMargin.m
//  HwpxParser
//
//  Created by WonsangHwang on 8/12/25.
//

#import "OutMargin.h"
#import "../../../Extensions/NSObject+ParsingHelper.h"

NS_ASSUME_NONNULL_BEGIN

@implementation OutMargin

- (NSMutableDictionary *)getAtt
{
    return [@{
        @"top" : [self convertUnsignedIntToPt:self.top],
        @"bottom" : [self convertUnsignedIntToPt:self.bottom],
        @"left" : [self convertUnsignedIntToPt:self.left],
        @"right" : [self convertUnsignedIntToPt:self.right],
    }mutableCopy];
}

@end

NS_ASSUME_NONNULL_END
