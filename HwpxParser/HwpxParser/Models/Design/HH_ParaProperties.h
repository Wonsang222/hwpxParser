//
//  HH_ParaProperties.h
//  HwpxParser
//
//  Created by WonsangHwang on 11/12/25.
//

#import <Foundation/Foundation.h>

@class HH_ParaPr;

NS_ASSUME_NONNULL_BEGIN

@interface HH_ParaProperties : NSObject

@property(strong, nonnull) NSString *itemCnt;
@property(strong, nonnull) HH_ParaPr *paraPr;
@property(strong, nonnull) NSMutableArray<HH_ParaPr*> *contents;

-(NSDictionary*)getParaPr:(NSString*)num;

@end

NS_ASSUME_NONNULL_END
