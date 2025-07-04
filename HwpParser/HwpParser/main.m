//
//  main.m
//  HwpParser
//
//  Created by Wonsang Hwang on 6/27/25.
//

#import <Foundation/Foundation.h>
// #import <ZipArchive.h>
#import "Logger.h"
#import "XMLParser.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // 프로젝트 소스 디렉토리 기준 상대 경로
        NSString *projectPath = @"/Users/inswave/Desktop/MySpace/HwpParser";
        NSString *target = [projectPath stringByAppendingPathComponent:@"HwpParser/Input/Table/Table.xml"];
        
        NSLog(@"Using relative path from project root: %@", target);
        
        // 파일이 존재하는지 확인
        if ([[NSFileManager defaultManager] fileExistsAtPath:target]) {
            NSLog(@"File exists at: %@", target);
        } else {
            NSLog(@"File not found at: %@", target);
        }
        
//        XMLParser *parser = [XMLParser new];
//        NSDictionary *dic = [parser parseXMLFile:target];
//
//        NSError *error = nil;
        
        NSString *testName = @"HwpUnit";
        Class className = NSClassFromString(testName);
        
        if (className) {
            NSLog(@"HwpUnit 클래스 찾음: %@", className);
            id instance = [[className alloc] init];
            NSLog(@"HwpUnit 인스턴스 생성: %@", instance);
        } else {
            NSLog(@"HwpUnit 클래스를 찾을 수 없음");
        }
        

    }
    return 0;
}
