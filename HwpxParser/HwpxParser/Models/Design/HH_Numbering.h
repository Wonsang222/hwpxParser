//
//  HH_Numbering.h
//  HwpxParser
//
//  Created by 인스웨이브 on 11/12/25.
//

#import <Foundation/Foundation.h>

@class HH_ParaHead;

NS_ASSUME_NONNULL_BEGIN

@interface HH_Numbering : NSObject

@property(strong, nonnull) NSString *identification;
@property(strong, nonnull) NSString *start;
@property(strong, nonnull) NSMutableArray<HH_ParaHead*> *paraHeads;

@end

NS_ASSUME_NONNULL_END
