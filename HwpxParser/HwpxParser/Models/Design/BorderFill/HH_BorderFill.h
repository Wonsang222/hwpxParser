//
//  HH_BorderFill.h
//  HwpxParser
//
//  Created by 인스웨이브 on 11/11/25.
//

#import <Foundation/Foundation.h>

@class HH_Slash;
@class HH_BackSlash;
@class HH_LeftBorder;
@class HH_RightBorder;
@class HH_TopBorder;
@class HH_BottomBorder;
@class HH_Diagonal;

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

@end

NS_ASSUME_NONNULL_END
