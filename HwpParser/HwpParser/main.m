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
#import "Model/Table/Base/Common/Run/SecPr/Grid.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *path = @"/Users/hwangwonsang/Desktop/git/hwpxParser/HwpParser/HwpParser/Temper/Table.xml";
        
        NSString *clsName = @"Grid";
        
        Class cls = NSClassFromString(clsName);
        id runner = [[cls alloc] init];
        
        if (runner) {
            NSLog(@"!");
        } else {
            NSLog(@"?");
        }
        
        
        NSDictionary *test = @{
            @"lineGrid" : @"wonsang",
            @"charGrid": @"14",
        };
        
        [runner setValuesForKeysWithDictionary:test];
        

        NSString *nu = NSStringFromClass([runner class]);
        NSLog(@"fin : %@", nu);

//
//        XMLParser *parser = [XMLParser new];
//        NSDictionary *dic = [parser parseXMLFile:target];
//
//        NSError *error = nil;
        
//        NSString *testName = @"HwpUnit";
//        Class className = NSClassFromString(testName);
//        
//        if (className) {
//            NSLog(@"HwpUnit 클래스 찾음: %@", className);
//            id instance = [[className alloc] init];
//            NSLog(@"HwpUnit 인스턴스 생성: %@", instance);
//        } else {
//            NSLog(@"HwpUnit 클래스를 찾을 수 없음");
//        }
//        

    }
    return 0;
}
