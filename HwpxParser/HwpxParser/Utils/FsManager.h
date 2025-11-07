//
//  FsManager.h
//  HwpxParser
//
//  Created by 인스웨이브 on 11/7/25.
//

#import <Foundation/Foundation.h>

@interface FsManager : NSObject

+(BOOL)writeFileAtPath:(nonnull NSString *)path withData:(nonnull NSData*)data;
+(nullable NSData*)loadFile:(NSString*_Nonnull)path;
+(NSString*_Nonnull)getCurrentFolderPath;
@end

