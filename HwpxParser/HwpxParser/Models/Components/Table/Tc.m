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
    HTMLElement* tc = [[HTMLElement alloc] initWithTagName:@"td"];
    NSString *relative = @"position:relative; ";
    [tc setAttributes:[@{
        @"style": relative
    }mutableCopy]];
    
    NSString *margin = marin;
    
    if (![self.hasMargin isEqualTo:@"0"]) {
        // table 태그의 패딩을 사용  -> contents 로 넘김- > sublist
        marin = NULL;
    }
    
    NSMutableArray<HTMLElement *>* contentFromSublist = [self.subList convertToHtml:margin];
    
    for (WrapperP* e in contentFromSublist) {
        [tc appendNode:e.outer];
    }
    
    return tc;
}

@end

