//
//  main.m
//  HwpParser
//
//  Created by Wonsang Hwang on 6/27/25.
//

#import <Foundation/Foundation.h>
// #import <ZipArchive.h>
#import "Logger.h"
#import "Lib/XMLReader.h"
#import "XMLParser.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *inputPAth = @"/Users/hwangwonsang/Desktop/git/hwpxParser/HwpParser/HwpParser/Input/test.hwpx";
        NSString *outputPath = @"/Users/hwangwonsang/Desktop/git/hwpxParser/HwpParser/HwpParser/Output";
        NSString *htmlPath = @"/Users/hwangwonsang/Desktop/git/hwpxParser/HwpParser/HwpParser/Html";
        
        NSString *header = [outputPath stringByAppendingString:@"/Contents/header.xml"];
        NSString *section = [outputPath stringByAppendingString:@"/Contents/section0.xml"];
        NSString *content = [outputPath stringByAppendingString:@"/Contents/content.hpf"];
        
        NSURL *headerURL = [NSURL fileURLWithPath:header];
        NSURL *contentURL = [NSURL fileURLWithPath:content];
        NSURL *sectionURL = [NSURL fileURLWithPath:section];
        NSData *headerData = [NSData dataWithContentsOfURL:sectionURL];

        NSError *error = nil;

        XMLParser *parser = [[XMLParser alloc] init];
        NSDictionary *dic = [parser parseXMLFile:sectionURL];
        
        
//        NSDictionary *head = [dic objectForKey:@"head"];
//        NSDictionary *refList = [head objectForKey:@"refList"];
//        NSDictionary *fontfaces = [refList objectForKey:@"fontfaces"];
        
        
        
        
        
        
        
    }
    return 0;
}
