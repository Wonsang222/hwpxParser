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
#import "./BorderFill/HH_Switches.h"

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
@synthesize border;

- (NSDictionary *)getStyleData
{
    NSMutableDictionary *result = [@{}mutableCopy];
    
    NSDictionary* align = [self.align getCssData];
    NSDictionary* breakSetting = [self.breakSetting getCssData];
    NSDictionary *swit = [self.switches getCssData];

    
    [result addEntriesFromDictionary:align];
    [result addEntriesFromDictionary:breakSetting];
    [result addEntriesFromDictionary:swit];
    
    return result;
}

@end
