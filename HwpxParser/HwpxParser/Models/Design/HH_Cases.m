//
//  HH_Case.m
//  HwpxParser
//
//  Created by WonsangHwang on 11/14/25.
//

#import "HH_Cases.h"
#import "HH_Margin.h"
#import "HH_LineSpacing.h"

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

@end

NS_ASSUME_NONNULL_END
