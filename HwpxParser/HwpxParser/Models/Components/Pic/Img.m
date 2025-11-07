//
//  Img.m
//  HwpParser
//
//  Created by Wonsang Hwang on 7/16/25.
//

#import "Img.h"

NS_ASSUME_NONNULL_BEGIN

@implementation Img

@synthesize binaryItemIDRef;
@synthesize bright;
@synthesize contrast;
@synthesize effect;
@synthesize alpha;

- (NSString *)getImgName
{
    return binaryItemIDRef;
}

@end

NS_ASSUME_NONNULL_END
