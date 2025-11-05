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
    HTMLElement* targetPaper;
    
    for (Paragraph* p in self.paragraph) {
        if ([p hasSecPr]) {
            registeredPaper = NULL;
            registeredPaper = [p getP];
        }
        
        if ([p isNewPage]) {
            targetPaper = [registeredPaper mutableCopy];
            [result addObject:targetPaper];
        }
        
        // paragraph
        
//        HTMLElement* paragraph = [p ]
        
        
        
        // Content append
        
    }
    
    HTMLElement* lastObj = [result lastObject];
    if (targetPaper != lastObj) {
        [result addObject:targetPaper];
    }
    return result;
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
