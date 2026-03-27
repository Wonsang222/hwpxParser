//
//  HH_Numberings.h
//  HwpxParser
//
//  Created by WonsangHwang on 11/12/25.
//

#import <Foundation/Foundation.h>
@class HH_Numbering;

NS_ASSUME_NONNULL_BEGIN

@interface HH_Numberings : NSObject

@property(strong, nonnull) NSString *itemCnt;
@property(strong, nonnull) HH_Numbering *numbering;
@property(strong, nonnull) NSMutableArray<HH_Numbering*> *contents;

@end

NS_ASSUME_NONNULL_END
