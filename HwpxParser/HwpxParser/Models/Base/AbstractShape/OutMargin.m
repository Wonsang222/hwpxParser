//
//  OutMargin.m
//  HwpxParser
//
//  Created by 인스웨이브 on 8/12/25.
//

#import "OutMargin.h"
#import "../../../Extensions/NSObject+ParsingHelper.h"

NS_ASSUME_NONNULL_BEGIN

@implementation OutMargin

- (NSMutableDictionary *)getAtt
{
    return [@{
        @"margin-top" : [self convertUnsignedIntToPt:self.top],
        @"margin-bottom" : [self convertUnsignedIntToPt:self.bottom],
        @"margin-left" : [self convertUnsignedIntToPt:self.left],
        @"margin-right" : [self convertUnsignedIntToPt:self.right],
    }mutableCopy];
}

@end

NS_ASSUME_NONNULL_END
