//
//  HH_Case.m
//  HwpxParser
//
//  Created by WonsangHwang on 11/14/25.
//

#import "HH_Cases.h"
#import "HH_Margin.h"
#import "HH_LineSpacing.h"
#import "HH_Intent.h"

NS_ASSUME_NONNULL_BEGIN

@implementation HH_Cases

- (NSDictionary *)getCSSData
{
    NSMutableDictionary *result = [@{}mutableCopy];
    
    NSDictionary *margin = [self.margin getCssData];
    NSDictionary *lineSpacing = [self.lineSpacing getCssData];
    
    [result addEntriesFromDictionary:margin];
    [result addEntriesFromDictionary:lineSpacing];
    
    return result;
}

- (nullable NSString *)getIntentCSS
{
    if (!self.margin.intent) return nil;
    return [self.margin.intent getCSSData];
}

- (CGFloat)getIntentPt
{
    if (!self.margin.intent) return 0.0;
    CGFloat val = [self.margin.intent.value floatValue];
    if (val < 0) val *= -1;
    return val;
}

@end

NS_ASSUME_NONNULL_END
