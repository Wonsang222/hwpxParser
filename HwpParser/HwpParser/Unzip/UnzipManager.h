//
//  UnzipManager.h
//  HwpParser
//
//  Created by Wonsang Hwang on 6/27/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UnzipManager : NSObject
+(BOOL) unzipHwpx:(NSString*) inputPath;
@end

NS_ASSUME_NONNULL_END
