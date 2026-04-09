//
//  AbstractDrawingObjectType.h
//  HwpxParser
//
//  Created by Wonsang Hwang on 4/9/26.
//

#import <Foundation/Foundation.h>
@class LineShape;
NS_ASSUME_NONNULL_BEGIN

@interface AbstractDrawingObjectType : NSObject
@property(strong) LineShape *lineShape;

@end

NS_ASSUME_NONNULL_END
