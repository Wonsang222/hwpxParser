//
//  AbstractShapeComponentType.h
//  HwpxParser
//
//  Created by WonsangHwang on 8/12/25.
//

#import <Foundation/Foundation.h>
#import "../AbstractShape/AbstractShapeObjectType.h"

@class Offset;
@class OrgSz;
@class CurSz;
@class Flip;
@class RotationInfo;
@class RenderingInfo;

NS_ASSUME_NONNULL_BEGIN
@interface AbstractShapeComponentType : AbstractShapeObjectType
@property (strong) NSString *href;
@property (strong) NSString *groupLevel;
@property (strong) NSString *instid;

@property(nullable, strong) Offset* offset;
@property(nullable, strong) OrgSz* orgSz;
@property(nullable, strong) CurSz* curSz;
@property(nullable, strong) Flip* flip;
@property(nullable, strong) RotationInfo* rotationInfo;
@property(nullable, strong) RenderingInfo* renderingInfo;

-(NSMutableDictionary*)getAtts;

@end

NS_ASSUME_NONNULL_END
