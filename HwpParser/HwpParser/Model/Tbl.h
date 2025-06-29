//
//  Tbl.h
//  HwpParser
//
//  Created by Wonsang Hwang on 6/29/25.
//

#import <Foundation/Foundation.h>
#import "Base/AbstractObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface Tbl : AbstractShapeObjectType
@property(nonatomic, nonnull, strong) NSString* pageBreak;
@property(nonatomic) BOOL repeatHeader;
@property(nonatomic, nonnull, strong) NSNumber* rowCnt;
@property(nonatomic) BOOL noAdjust;
@property(nonatomic, nonnull, strong) NSNumber* colCnt;
@property(nonatomic, nonnull, strong) NSNumber* cellSpacing;
@property(nonatomic, nonnull, strong) NSNumber* borderFillDRef;

@property(nonatomic, nullable, strong) NSNumber* inMargin;
@property(nonatomic, nullable, strong) NSNumber* cellZoneList;
@property(nonatomic, nullable, strong) NSNumber* tr;
@property(nonatomic, nullable, strong) NSNumber* label;

@end

NS_ASSUME_NONNULL_END
