//
//  FsManager.h
//  HwpxParser
//
//  Created by WonsangHwang on 11/7/25.
//

#import <Foundation/Foundation.h>

@interface FsManager : NSObject

+(BOOL)writeFileAtPath:(nonnull NSString *)path withData:(nonnull NSData*)data;
+(nullable NSData*)loadFile:(NSString*_Nonnull)path;
+(NSString*_Nonnull)getCurrentFolderPath;
+(nullable NSString*)getFileExtensionInDirectory:(NSString*_Nonnull)directoryPath fileName:(NSString*_Nonnull)fileName;
+(nullable NSString*)findFileRecursively:(NSString*_Nonnull)rootPath fileName:(NSString*_Nonnull)fileName;
@end

