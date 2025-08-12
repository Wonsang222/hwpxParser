//
//  AbstractShapeObjectType.m
//  HwpxParser
//
//  Created by 인스웨이브 on 8/12/25.
//

#import "AbstractShapeObjectType.h"
#import "Sz.h"
#import "Pos.h"
#import "OutMargin.h"

NS_ASSUME_NONNULL_BEGIN

@implementation AbstractShapeObjectType

@synthesize identification;
@synthesize zOrder;
@synthesize numberingType;
@synthesize textWrap;
@synthesize textFlow;
@synthesize lock;
@synthesize dropcapstyle;

@synthesize sz;
@synthesize pos;
@synthesize outMargin;
//@synthesize caption;
//@synthesize shapeComment;

@end

NS_ASSUME_NONNULL_END
