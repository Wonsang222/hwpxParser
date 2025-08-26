//
//  Linesegarray.m
//  HwpParser
//
//  Created by Wonsang Hwang on 7/16/25.
//

#import "Linesegarray.h"
#import "../../../Extensions/NSObject+ParsingHelper.h"

NS_ASSUME_NONNULL_BEGIN

@implementation Linesegarray

@synthesize lineseg;

-(instancetype)init
{
    self = [super init];
    [self initializeWithMutableArray];
    return self;
}

- (BOOL)isNewPage
{
    for (Lineseg* line in lineseg) {
        if ([line isNewPage]) {
            return YES;
        }
    }
    return  NO;
}

@end

NS_ASSUME_NONNULL_END
