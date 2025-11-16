//
//  HH_BottomBorder.h
//  HwpxParser
//
//  Created by 인스웨이브 on 11/12/25.
//

#import <Foundation/Foundation.h>
#import "HH_LeftBorder.h"

NS_ASSUME_NONNULL_BEGIN

@interface HH_BottomBorder : HH_LeftBorder

@property(strong) NSString *type;
@property(strong) NSString *width;
@property(strong) NSString *color;

@end

NS_ASSUME_NONNULL_END
