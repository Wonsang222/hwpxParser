//
//  Linesegarray.m
//  HwpParser
//
//  Created by Wonsang Hwang on 7/16/25.
//

#import "Linesegarray.h"
#import "../../../Extensions/NSObject+ParsingHelper.h"
#import "../../MarginSender.h"

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

- (int)count
{
    return (int) [self.lineseg count];
}

- (void)addMarginWith:(MarginSender *)margin
{
    for (Lineseg *line in self.lineseg) {
        line.textpos = [NSString stringWithFormat:@"%d", [line.textpos intValue] + [margin.left intValue]];
        line.vertpos = [NSString stringWithFormat:@"%d", [line.vertpos intValue] + [margin.top intValue]];
    }
}

@end

NS_ASSUME_NONNULL_END
