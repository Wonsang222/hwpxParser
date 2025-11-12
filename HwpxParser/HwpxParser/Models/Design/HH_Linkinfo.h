//
//  HH_Linkinfo.h
//  HwpxParser
//
//  Created by 인스웨이브 on 11/12/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HH_Linkinfo : NSObject

@property(strong, nonnull) NSString *path;
@property(strong, nonnull) NSString *pageInherit;
@property(strong, nonnull) NSString *footnoteInherit;

@end

NS_ASSUME_NONNULL_END
