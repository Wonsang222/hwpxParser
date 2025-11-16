//
//  HH_WinBrush.m
//  HwpxParser
//
//  Created by Wonsang Hwang on 11/15/25.
//

#import "HH_WinBrush.h"

NS_ASSUME_NONNULL_BEGIN

@implementation HH_WinBrush

- (NSDictionary *)getCSS
{
    NSMutableDictionary *result = [@{}mutableCopy];
    
    NSString *key = @"background-color";
    NSString *val = @"transparent";
    
    if ([self.faceColor isNotEqualTo:@"none"]) {
        val = self.hatchColor;
    }
    
    result[key] = val;
    
    return result;
}

@end

NS_ASSUME_NONNULL_END
