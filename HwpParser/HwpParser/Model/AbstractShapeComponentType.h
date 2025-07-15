//
//  AbstractShapeComponentType.h
//  HwpParser
//
//  Created by 인스웨이브 on 7/11/25.
//

#import <Foundation/Foundation.h>
#import "Table/Base/AbstractObject.h"
#import "Table/Base/Shape/Offset.h"
#import "Table/Base/Shape/OrgSz.h"
#import "Table/Base/Shape/CurSz.h"
#import "Table/Base/Shape/OrgSz.h"
#import "Table/Base/Shape/Flip.h"
#import "Table/Base/Shape/RotationInfo.h"
#import "Table/Base/Shape/RenderingInfo.h"

@interface AbstractShapeComponentType : AbstractShapeObjectType
@property (nonnull, strong) NSString *href;
@property (nonnull, strong) NSString *groupLevel;
@property (nonnull, strong) NSString *instid;


@property(nullable, strong) Offset* offset;
@property(nullable, strong) OrgSz* orgSz;
@property(nullable, strong) CurSz* curSz;
@property(nullable, strong) Flip* flip;
@property(nullable, strong) RotationInfo* rotationInfo;
@property(nullable, strong) RenderingInfo* renderingInfo;

@end

