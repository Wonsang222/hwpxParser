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


#import "./RenderingManager/RenderingManager.h"

@import HTMLKit;

NSString* base;

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        base = [NSString stringWithUTF8String:__FILE__];
        NSString *base1 = [base stringByDeletingLastPathComponent];
        NSString *resultPath = [base1 stringByAppendingPathComponent:@"result"];
        NSString* fileName = [resultPath stringByAppendingPathComponent:@"test"];
        NSString* fileExt = [fileName stringByAppendingPathExtension:@"html"];
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"Table" ofType:@"xml"];
        XMLParser *parser = [XMLParser new];
        
        // Sec model
        NSMutableArray *models = [parser parseXMLFile:path];
        
        // paragraph 그리기
        Sec *targetSec = [models firstObject];
    
        HTMLDocument* doc = [RenderingManager buildHTMLDocument];
        NSError* error = nil;

        if (!targetSec) {
            NSLog(@"noShit");
            exit(0);
        }

        NSMutableArray<HTMLElement*>* sections = [targetSec converToHtml];

        for (HTMLElement* section in sections) {
            [[doc body] appendNode:section];
        }

        // HTML 생성 후에 문자열로 변환
        NSString* outer = [doc outerHTML];
        [outer writeToFile:fileExt atomically:YES encoding:NSUTF8StringEncoding error:&error];
        
        if (error) {
          NSLog(@"errrrr");
            exit(0);
        }
        
        
        
        [[NSWorkspace sharedWorkspace] openFile:fileExt withApplication:@"Safari"];
    }
    return 0;
}
