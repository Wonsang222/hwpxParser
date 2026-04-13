//
//  AbstractDrawingObjectType.h
//  HwpxParser
//
//  Created by Wonsang Hwang on 4/9/26.
//

#import <Foundation/Foundation.h>
@class LineShape;
@class HH_FillBrush;
@class HH_Shadow;
@class DrawText;
#import "../AbstractShapeComponent/AbstractShapeComponentType.h"

NS_ASSUME_NONNULL_BEGIN

@interface AbstractDrawingObjectType : AbstractShapeComponentType
@property(strong, nullable) LineShape *lineShape;
@property(strong, nullable) HH_FillBrush *fillBrush;
@property(strong, nullable) HH_Shadow *shadow;
@property(strong, nullable) DrawText *drawText;
@end

NS_ASSUME_NONNULL_END
