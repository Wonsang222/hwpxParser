//
//  UnzipManager.h
//  HwpxParser
//
//  Created by 인스웨이브 on 8/12/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UnzipManager : NSObject
+(BOOL) unzipHwpx:(NSString*) inputPath;
@end

NS_ASSUME_NONNULL_END
