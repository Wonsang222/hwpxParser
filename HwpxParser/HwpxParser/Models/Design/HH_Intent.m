//
//  HH_Intent.m
//  HwpxParser
//
//  Created by WonsangHwang on 11/12/25.
//

#import "HH_Intent.h"
#import "../../Extensions/NSObject+ParsingHelper.h"

NS_ASSUME_NONNULL_BEGIN

@implementation HH_Intent

- (NSString *)getCSSData
{
    CGFloat val = [self.value floatValue];

    if ([self.unit isEqualToString:@"HWPUNIT"]) {
        val = val/100.0;
    } else {
        @throw @"No HWPUnit";
    }
    return [NSString stringWithFormat:@"%.2fpt", val];
}

@end

NS_ASSUME_NONNULL_END
