//
//  Container.h
//  HwpxParser
//
//  Created by Wonsang Hwang on 4/9/26.
//

#import <Foundation/Foundation.h>
#import "../../../../Models/Base/AbstractShapeComponent/AbstractShapeComponentType.h"
@class Pic;
@class Divrect;

@interface Container : AbstractShapeComponentType
@property(strong) NSMutableArray * _Nonnull contents;
@property(strong, nullable) Pic *pic;
@property(strong, nullable) Divrect *rect;
@end

