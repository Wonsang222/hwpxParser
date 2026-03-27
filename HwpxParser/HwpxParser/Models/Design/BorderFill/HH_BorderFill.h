//
//  HH_BorderFill.h
//  HwpxParser
//
//  Created by WonsangHwang on 11/11/25.
//

#import <Foundation/Foundation.h>

@class HH_Slash;
@class HH_BackSlash;
@class HH_LeftBorder;
@class HH_RightBorder;
@class HH_TopBorder;
@class HH_BottomBorder;
@class HH_Diagonal;
@class HH_FillBrush;

NS_ASSUME_NONNULL_BEGIN

@interface HH_BorderFill : NSObject

@property(strong, nonnull) NSString* identification;
@property(strong, nonnull) NSString* threeD;
@property(strong, nonnull) NSString* shadow;
@property(strong, nonnull) NSString* centerLine;
@property(strong, nonnull) NSString* breakCellSeparateLine;

@property(strong, nullable) HH_Slash * slash;
@property(strong, nullable) HH_BackSlash * backSlash;
@property(strong, nullable) HH_LeftBorder * leftBorder;
@property(strong, nullable) HH_RightBorder * rightBorder;
@property(strong, nullable) HH_TopBorder * topBorder;
@property(strong, nullable) HH_BottomBorder * bottomBorder;
@property(strong, nullable) HH_Diagonal * diagonal;
@property(strong, nullable) HH_FillBrush *fillBrush;

-(NSDictionary*)getBorderFill;

@end

NS_ASSUME_NONNULL_END
