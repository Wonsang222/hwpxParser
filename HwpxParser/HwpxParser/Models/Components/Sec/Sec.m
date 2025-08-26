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

-(NSMutableArray<HTMLDocument*>*)convertHtml
{
    NSMutableArray<HTMLDocument*> *docs = [[NSMutableArray alloc] init];
    
    HTMLElement* paperOrigin = [[self.paragraph firstObject] convertToPaper];
    // 복사해서 전달
    
    HTMLElement* currentTarget;
    
    for (Paragraph* p in paragraph) {
        // outer lineseg vertpos == 0 means it is on the new page
        if ([p isNewPage]) {
            HTMLDocument* doc = [self createHtml];
            currentTarget = [doc body];
            [docs addObject:doc];
        }
        
        // outerParagraph 작업
        
        
        
        
        
//        HTMLElement* elem = [p convertToHtml];
//        if (!paragraphs) {
//            paragraphs = elem;
//            continue;
//        }
//        [paragraphs appendNode:elem];
    }
    
    return docs;
}

-(HTMLDocument*)createHtml
{
    HTMLDocument *doc = [[HTMLDocument alloc] init];
    
    HTMLElement *html = [[HTMLElement alloc] initWithTagName:@"html"];
    [html setAttributes: [@{ @"lang" : @"ko"} mutableCopy]];
    HTMLElement *head = [[HTMLElement alloc] initWithTagName:@"head"];
    HTMLElement *title = [[HTMLElement alloc] initWithTagName:@"title"];
    [title setTextContent:@"Testing Attention Plz"];
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
