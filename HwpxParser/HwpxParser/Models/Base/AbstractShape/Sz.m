//
//  Sz.m
//  HwpxParser
//
//  Created by 인스웨이브 on 8/12/25.
//

#import "Sz.h"

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

@end

NS_ASSUME_NONNULL_END
