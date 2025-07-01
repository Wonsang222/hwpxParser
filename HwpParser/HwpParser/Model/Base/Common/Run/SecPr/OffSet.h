//
//  OffSet.h
//  HwpParser
//
//  Created by 인스웨이브 on 7/1/25.
//

#import <Foundation/Foundation.h>
#import "../../HwpUnit.h"

NS_ASSUME_NONNULL_BEGIN

@interface OffSet : NSObject

@property(strong, nonatomic) HwpUnit* left;
@property(strong, nonatomic) HwpUnit* right;
@property(strong, nonatomic) HwpUnit* top;
@property(strong, nonatomic) HwpUnit* bottom;

@end

NS_ASSUME_NONNULL_END
