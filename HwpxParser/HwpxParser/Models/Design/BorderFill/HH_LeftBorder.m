//
//  HH_LeftBorder.m
//  HwpxParser
//
//  Created by WonsangHwang on 11/11/25.
//

#import "HH_LeftBorder.h"

@implementation HH_LeftBorder

@synthesize type;
@synthesize width;
@synthesize color;

-(NSString*)location
{
    return @"border-left";
}

- (NSDictionary *)getCSS {
    NSMutableDictionary *result = [@{}mutableCopy];
    NSString *val = @"none";
    
    if (![self.type isEqualToString:@"NONE"]) {
        NSString *cssWidth = [self.width stringByReplacingOccurrencesOfString:@" " withString:@""];
        val = [NSString stringWithFormat:@"%@ %@ %@", cssWidth, self.type, self.color];
    }
    NSString *key = [self location];
    result[key] = val;
    
    return result;
}

@end
