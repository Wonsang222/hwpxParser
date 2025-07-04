//
//  Table.h
//  HwpParser
//
//  Created by 인스웨이브 on 7/1/25.
//

#import <Foundation/Foundation.h>
#import "../Base/AbstractObject.h"


@interface Table : NSObject
@property(strong, nonatomic, nonnull) NSString* pageBreak;
@property(assign) BOOL repeatHeader;
@property(assign) NSInteger rowCnt;
@property(assign) NSInteger colCnt;
@property(assign) BOOL noAdjust;
@property(assign) NSInteger cellSpacing;
@property(assign) NSInteger borderFillDRef;

// nullable
@property(nullable,nonatomic, strong) Margin *inMargin;
// cellzone -> 특정 셀에만 특정 서식이 부과되었을때 사용하는건디 어쩌라거


@end

