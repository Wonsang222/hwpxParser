//
//  Sec.m
//  HwpxParser
//
//  Created by Wonsang Hwang on 8/15/25.
//

#import "Sec.h"
#import "../Paragraph/Paragraph.h"
#import "../../../Extensions/NSObject+ParsingHelper.h"
#import "../../WrapperP.h"
@import HTMLKit;

NS_ASSUME_NONNULL_BEGIN

@implementation Sec
@synthesize paragraph;
@synthesize head;

-(instancetype)init
{
    self = [super init];
    [self initializeWithMutableArray];
    return self;
}

-(NSMutableArray<WrapperP *> *)converToHtml
{
    NSMutableArray<WrapperP*>* result = [[NSMutableArray alloc]init];
    // paper
    NSMutableDictionary* registeredPaperAtt;
    WrapperP* targetPaper;
    
    for (Paragraph* p in self.paragraph) {
        // 바탕이 되는 페이지 css 데이터
        if ([p hasSecPr]) {
            registeredPaperAtt = [p getP];
        }
        // line의 시작점이 page에서 0일때, 새로운 페이지 div 를 만들어서 바탕이 되는 페이지 css데이터를 입히고 result 배열로
        if ([p isNewPage]) {
            HTMLElement *outerPaper = [[HTMLElement alloc] initWithTagName:@"div"];
            HTMLElement *innerPaper = [[HTMLElement alloc] initWithTagName:@"div"];
            // position이 relative이기 때문에 용지를 나타내는 div는 padding이 적용되지 않는다. -> 내부의 wrapper를 둬서 padding을 표현

            NSMutableDictionary* att = [self createAttribute:registeredPaperAtt];
            [outerPaper setAttributes:att];

            // innerPaper: outerPaper의 width/height에서 padding을 뺀 크기
            float paperWidth    = [[registeredPaperAtt[@"width"]          stringByReplacingOccurrencesOfString:@"pt" withString:@""] floatValue];
            float paperHeight   = [[registeredPaperAtt[@"height"]         stringByReplacingOccurrencesOfString:@"pt" withString:@""] floatValue];
            float paddingLeft   = [[registeredPaperAtt[@"padding-left"]   stringByReplacingOccurrencesOfString:@"pt" withString:@""] floatValue];
            float paddingRight  = [[registeredPaperAtt[@"padding-right"]  stringByReplacingOccurrencesOfString:@"pt" withString:@""] floatValue];
            float paddingTop    = [[registeredPaperAtt[@"padding-top"]    stringByReplacingOccurrencesOfString:@"pt" withString:@""] floatValue];
            float paddingBottom = [[registeredPaperAtt[@"padding-bottom"] stringByReplacingOccurrencesOfString:@"pt" withString:@""] floatValue];

            float innerWidth  = paperWidth  - paddingLeft - paddingRight;
            float innerHeight = paperHeight - paddingTop  - paddingBottom;

            NSMutableDictionary *innerPaperStyle = [@{
                @"position" : @"relative",
                @"width"    : [NSString stringWithFormat:@"%.2fpt", innerWidth],
                @"height"   : [NSString stringWithFormat:@"%.2fpt", innerHeight]
            } mutableCopy];
            NSMutableDictionary *innerPaperAtt = [self createAttribute:innerPaperStyle];
            [innerPaper setAttributes:innerPaperAtt];
            [outerPaper appendNode:innerPaper];

            WrapperP *wrapperP = [WrapperP new];
            wrapperP.outer = outerPaper;
            wrapperP.inner = innerPaper;
            targetPaper = wrapperP;
            [result addObject:targetPaper];
        }
        // paragraph == lineseg에 content를 담은 하나의 객체 <일단>
        NSMutableArray<WrapperP*> *contentsWithLineSeg = [p convertParagraphWithHead];
        
        for (WrapperP *content in contentsWithLineSeg) {
            [targetPaper.inner appendNode:content.outer];
        }
    }
    
    WrapperP* lastObj = [result lastObject];
    if (targetPaper != lastObj) {
        [result addObject:targetPaper];
    }
    return result;
}

@end

NS_ASSUME_NONNULL_END

