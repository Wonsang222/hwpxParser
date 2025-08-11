//
//  NSObject+HtmlBuilder.m
//  HwpParser
//
//  Created by 인스웨이브 on 8/11/25.
//

#import "NSObject+HtmlBuilder.h"

@implementation NSObject (HtmlBuilder)
-(HTMLDocument*)buildHtml
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
