//
//  HH_ParaProperties.h
//  HwpxParser
//
//  Created by 인스웨이브 on 11/12/25.
//

#import <Foundation/Foundation.h>

@class HH_ParaPr;

NS_ASSUME_NONNULL_BEGIN

@interface HH_ParaProperties : NSObject

@property(strong, nonnull) NSString *itemCnt;
@property(strong, nonnull) HH_ParaPr *paraPr;
@property(strong, nonnull) NSMutableArray<HH_ParaPr*> *contents;

@end

NS_ASSUME_NONNULL_END
