//
//  HH_CharPr.h
//  HwpxParser
//
//  Created by 인스웨이브 on 11/12/25.
//

#import <Foundation/Foundation.h>

@class HH_FontRef;
@class HH_Ratio;
@class HH_Spacing;
@class HH_RelSz;
@class HH_Offset;
@class HH_Underline;
@class HH_Strikeout;
@class HH_Outline;
@class HH_Shadow;

NS_ASSUME_NONNULL_BEGIN

@interface HH_CharPr : NSObject

@property(strong, nonnull) NSString *identification;
@property(strong, nonnull) NSString *height;
@property(strong, nonnull) NSString *textColor;
@property(strong, nonnull) NSString *shadeColor;
@property(strong, nonnull) NSString *useFontSpace;
@property(strong, nonnull) NSString *useKerning;
@property(strong, nonnull) NSString *symMark;
@property(strong, nonnull) NSString *borderFillIDRef;

@property(strong, nullable) HH_FontRef *fontRef;
@property(strong, nullable) HH_Ratio *ratio;
@property(strong, nullable) HH_Spacing *spacing;
@property(strong, nullable) HH_RelSz *relSz;
@property(strong, nullable) HH_Offset *offset;
@property(strong, nullable) HH_Underline *underline;
@property(strong, nullable) HH_Strikeout *strikeout;
@property(strong, nullable) HH_Outline *outline;
@property(strong, nullable) HH_Shadow *shadow;

@end

NS_ASSUME_NONNULL_END
