//
//  HH_CharProperties.h
//  HwpxParser
//
//  Created by 인스웨이브 on 11/12/25.
//

#import <Foundation/Foundation.h>

@class HH_CharPr;

NS_ASSUME_NONNULL_BEGIN

@interface HH_CharProperties : NSObject

@property(strong, nonnull) NSString *itemCnt;
@property(strong, nonnull) HH_CharPr *charPr;
@property(strong, nonnull) NSMutableArray<HH_CharPr*> *contents;

@end

NS_ASSUME_NONNULL_END
