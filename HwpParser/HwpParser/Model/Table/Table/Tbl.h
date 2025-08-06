//
//  Table.h
//  HwpParser
//
//  Created by 인스웨이브 on 7/1/25.
//

#import <Foundation/Foundation.h>
#import "../Base/AbstractObject.h"
#import "../Base/Common/InMargin.h"
#import "CellZone.h"
#import "Tr.h"
#import "Label.h"

@interface Tbl : AbstractShapeObjectType
@property(strong, nonatomic, nonnull) NSString* pageBreak;
@property(strong, nonatomic, nonnull) NSString* repeatHeader;
@property(strong, nonatomic, nonnull) NSString* rowCnt;
@property(strong, nonatomic, nonnull) NSString* colCnt;
@property(strong, nonatomic, nonnull) NSString* noAdjust;
@property(strong, nonatomic, nonnull) NSString* cellSpacing;
@property(strong, nonatomic, nonnull) NSString* borderFillIDRef;
@property(nonnull, nonatomic, strong) NSMutableArray<Tr*> *tr;
// nullable
@property(nullable,nonatomic, strong) InMargin *inMargin;
// cellzone -> 특정 셀에만 특정 서식이 부과되었을때 사용하는건디 어쩌라거
@property(nullable,nonatomic, strong) CellZone *cellZone;

@property(nullable, nonatomic, strong) Label *label;

@end

