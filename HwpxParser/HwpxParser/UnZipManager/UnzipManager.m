//
//  UnzipManager.m
//  HwpxParser
//
//  Created by 인스웨이브 on 8/12/25.
//

#import "UnzipManager.h"
#import <ZipArchive.h>

NS_ASSUME_NONNULL_BEGIN

@implementation UnzipManager
+ (BOOL)unzipHwpx:(NSString *)inputPath
{
    // output에 파일 있으면
    NSString *outputPath = @"";
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    BOOL isExist = [fileManager fileExistsAtPath:outputPath];
    
    if (isExist) {
        // 지우기
        [fileManager removeItemAtPath:outputPath error:nil];
    }
    NSString *output = @"";
    return [SSZipArchive unzipFileAtPath:inputPath toDestination:output];
}
@end

NS_ASSUME_NONNULL_END
