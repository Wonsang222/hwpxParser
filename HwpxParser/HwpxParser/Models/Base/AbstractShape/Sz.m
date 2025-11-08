//
//  Sz.m
//  HwpxParser
//
//  Created by 인스웨이브 on 8/12/25.
//

#import "Sz.h"
#import "../../../Extensions/NSObject+ParsingHelper.h"

NS_ASSUME_NONNULL_BEGIN

@implementation Sz
@synthesize width;
@synthesize widthRelTo;
@synthesize height;
@synthesize heightRelTo;
@synthesize protect;

-(NSString*)getWidth
{
    return self.width;
}
-(NSString*)getHeight
{
    return self.height;
}

- (NSMutableDictionary *)getAtt
{
    return [@{
        @"height" : [self convertUnsignedIntToPt:self.height],
        @"width" : [self convertUnsignedIntToPt:self.height]
    }mutableCopy];
}

@end

NS_ASSUME_NONNULL_END
