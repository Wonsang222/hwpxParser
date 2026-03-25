//
//  Sec.m
//  HwpxParser
//
//  Created by Wonsang Hwang on 8/15/25.
//

#import "Sec.h"
#import "../Paragraph/Paragraph.h"
#import "../../../Extensions/NSObject+ParsingHelper.h"
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

-(NSMutableArray<HTMLElement *> *)converToHtml
{
    NSMutableArray<HTMLElement*>* result = [[NSMutableArray alloc]init];
    // paper
    NSMutableDictionary* registeredPaperAtt;
    HTMLElement* targetPaper;
    
    for (Paragraph* p in self.paragraph) {
        // 바탕이 되는 페이지 css 데이터
        if ([p hasSecPr]) {
            registeredPaperAtt = [p getP];
        }
        // line의 시작점이 page에서 0일때, 새로운 페이지 div 를 만들어서 바탕이 되는 페이지 css데이터를 입히고 result 배열로
        if ([p isNewPage]) {
            targetPaper = [[HTMLElement alloc] initWithTagName:@"div"];
            NSMutableDictionary* att = [self createAttribute:registeredPaperAtt];
            [targetPaper setAttributes:att];
            [result addObject:targetPaper];
        }
        // paragraph
//        NSMutableArray<HTMLElement*>* paragraphs = [p convertParagraphWithHead:self.head];
        
//        for (HTMLElement* elem in paragraphs) {
//            [targetPaper appendNode:elem];
//        }
        
        NSMutableArray<HTMLElement*>* paragraphs = [p];
        
    }
    
    HTMLElement* lastObj = [result lastObject];
    if (targetPaper != lastObj) {
        [result addObject:targetPaper];
    }
    return result;
}

@end

NS_ASSUME_NONNULL_END

