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

@import HTMLKit;

@implementation Tc

- (HTMLElement *)convertToHtml
{
    HTMLElement* tc = [[HTMLElement alloc] initWithTagName:@"tc"];

    NSMutableDictionary *att = [@{
        
    }mutableCopy];
    
    NSMutableDictionary* size = [self.cellSz getSizePt];
    [att addEntriesFromDictionary:size];
        
    if ([self.hasMargin isEqualTo:@"0"]) {
        NSMutableDictionary *margins = [self.cellMargin getMarginPt];
        [att addEntriesFromDictionary:margins];
        
    } else {
        // 명시적 셀여백 사용
    }
    
    [tc setAttributes:att];
    
    return tc;
}

@end

