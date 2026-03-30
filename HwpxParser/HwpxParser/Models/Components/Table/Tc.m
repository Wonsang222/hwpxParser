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
    
    [tc setAttributes:[@{
        @"style": [relative stringByAppendingString:sizeString]
    }mutableCopy]];
    
    NSString *margin = marin;
    
    if (![self.hasMargin isEqualTo:@"0"]) {
        // 고유의 cell margin을 사용한다는 의미인듯 -> 공식문서에도 정확하게 안나와있다..
        // cell margin, cell size
        NSMutableDictionary* cellMargin = [self.cellMargin getMarginPt];
        NSString *cellMarginString = [self convertDic:cellMargin];
        margin = cellMarginString;
    }
    
    NSMutableArray<HTMLElement *>* contentFromSublist = [self.subList convertToHtml:margin];
    
    for (WrapperP* e in contentFromSublist) {
        [tc appendNode:e.outer];
    }
    
    return tc;
}

@end

