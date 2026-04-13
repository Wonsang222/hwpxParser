//
//  main.m
//  HwpxParser
//
//  Created by WonsangHwang on 8/12/25.
//

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>
#import "XMLParser.h"
#import "./Models/Components/Sec/Sec.h"
#import "./Utils/FsManager.h"
#import "./Models/Design/HH_Head.h"
#import "./RenderingManager/RenderingManager.h"
#import "./Models/WrapperP.h"

@import HTMLKit;

NSString *base;
HH_Head *head;

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        base = [NSString stringWithUTF8String:__FILE__];
        NSString *base1 = [base stringByDeletingLastPathComponent];
        NSString *testPath = @"/TestFiles/Output/Contents/header.xml";
        NSString *path = [base1 stringByAppendingString:testPath];
        
        NSString *start = [NSString stringWithUTF8String:__FILE__];
        NSString *startP = [start stringByDeletingLastPathComponent];
        NSString *testPath2 = @"/TestFiles/Temp/Base.xml";
        NSString *path2 = [startP stringByAppendingString:testPath2];
        
        NSString *startS = [NSString stringWithUTF8String:__FILE__];
        NSString *ppp = [startS stringByDeletingLastPathComponent];
        NSString *resultPath = @"/test.html";
        NSString *resPath = [ppp stringByAppendingPathComponent:@"result"];
        NSString *finPath = [resPath stringByAppendingString: resultPath];
        
        __block NSMutableArray *heads = nil;
        __block NSArray *secs = nil;

        dispatch_group_t group = dispatch_group_create();
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);

        dispatch_group_async(group, queue, ^{
            XMLParser *parser = [[XMLParser alloc] initWithPart:@"header"];
            heads = [parser parseXMLFile:path];
        });

        dispatch_group_async(group, queue, ^{
            XMLParser *parser2 = [[XMLParser alloc] init];
            secs = [parser2 parseXMLFile:path2];
        });

        dispatch_group_wait(group, DISPATCH_TIME_FOREVER);

        HH_Head *innerHead = [heads firstObject];
        head = innerHead;

        Sec *sec = [secs firstObject];
        
        HTMLDocument* doc = [RenderingManager buildHTMLDocument];
        NSError* error = nil;
        
////        // paragraph 그리기
        ///
        if (!sec) {
            NSLog(@"noShit");
            exit(0);
        }

        NSMutableArray<WrapperP*>* sections = [sec converToHtml];

        for (WrapperP* section in sections) {
            [[doc body] appendNode:section.outer];
        }
        // HTML 생성 후에 문자열로 변환
        NSString* outer = [doc outerHTML];
        [outer writeToFile:finPath atomically:YES encoding:NSUTF8StringEncoding error:&error];
        
        if (error) {
          NSLog(@"errrrr");
            NSLog(@"%@", [error description]);
            exit(0);
        }
        [[NSWorkspace sharedWorkspace] openFile:finPath withApplication:@"Safari"];
    }
    return 0;
}
