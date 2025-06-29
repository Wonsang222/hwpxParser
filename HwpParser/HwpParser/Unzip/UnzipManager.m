//
//  UnzipManager.m
//  HwpParser
//
//  Created by Wonsang Hwang on 6/27/25.
//

#import "UnzipManager.h"
#import <ZipArchive.h>

@implementation UnzipManager
+ (BOOL)unzipHwpx:(NSString *)inputPath
{
    // output에 파일 있으면
    if (true) {
        // 지우기
    }
    NSString *output = @"";
    return [SSZipArchive unzipFileAtPath:inputPath toDestination:output];
}
@end

