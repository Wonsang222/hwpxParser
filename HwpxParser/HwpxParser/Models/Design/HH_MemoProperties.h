//
//  HH_MemoProperties.h
//  HwpxParser
//
//  Created by 인스웨이브 on 11/12/25.
//

#import <Foundation/Foundation.h>

@class HH_MemoPr;

NS_ASSUME_NONNULL_BEGIN

@interface HH_MemoProperties : NSObject

@property(strong, nonnull) NSString *itemCnt;
@property(strong, nonnull) HH_MemoPr *memoPr;
@property(strong, nonnull) NSMutableArray<HH_MemoPr*> *contents;

@end

NS_ASSUME_NONNULL_END
