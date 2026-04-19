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
#import "../../MarginSender.h"
#import "../../Design/HH_Head.h"
@import HTMLKit;

extern HH_Head *head;

@implementation Tc

- (HTMLElement *)convertToHtml:(MarginSender *)marin
{
    // marin == tbl로 부터 넘어온 마진 데이터
    HTMLElement* tc = [[HTMLElement alloc] initWithTagName:@"td"];
    // cellSize String
    NSString *relative = @"position:relative; ";
    NSMutableDictionary *size = [self.cellSz getSizePt];
    NSString *sizeString = [self convertDic:size];
    
    NSDictionary *border = [head getBorderFill:self.borderFillIDRef];
    NSString *borderString = [self convertDic:border];

    MarginSender *finalMargin;
    NSString *relativeWithSize = [[[relative stringByAppendingString:@"box-sizing:border-box; "] stringByAppendingString:sizeString] stringByAppendingString:borderString];
    
    if ([self.hasMargin isEqualTo:@"0"]) {
        // 고유의 cell margin을 사용 안한다
        finalMargin = marin;
    } else {
        NSMutableDictionary* cellMargin = [self.cellMargin getMarginPt];
        MarginSender *margin = [MarginSender new];
        margin.top = cellMargin[@"top"];
        margin.left = cellMargin[@"left"];
        finalMargin = margin;
    }
    
    [tc setAttributes:[@{
        @"style": relativeWithSize
    }mutableCopy]];
    
    NSMutableArray<HTMLElement *>* contentFromSublist = [self.subList convertToHtml:finalMargin];

    NSString *vertAlign = self.subList.vertAlign;
    if ([vertAlign isEqualToString:@"CENTER"]) {
        HTMLElement *alignDiv = [[HTMLElement alloc] initWithTagName:@"div"];
        [alignDiv setAttributes:[@{
            @"style": @"display:flex; align-items:center; width:100%; height:100%;"
        } mutableCopy]];
        for (WrapperP* e in contentFromSublist) {
            [alignDiv appendNode:e.outer];
        }
        [tc appendNode:alignDiv];
    } else {
        for (WrapperP* e in contentFromSublist) {
            [tc appendNode:e.outer];
        }
    }
    
    return tc;
}

@end

