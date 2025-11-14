//
//  HH_LineSpacing.m
//  HwpxParser
//
//  Created by 인스웨이브 on 11/12/25.
//

#import "HH_LineSpacing.h"
#import "../../Extensions/NSObject+ParsingHelper.h"

@implementation HH_LineSpacing

@synthesize type;
@synthesize value;
@synthesize unit;

-(NSDictionary*) getCssData
{
    NSMutableDictionary* cssString = [@{}mutableCopy];
    
    if ([type isEqualToString:@"PERCENT"]) {
        float percent = [self.value floatValue] / 100.0;
        NSString* val = [NSString stringWithFormat:@"%.2f;", percent];
        cssString[@"line-height"] = val;
    } else {
        @throw @"LineSpacing Error in No using HWPUnit";
    }
    
    return cssString;
}

@end
