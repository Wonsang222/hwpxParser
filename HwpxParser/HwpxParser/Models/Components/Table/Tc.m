//
//  Tc.m
//  HwpxParser
//
//  Created by Wonsang Hwang on 8/13/25.
//

#import "Tc.h"
#import "../Paragraph/SubList.h"
#import "CellAddr.h"
#import "CellSpan.h"
#import "CellSz.h"
#import "CellMargin.h"
#import "../../../Extensions/NSObject+ParsingHelper.h"
#import "../../WrapperP.h"

@import HTMLKit;

@implementation Tc

- (HTMLElement *)convertToHtml:(NSDictionary *)marin
{
    HTMLElement* tc = [[HTMLElement alloc] initWithTagName:@"td"];

    NSMutableDictionary *att = [@{
        
    }mutableCopy];
    
    NSMutableDictionary* size = [self.cellSz getSizePt];
    [att addEntriesFromDictionary:size];
    
    NSMutableDictionary *relativePosition = [@{
        @"position" : @"relative"
    }mutableCopy];
    
    [att addEntriesFromDictionary:relativePosition];
        
    if (![self.hasMargin isEqualTo:@"0"]) {
        NSMutableDictionary *margins = [self.cellMargin getMarginPt];
        [att addEntriesFromDictionary:margins];
        
    } else {
        // 명시적 셀여백 사용
        [att addEntriesFromDictionary:marin];
    }
    
    NSMutableDictionary* attString = [self createAttribute:att];
    [tc setAttributes:attString];
    // tc Contents
    NSMutableArray<WrapperP *>* contentFromSublist = [self.subList convertToHtml];
    
    for (WrapperP* e in contentFromSublist) {
        [tc appendNode:e.outer];
    }
    
    return tc;
}


@end

