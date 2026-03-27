//
//  UnzipManager.h
//  HwpxParser
//
//  Created by WonsangHwang on 8/12/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UnzipManager : NSObject
+(BOOL) unzipHwpx:(NSString*) inputPath;
@end

NS_ASSUME_NONNULL_END
