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

-(NSMutableString*) getCssData
{
    NSMutableString* cssString = [NSMutableString string];
    
    if ([type isEqualToString:@"PERCENT"]) {
        
        float percent = [self.value floatValue] / 100.0;
        NSString* val = [NSString stringWithFormat:@"%.2f;", percent];
        cssString = [self buildCssString:cssString withKey:@"line-height" withValue: val];
    } else if ([type isEqualToString:@"FIX"] || [type isEqualToString:@"POINT"]) {
        // 고정값 단위
        cssString = [self buildCssString:cssString withKey:@"line-height" withValue:[self convertUnsignedIntToPt:self.value]];
    } else {
        // fallback
        cssString = [self buildCssString:cssString withKey:@"line-height" withValue:@"normal"];
    }
    
    return cssString;
}

@end
