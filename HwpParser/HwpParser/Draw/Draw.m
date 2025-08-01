//
//  Draw.m
//  HwpParser
//
//  Created by 인스웨이브 on 7/17/25.
//

#import "Draw.h"
#import "../Model/Table/Base/Common/Paragraph.h"

// 일단 paragraph 부터

@implementation Draw

+(NSString*)convertHwpunitToPt:(NSString*)hwpunit
{
    // hwpunit converter
    float unit = [hwpunit floatValue];
    float pt = unit / 100.0f;
    NSNumber* nsPt = [NSNumber numberWithFloat:pt];
    NSString* ptString = [nsPt stringValue];
    
    return [ptString stringByAppendingString:@"pt"];
}

+(HTMLDocument*)appendComponent:(HTMLElement*)element onDoc:(HTMLDocument*) doc
{
    HTMLElement* body = doc.body;
    [body appendNode:element];
    return doc;
}

+(HTMLDocument*)parseP:(Paragraph*)paragraph
{
    HTMLDocument* doc = [self createHtml];
    
    

    
    return doc;
}

+(HTMLElement*)createComponentWrapperDiv
{
    NSDictionary* att = @{
        @"margin" : @"0px",
        @"text-align" : @"justify"
    };
    return [[HTMLElement alloc] initWithTagName:@"div" attributes:att];
}




+(void)parseRun:(Run*)run withHtml:(HTMLDocument*)doc
{
    // 구역정보
    
    
    // draw
}

+(void)parseSecPr:(SecPr*)secPr
{
//    // secpr은 한개인가?
//    HTMLDocument* html = [self createHtml];
//    [html appendNode:mainDiv];
//    // container on main
//    HTMLElement* containerDiv = [self drawContainerDiv:secPr.pagePr];
//    [mainDiv appendNode:containerDiv];
    
    
    
    
}

// 이 태그에 추가해야함.
+(HTMLElement*)createContainerDiv:(PagePr*)pagePr
{
    // 용지 사이즈를 정의하는 Div
    HTMLElement* div = [[HTMLElement alloc] initWithTagName:@"div"];
    
    NSMutableDictionary* att = [@{
        @"height" : [self convertHwpunitToPt:pagePr.height],
        @"width" : [self convertHwpunitToPt:pagePr.width],
        @"padding-top" : [self convertHwpunitToPt:pagePr.margin.top],
        @"padding-bottom" : [self convertHwpunitToPt:pagePr.margin.bottom],
        @"padding-left" : [self convertHwpunitToPt:pagePr.margin.left],
        @"padding-right" : [self convertHwpunitToPt:pagePr.margin.right],
    } mutableCopy];
    
    [div setAttributes:att];
    return div;
}

+(HTMLDocument *) createHtml
{
    HTMLDocument *doc = [[HTMLDocument alloc] init];
    
    HTMLElement *html = [[HTMLElement alloc] initWithTagName:@"html"];
    HTMLElement *head = [[HTMLElement alloc] initWithTagName:@"head"];
    HTMLElement *title = [[HTMLElement alloc] initWithTagName:@"title"];
    [title setTextContent:@"Testing Attention Plz"];
    HTMLElement *charset = [[HTMLElement alloc] initWithTagName:@"meta" attributes:@{@"charset" : @"utf-8"}];
    HTMLElement *body = [[HTMLElement alloc] initWithTagName:@"body"];
    
    [head appendNode:title];
    [head appendNode:charset];
    [html appendNode:head];
    [html appendNode:body];
    [doc appendNode:html];
    
    return doc;
}

+ (HTMLElement *)createTbl:(Tbl *)table
{
    HTMLElement *tbl = [[HTMLElement alloc] initWithTagName:@"table" attributes:@{@"style" : @"border-collapse: collapse;"}];
    
    NSString* height = [self convertHwpunitToPt:table.sz.height];
    NSString* width = [self convertHwpunitToPt:table.sz.width];
    
    
    
   
        
    return tbl;
}


//-(HTMLElement *) parseSubList: (SubList*) sub
//{
//    // sublist는 paragraph container it seeems like nothing to raise
//    for (id paragraph in sub.paragraph) {
//       
//    }
//}
//
//-(HTMLElement *) parseSubList: (Paragraph*) paragraph
//{
//    // Run Container
//  // null이 아닌 객체.
//    
//}

@end
