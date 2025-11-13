//
//  HH_ParaPr.m
//  HwpxParser
//
//  Created by 인스웨이브 on 11/12/25.
//

#import "HH_ParaPr.h"
#import "HH_Align.h"
#import "HH_BreakSetting.h"
#import "HH_LineSpacing.h"
#import "HH_Margin.h"

@implementation HH_ParaPr

@synthesize identification;
@synthesize tabPrIDRef;
@synthesize condense;
@synthesize fontLineHeight;
@synthesize snapToGrid;
@synthesize suppressLineNumbers;
@synthesize checked;
@synthesize align;
@synthesize heading;
@synthesize breakSetting;
@synthesize autoSpacing;
@synthesize margin;
@synthesize lineSpacing;
@synthesize border;

- (NSString *)getStyleData
{
    NSMutableString* result = [NSMutableString string];
    
    NSString* align = [self.align getCssData];
    NSString* breakSetting = [self.breakSetting getCssData];
    NSString* lineSpacing = [self.lineSpacing getCssData];
    NSString* margin = [self.margin getCssData];
    
    [result appendString:align];
    [result appendString:breakSetting];
    [result appendString:lineSpacing];
    [result appendString:margin];

    return result;
}

@end
