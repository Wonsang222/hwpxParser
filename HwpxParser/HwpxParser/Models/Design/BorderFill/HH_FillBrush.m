//
//  HH_FillBrush.m
//  HwpxParser
//
//  Created by Wonsang Hwang on 11/15/25.
//

#import "HH_FillBrush.h"
#import "HH_WinBrush.h"

NS_ASSUME_NONNULL_BEGIN

@implementation HH_FillBrush
- (NSDictionary *)getCSS
{
    return [self.winBrush getCSS];
}

@end

NS_ASSUME_NONNULL_END
