//
//  HH_Intent.m
//  HwpxParser
//
//  Created by 인스웨이브 on 11/12/25.
//

#import "HH_Intent.h"
#import "../../Extensions/NSObject+ParsingHelper.h"

NS_ASSUME_NONNULL_BEGIN

@implementation HH_Intent

- (NSString *)getCSSData
{
    CGFloat val = [self.value floatValue];

    if ([self.unit isEqualToString:@"HWPUNIT"]) {
        val = val * 0.0378;
    } else if ([self.unit isEqualToString:@"MM"]) {
        val = val * 3.78;
    } else if ([self.unit isEqualToString:@"PT"]) {
        val = val * 1.3333;
    } else if ([self.unit isEqualToString:@"INCH"]) {
        val = val * 96.0;
    } else {
        // 알 수 없는 단위는 안전하게 0 리턴
        val = 0;
    }
    return [NSString stringWithFormat:@"%.2fpt", val];
}

@end

NS_ASSUME_NONNULL_END
