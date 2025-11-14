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
    NSMutableDictionary* registeredPaper;
    HTMLElement* targetPaper;
    
    for (Paragraph* p in self.paragraph) {
        
        if ([p hasSecPr]) {
            registeredPaper = [p getP];
        }
        
        if ([p isNewPage]) {
            targetPaper = [[HTMLElement alloc] initWithTagName:@"div"];
            NSMutableDictionary* att = [self createAttribute:registeredPaper];
            [targetPaper setAttributes:att];
            [result addObject:targetPaper];
        }
        // paragraph
        NSMutableArray<HTMLElement*>* paragraphs = [p convertParagraphWithHead:self.head];
//
//        for (HTMLElement* elem in paragraphs) {
//            [targetPaper appendNode:elem];
//        }
    }
    
    HTMLElement* lastObj = [result lastObject];
    if (targetPaper != lastObj) {
        [result addObject:targetPaper];
    }
    return result;
}

@end

NS_ASSUME_NONNULL_END

