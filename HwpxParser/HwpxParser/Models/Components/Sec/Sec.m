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

-(instancetype)init
{
    self = [super init];
    [self initializeWithMutableArray];
    return self;
}

-(NSMutableArray<HTMLElement *> *)converToHtml
{
    NSMutableArray<HTMLElement*>* result = [[NSMutableArray alloc]init];
    HTMLElement* registeredPaper;
    
    for (Paragraph* p in self.paragraph) {
        if ([p hasSecPr]) {
            registeredPaper = [p ]
        }
    }
    
    
    return result;
}

-(HTMLElement*)convertHtml2
{
    HTMLElement* paper;

    for (Paragraph* p in paragraph) {
        // secPr인가
        
        
        
        
        
        
        // outer lineseg vertpos == 0 means it is on the new page
        
        
        
//        if ([p isNewPage]) {
//            if (!paper) {
//                paper =
//            }
//            
////            HTMLDocument* doc = [self createHtml];
////            currentTarget = [doc body];
////            [docs addObject:doc];
//        }
        
        // outerParagraph 작업
        
        
        
        
        
//        HTMLElement* elem = [p convertToHtml];
//        if (!paragraphs) {
//            paragraphs = elem;
//            continue;
//        }
//        [paragraphs appendNode:elem];
    }
    
    return paper;
}

-(HTMLDocument*)createHtml
{
    HTMLDocument *doc = [[HTMLDocument alloc] init];
    
    HTMLElement *html = [[HTMLElement alloc] initWithTagName:@"html"];
    [html setAttributes: [@{ @"lang" : @"ko"} mutableCopy]];
    HTMLElement *head = [[HTMLElement alloc] initWithTagName:@"head"];
    HTMLElement *title = [[HTMLElement alloc] initWithTagName:@"title"];
    [title setTextContent:@"HWPX Converter"];
    HTMLElement *style = [[HTMLElement alloc] initWithTagName:@"style"];
    HTMLElement *charset = [[HTMLElement alloc] initWithTagName:@"meta" attributes:@{@"charset" : @"utf-8"}];
    HTMLElement *body = [[HTMLElement alloc] initWithTagName:@"body"];
    
    [head appendNode:title];
    [head appendNode:charset];
    [head appendNode:style];
    [html appendNode:head];
    [html appendNode:body];
    [doc appendNode:html];
    return doc;
}
@end

NS_ASSUME_NONNULL_END
