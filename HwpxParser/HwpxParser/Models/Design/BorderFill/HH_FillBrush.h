//
//  HH_FillBrush.h
//  HwpxParser
//
//  Created by Wonsang Hwang on 11/15/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class HH_WinBrush;
@interface HH_FillBrush : NSObject
@property(strong, readonly) HH_WinBrush *winBrush;
-(NSDictionary*)getCSS;
@end

NS_ASSUME_NONNULL_END
