//
//  AbstractShapeComponentType.m
//  HwpxParser
//
//  Created by WonsangHwang on 8/12/25.
//

#import "AbstractShapeComponentType.h"
#import "Offset.h"
#import "OrgSz.h"
#import "CurSz.h"
#import "Flip.h"
#import "RotationInfo.h"
#import "RenderingInfo.h"
#import "../../../Extensions/NSObject+ParsingHelper.h"

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

- (NSMutableDictionary *)getAtts
{
    return [self getAtt];
}

@end

NS_ASSUME_NONNULL_END
