//
//  FsManager.m
//  HwpxParser
//
//  Created by 인스웨이브 on 11/7/25.
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

@end

