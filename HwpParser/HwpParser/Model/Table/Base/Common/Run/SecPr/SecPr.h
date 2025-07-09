//
//  SecPr.h
//  HwpParser
//
//  Created by 인스웨이브 on 7/1/25.
//

#import <Foundation/Foundation.h>
#import "HwpUnit.h"

@interface SecPr : NSObject

@property(nonnull, strong) NSString *identification;
@property(nonnull, strong) NSString *textDirection;
@property(nonnull, strong) NSString *spaceColumns;
@property(nonnull, strong) NSString *tabStop;
@property(nonnull, strong) NSString *tabStopVal;
@property(nonnull, strong) NSString *tabStopUnit;
@property(nonnull, strong) NSString *outlineShapeIDRef;
@property(nonnull, strong) NSString *memoShapeIDRef;
@property(nonnull, strong) NSString *textVerticalWidthHead;
@property(nonnull, strong) NSString *masterPageCut;

// nullable



@end

