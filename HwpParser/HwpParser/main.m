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
#import "TestCls.h"
#import "Bouncer.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        TestCls *test = [[TestCls alloc] init];
        [test setCheck:@"fff"];
        id result = [test filterNotNull];
        NSLog(@"%@", result);
        
//        NSString *path = @"/Users/hwangwonsang/Desktop/git/hwpxParser/HwpParser/HwpParser/Temper/Table.xml";
//    
//        XMLParser *parser = [XMLParser new];
//        NSMutableArray *dic = [parser parseXMLFile:path];
//        
//        NSLog(@"%@", dic  );
//        
//        HTMLDocument *doc = [[HTMLDocument alloc] init];
//        
//        HTMLElement *html = [[HTMLElement alloc] initWithTagName:@"html"];
//        HTMLElement *head = [[HTMLElement alloc] initWithTagName:@"head"];
//        HTMLElement *title = [[HTMLElement alloc] initWithTagName:@"title"];
//        [title setTextContent:@"Testing Attention Plz"];
//        HTMLElement *charset = [[HTMLElement alloc] initWithTagName:@"meta" attributes:@{@"charset" : @"utf-8"}];
//        HTMLElement *body = [[HTMLElement alloc] initWithTagName:@"body"];
//        
//        HTMLElement *h1 = [[HTMLElement alloc] initWithTagName:@"h1"];
//        [h1 setTextContent:@"Hello World!"];
//        
//        HTMLElement *p = [[HTMLElement alloc] initWithTagName:@"p"];
//        [p setTextContent:@"go fuck your self, 안녕."];
//        
//        [head appendNode:title];
//        [head appendNode:charset];
//        [body appendNode:h1];
//        [body appendNode:p];    
//        [html appendNode:head];
//        [html appendNode:body];
//        [doc appendNode:html];
//        
//        NSString *htmlString = [doc outerHTML];
//        NSLog(@"%@", htmlString);
//        
//        NSString *filePath = [@"~/Desktop/test.html" stringByExpandingTildeInPath];
//        [htmlString writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
//        
//        NSLog(@"HTML file saved to: %@", filePath);
//        
//        [[NSWorkspace sharedWorkspace] openFile:filePath withApplication:@"Safari"];

    }
    return 0;
}
