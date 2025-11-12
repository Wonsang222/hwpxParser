//
//  HH_TabProperties.h
//  HwpxParser
//
//  Created by 인스웨이브 on 11/12/25.
//

#import <Foundation/Foundation.h>

@class HH_TabPr;

NS_ASSUME_NONNULL_BEGIN

@interface HH_TabProperties : NSObject

@property(strong, nonnull) NSString *itemCnt;
@property(strong, nonnull) HH_TabPr *tabPr;
@property(strong, nonnull) NSMutableArray<HH_TabPr*> *contents;

@end

NS_ASSUME_NONNULL_END
