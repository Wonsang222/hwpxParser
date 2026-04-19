//
//  RenderingManager.m
//  HwpxParser
//
//  Created by Wonsang Hwang on 8/15/25.
//

#import "RenderingManager.h"
@import HTMLKit;

NS_ASSUME_NONNULL_BEGIN

@implementation RenderingManager
+ (HTMLDocument *)buildHTMLDocument
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
    HTMLElement *script = [[HTMLElement alloc] initWithTagName:@"script" attributes:@{@"src" : @"../JS/justify.js", @"defer" : @""}];

    [head appendNode:title];
    [head appendNode:charset];
    [head appendNode:style];
    [html appendNode:head];
    [html appendNode:body];
    [body appendNode:script];
    [doc appendNode:html];
    return doc;
}

@end

NS_ASSUME_NONNULL_END
