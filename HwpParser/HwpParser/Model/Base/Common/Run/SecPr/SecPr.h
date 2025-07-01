//
//  SecPr.h
//  HwpParser
//
//  Created by 인스웨이브 on 7/1/25.
//

#import <Foundation/Foundation.h>
#import "../HwpUnit.h"

@interface SecPr : NSObject

@property(assign) NSInteger identification;
@property(nonnull,nonatomic, strong) NSString *textDirection;
@property(assign) NSInteger spaceColumns;
@property(assign) NSInteger tabStop;
@property(assign) NSInteger tabStopVal;
@property(nonnull, strong, nonatomic) HwpUnit* tabStopUnit;
@property(assign) NSInteger outlineShapeIDRef;
@property(assign) NSInteger memoShapeIDRef;
@property(assign) BOOL textVerticalWidthHead;
@property(assign) NSInteger masterPageCnt;

// nullable



@end

