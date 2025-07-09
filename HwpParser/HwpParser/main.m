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
    
        XMLParser *parser = [XMLParser new];
        NSArray *dic = [parser parseXMLFile:path];
    }
    return 0;
}
