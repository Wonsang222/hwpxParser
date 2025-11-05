//
//  CellSz.m
//  HwpParser
//
//  Created by 인스웨이브 on 7/11/25.
//

#import "CellSz.h"
#import "../../../Extensions/NSObject+ParsingHelper.h"

NS_ASSUME_NONNULL_BEGIN

@implementation CellSz
@synthesize height;
@synthesize width;

- (NSMutableDictionary *)getSizePt
{
    NSMutableDictionary* size = [@{
        @"height" : [self convertUnsignedIntToPt:self.height],
        @"width" : [self convertUnsignedIntToPt:self.width],
    }mutableCopy];
    return size;
}

@end

NS_ASSUME_NONNULL_END
