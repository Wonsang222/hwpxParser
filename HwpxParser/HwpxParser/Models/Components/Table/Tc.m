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

- (HTMLElement *)convertToHtml:(NSString *)marin
{
    // marin == tbl로 부터 넘어온 마진 데이터
    HTMLElement* tc = [[HTMLElement alloc] initWithTagName:@"td"];
    // cellSize String
    NSString *relative = @"position:relative; ";
    NSMutableDictionary *size = [self.cellSz getSizePt];
    NSString *sizeString = [self convertDic:size];
    
    NSString *margin = marin;
    NSString *final;
    NSString *relativeWithSize = [relative stringByAppendingString:sizeString];
    
    if (![self.hasMargin isEqualTo:@"0"]) {
        // 고유의 cell margin을 사용 안한다
        // 1 depth 아래 relative일때만 적용할 padding
        NSString *paddingString = [self addPaddingString:marin];
        final = [relativeWithSize stringByAppendingString:paddingString];
    } else {
        NSMutableDictionary* cellMargin = [self.cellMargin getMarginPt];
        NSString *cellMarginString = [self convertDic:cellMargin];
        NSString *paddingCellMargin = [self addPaddingString:[cellMarginString mutableCopy]];
        final = [relativeWithSize stringByAppendingString:paddingCellMargin];
        margin = cellMarginString;
    }
    
    [tc setAttributes:[@{
        @"style": final
    }mutableCopy]];
    
    NSMutableArray<HTMLElement *>* contentFromSublist = [self.subList convertToHtml:margin];
    
    for (WrapperP* e in contentFromSublist) {
        [tc appendNode:e.outer];
    }
    
    return tc;
}

@end

