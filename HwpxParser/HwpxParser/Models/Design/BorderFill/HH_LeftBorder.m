//
//  HH_LeftBorder.m
//  HwpxParser
//
//  Created by 인스웨이브 on 11/11/25.
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
    
    if ([type isNotEqualTo:@"NONE"]) {
        val = [NSString stringWithFormat:@"%@ %@ %@", self.width, self.type, self.color];
    }
    NSString *key = [self location];
    result[key] = val;
    
    return result;
}

@end
