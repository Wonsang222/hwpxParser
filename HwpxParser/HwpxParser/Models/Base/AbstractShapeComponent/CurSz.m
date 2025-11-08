//
//  CurSz.m
//  HwpParser
//
//  Created by 인스웨이브 on 7/11/25.
//

#import "CurSz.h"
#import "../../../Extensions/NSObject+ParsingHelper.h"

NS_ASSUME_NONNULL_BEGIN

@implementation CurSz
@synthesize width;
@synthesize height;

- (NSMutableDictionary *)getCurSize
{
    return [@{
        @"height" : [self convertUnsignedIntToPt:self.height],
        @"width" : [self convertUnsignedIntToPt:self.width]
    }mutableCopy];
}

@end

NS_ASSUME_NONNULL_END
