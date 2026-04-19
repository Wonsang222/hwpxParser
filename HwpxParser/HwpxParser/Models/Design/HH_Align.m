//
//  HH_Align.m
//  HwpxParser
//
//  Created by WonsangHwang on 11/12/25.
//

#import "HH_Align.h"

@implementation HH_Align

@synthesize horizontal;
@synthesize vertical;

- (NSDictionary *)getCssData {
    
    NSMutableDictionary *result = [@{}mutableCopy];
    
    // --- Horizontal alignment ---
    if (self.horizontal) {
        NSString *cssAlign = nil;
        if ([self.horizontal isEqualToString:@"LEFT"]) cssAlign = @"left";
        else if ([self.horizontal isEqualToString:@"RIGHT"]) cssAlign = @"right";
        else if ([self.horizontal isEqualToString:@"CENTER"]) cssAlign = @"center";
        else if ([self.horizontal isEqualToString:@"JUSTIFY"]) cssAlign = @"justify;";
        else if ([self.horizontal isEqualToString:@"DISTRIBUTE"]) cssAlign = @"justify";
        
        if (cssAlign) {
            result[@"text-align"] = cssAlign;
        }
    }
    
    // --- Vertical alignment ---
    if (self.vertical) {
        NSString *cssValign = nil;
        if ([self.vertical isEqualToString:@"TOP"]) cssValign = @"top";
        else if ([self.vertical isEqualToString:@"CENTER"]) cssValign = @"middle";
        else if ([self.vertical isEqualToString:@"BASELINE"]) cssValign = @"baseline";
        else if ([self.vertical isEqualToString:@"BOTTOM"]) cssValign = @"bottom";
        
        if (cssValign) {
            result[@"vertical-align"] = cssValign;
        }
    }
    
    return result;
}


@end
