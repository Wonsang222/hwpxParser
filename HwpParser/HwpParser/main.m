//
//  main.m
//  HwpParser
//
//  Created by Wonsang Hwang on 6/27/25.
//

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>
// #import <ZipArchive.h>
#import "Logger.h"
#import "XMLParser.h"
#import "HTMLElement.h"
#import "HTMLDocument.h"
#import "Model/Table/Base/Common/Paragraph.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
//        NSString *path = @"/Users/hwangwonsang/Desktop/git/hwpxParser/HwpParser/HwpParser/Temper/Para.xml";
        
        NSString* companyPath = [@"~/Desktop/MySpace/HwpParser/HwpParser/Temper/Para.xml" stringByExpandingTildeInPath];
    
        XMLParser *parser = [XMLParser new];
        NSMutableArray *result = [parser parseXMLFile:companyPath];
        
        Paragraph* pp = (Paragraph*) [result firstObject];
        
        NSLog(@"123 : %@", pp);

//        HTMLElement* pElem = [pp convertToHtml];
        
        
        
//        HTMLDocument *doc = [[HTMLDocument alloc] init];
//        
//        HTMLElement *html = [[HTMLElement alloc] initWithTagName:@"html"];
//        [html setAttributes: [@{ @"lang" : @"ko"} mutableCopy]];
//        HTMLElement *head = [[HTMLElement alloc] initWithTagName:@"head"];
//        HTMLElement *title = [[HTMLElement alloc] initWithTagName:@"title"];
//        [title setTextContent:@"Testing Attention Plz"];
//        HTMLElement *style = [[HTMLElement alloc] initWithTagName:@"style"];
//        HTMLElement *charset = [[HTMLElement alloc] initWithTagName:@"meta" attributes:@{@"charset" : @"utf-8"}];
//        HTMLElement *body = [[HTMLElement alloc] initWithTagName:@"body"];
//        
//        [head appendNode:title];
//        [head appendNode:charset];
//        [head appendNode:style];
//        [html appendNode:head];
//        [html appendNode:body];
//        [doc appendNode:html];
//        
//        [[doc body] appendNode:pElem];
//
//        NSString *filePath = [@"~/Desktop/html/test.html" stringByExpandingTildeInPath];
//        [[doc outerHTML] writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
////
////        NSLog(@"HTML file saved to: %@", filePath);
////        
//        [[NSWorkspace sharedWorkspace] openFile:filePath withApplication:@"Safari"];    
    }
    return 0;
}
