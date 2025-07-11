//
//  AbstractShapeComponentType.h
//  HwpParser
//
//  Created by 인스웨이브 on 7/11/25.
//

#import <Foundation/Foundation.h>
#import "Table/Base/AbstractObject.h"

@interface AbstractShapeComponentType : AbstractShapeObjectType
@property (nonnull, strong) NSString *href;
@property (nonnull, strong) NSString *groupLevel;
@property (nonnull, strong) NSString *instid;



@end

