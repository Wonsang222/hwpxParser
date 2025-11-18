//
//  main.m
//  HwpxParser
//
//  Created by 인스웨이브 on 8/12/25.
//

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>
#import "XMLParser.h"
#import "./Models/Components/Sec/Sec.h"
#import "./Utils/FsManager.h"
#import "./Models/Design/HH_Head.h"
#import "./RenderingManager/RenderingManager.h"

@import HTMLKit;

NSString *base;
HH_Head *head;

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        base = [NSString stringWithUTF8String:__FILE__];
        NSString *base1 = [base stringByDeletingLastPathComponent];
        NSString *testPath = @"/TestFiles/Temp/header.xml";
        NSString *path = [base1 stringByAppendingString:testPath];
        
        NSString *start = [NSString stringWithUTF8String:__FILE__];
        NSString *startP = [start stringByDeletingLastPathComponent];
        NSString *testPath2 = @"/TestFiles/Temp/Table.xml";
        NSString *path2 = [startP stringByAppendingString:testPath2];
        
        NSString *startS = [NSString stringWithUTF8String:__FILE__];
        NSString *ppp = [startS stringByDeletingLastPathComponent];
        NSString *resultPath = @"result/test.html";
        NSString *resPath = [ppp stringByAppendingString:resultPath];
        
        XMLParser *parser = [[XMLParser alloc] initWithPart:@"header"];

        NSMutableArray *heads = [parser parseXMLFile:path];
        HH_Head *innerHead = [heads firstObject];
        
        head = innerHead;
        
        XMLParser *parser2 = [[XMLParser alloc] init];
        NSArray *secs = [parser2 parseXMLFile:path2];
        Sec *sec = [secs firstObject];
        [sec setHead:innerHead];
        
//        HTMLDocument* doc = [RenderingManager buildHTMLDocument];
//        NSError* error = nil;
////        // paragraph 그리기
//        
//        if (!sec) {
//            NSLog(@"noShit");
//            exit(0);
//        }
//        
        NSMutableArray<HTMLElement*>* sections = [sec converToHtml];
//
//        for (HTMLElement* section in sections) {
//            [[doc body] appendNode:section];
//        }
//        // HTML 생성 후에 문자열로 변환
//        NSString* outer = [doc outerHTML];
//        [outer writeToFile:resPath atomically:YES encoding:NSUTF8StringEncoding error:&error];
//        
//        if (error) {
//          NSLog(@"errrrr");
//            exit(0);
//        }
//        [[NSWorkspace sharedWorkspace] openFile:resPath withApplication:@"Safari"];
    }
    return 0;
}
