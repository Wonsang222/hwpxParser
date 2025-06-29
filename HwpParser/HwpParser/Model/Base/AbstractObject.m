//
//  AbstractObject.m
//  HwpParser
//
//  Created by Wonsang Hwang on 6/28/25.
//

#import "AbstractObject.h"

NS_ASSUME_NONNULL_BEGIN

@implementation AbstractShapeObjectType

// id
@synthesize identification;
@synthesize zOrder;
@synthesize numberingType;
@synthesize textWrap;
@synthesize textFlow;
@synthesize lock;
@synthesize dropCapStyle;

@synthesize sz;
@synthesize pos;
@synthesize outMargin;
@synthesize caption;
@synthesize shapeComment;
@synthesize metaTag;

@end

NS_ASSUME_NONNULL_END
