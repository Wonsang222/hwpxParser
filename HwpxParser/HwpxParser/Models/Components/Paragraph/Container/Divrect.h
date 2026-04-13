//
//  Divrect.h
//  HwpxParser
//
//  Created by Wonsang Hwang on 4/9/26.
//

#import <Foundation/Foundation.h>
#import "../../../Base/AbstractShapeDrawingObjectType/AbstractDrawingObjectType.h"

NS_ASSUME_NONNULL_BEGIN

@interface Divrect : AbstractDrawingObjectType
@property(strong, nonatomic) NSString *ratio;
@property(nonnull,nonatomic, strong) NSString *pt0;
@property(nonnull,nonatomic, strong) NSString *pt1;
@property(nonnull,nonatomic, strong) NSString *pt2;
@property(nonnull,nonatomic, strong) NSString *pt3;
@end

NS_ASSUME_NONNULL_END
