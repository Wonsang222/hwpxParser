//
//  AbstractShapeComponentType.m
//  HwpxParser
//
//  Created by 인스웨이브 on 8/12/25.
//

#import "AbstractShapeComponentType.h"
#import "Offset.h"
#import "OrgSz.h"
#import "CurSz.h"
#import "Flip.h"
#import "RotationInfo.h"
#import "RenderingInfo.h"

NS_ASSUME_NONNULL_BEGIN

@implementation AbstractShapeComponentType

@synthesize href;
@synthesize groupLevel;
@synthesize instid;
@synthesize offset;
@synthesize orgSz;
@synthesize curSz;
@synthesize flip;
@synthesize rotationInfo;
@synthesize renderingInfo;
@end

NS_ASSUME_NONNULL_END
