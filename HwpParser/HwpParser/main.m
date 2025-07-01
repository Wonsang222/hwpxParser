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
        
        NSString *target = @"/Users/hwangwonsang/Desktop/git/hwpxParser/HwpParser/HwpParser/Input/Table/Table.xml";
        NSURL *url = [NSURL fileURLWithPath:target];
        
        XMLParser *parser = [XMLParser new];
        NSDictionary *dic = [parser parseXMLFile:target];

        NSError *error = nil;

    }
    return 0;
}
