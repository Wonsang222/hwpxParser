//
//  Draw.m
//  HwpParser
//
//  Created by 인스웨이브 on 7/17/25.
//

#import "Draw.h"

NS_ASSUME_NONNULL_BEGIN

@implementation Draw
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
    HTMLElement *tbl = [[HTMLElement alloc] initWithTagName:@"table"];
    // reference니까 되것지?
//    for ( int i = 0 ; i < row ; i++ ) {
//        HTMLElement *tr = [[HTMLElement alloc] initWithTagName:@"tr"];
//        [tbl appendNode:tr];
//        
//        for ( int i = 0 ; i < col ; i++ ) {
//            HTMLElement *th = [[HTMLElement alloc] initWithTagName:@"th"];
//            [tr appendNode:th];
//        }
    
    
//    }
    
   
        
    return tbl;
}
@end

NS_ASSUME_NONNULL_END
