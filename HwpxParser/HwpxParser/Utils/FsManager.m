//
//  FsManager.m
//  HwpxParser
//
//  Created by WonsangHwang on 11/7/25.
//

#import "FsManager.h"

@implementation FsManager

+(BOOL)writeFileAtPath:(nonnull NSString *)path withData:(nonnull NSData*)data;
{
    NSFileManager* fileManager = [NSFileManager defaultManager];
    return [fileManager createFileAtPath:path contents:data attributes:NULL];
}

+ (NSData*)loadFile:(NSString *)path
{
    NSFileManager* fileManager = [NSFileManager defaultManager];
    
    return NULL;
}

+ (NSString *)getCurrentFolderPath
{
    NSFileManager* fileManager = [NSFileManager defaultManager];
    return [fileManager currentDirectoryPath];
}

+ (NSString *)getFileExtensionInDirectory:(NSString *)directoryPath fileName:(NSString *)fileName
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error = nil;

    // 디렉토리 내의 모든 파일 목록 가져오기
    NSArray *files = [fileManager contentsOfDirectoryAtPath:directoryPath error:&error];

    if (error) {
        NSLog(@"Error reading directory: %@", error);
        return nil;
    }

    // 파일명과 일치하는 파일 찾기
    for (NSString *file in files) {
        NSString *fileNameWithoutExt = [file stringByDeletingPathExtension];
        if ([fileNameWithoutExt isEqualToString:fileName]) {
            return [file pathExtension];
        }
    }

    return nil; // 파일을 찾지 못한 경우
}

+ (NSString *)findFileRecursively:(NSString *)rootPath fileName:(NSString *)fileName
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSDirectoryEnumerator *enumerator = [fileManager enumeratorAtPath:rootPath];

    NSString *relativePath;
    while ((relativePath = [enumerator nextObject])) {
        NSString *nameWithoutExt = [[relativePath lastPathComponent] stringByDeletingPathExtension];
        if ([nameWithoutExt isEqualToString:fileName]) {
            return [rootPath stringByAppendingPathComponent:relativePath];
        }
    }
    return nil;
}

@end

