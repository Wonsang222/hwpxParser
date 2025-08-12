//
//  AbstractShapeComponentType.h
//  HwpxParser
//
//  Created by 인스웨이브 on 8/12/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class Offset;
@class OrgSz;
@class CurSz;
@class Flip;
@class RotationInfo;
@class RenderingInfo;

@interface AbstractShapeComponentType : NSObject
@property (strong) NSString *href;
@property (strong) NSString *groupLevel;
@property (strong) NSString *instid;

@property(nullable, strong) Offset* offset;
@property(nullable, strong) OrgSz* orgSz;
@property(nullable, strong) CurSz* curSz;
@property(nullable, strong) Flip* flip;
@property(nullable, strong) RotationInfo* rotationInfo;
@property(nullable, strong) RenderingInfo* renderingInfo;
@end

NS_ASSUME_NONNULL_END
