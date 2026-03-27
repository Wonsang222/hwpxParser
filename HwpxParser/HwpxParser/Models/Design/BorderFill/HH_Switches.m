//
//  HH_Switch.m
//  HwpxParser
//
//  Created by WonsangHwang on 11/14/25.
//

#import "HH_Switches.h"
#import "../HH_Cases.h"

NS_ASSUME_NONNULL_BEGIN


@implementation HH_Switches

- (NSDictionary *)getCssData
{
    //
    return [self.cases getCSSData];
}

@end

NS_ASSUME_NONNULL_END
