//
//  HH_RightBorder.h
//  HwpxParser
//
//  Created by WonsangHwang on 11/12/25.
//

#import <Foundation/Foundation.h>
#import "HH_LeftBorder.h"

NS_ASSUME_NONNULL_BEGIN

@interface HH_RightBorder : HH_LeftBorder

@property(strong) NSString *type;
@property(strong) NSString *width;
@property(strong) NSString *color;

@end

NS_ASSUME_NONNULL_END
