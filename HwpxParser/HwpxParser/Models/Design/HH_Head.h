//
//  HH_Head.h
//  HwpxParser
//
//  Created by 인스웨이브 on 11/11/25.
//

#import <Foundation/Foundation.h>
@class HH_BeginNum;
@class HH_RefList;

NS_ASSUME_NONNULL_BEGIN

@interface HH_Head : NSObject
@property(strong) HH_BeginNum * beginNum;
@property(strong) HH_RefList * refList;
@end

NS_ASSUME_NONNULL_END
