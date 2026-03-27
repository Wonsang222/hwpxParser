//
//  HH_ParaHead.h
//  HwpxParser
//
//  Created by WonsangHwang on 11/12/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HH_ParaHead : NSObject

@property(strong) NSString *start;
@property(strong) NSString *level;
@property(strong) NSString *align;
@property(strong) NSString *useInstWidth;
@property(strong) NSString *autoIndent;
@property(strong) NSString *widthAdjust;
@property(strong) NSString *textOffsetType;
@property(strong) NSString *textOffset;
@property(strong) NSString *numFormat;
@property(strong) NSString *charPrIDRef;
@property(strong) NSString *checkable;

@end

NS_ASSUME_NONNULL_END
