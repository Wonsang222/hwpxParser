//
//  Tc.h
//  HwpParser
//
//  Created by 인스웨이브 on 7/1/25.
//

#import <Foundation/Foundation.h>
#import "../Base/Common/SubList.h"
#import "CellAddr.h"
#import "CellSpan.h"
#import "CellSz.h"
#import "CellMargin.h"

@interface Tc : NSObject
@property(strong, nonnull) NSString* name;
@property(strong, nonnull) NSString* header;
@property(strong, nonnull) NSString* hasMargin;
@property(strong, nonnull) NSString* protect;
@property(strong, nonnull) NSString* editable;
@property(strong, nonnull) NSString* dirty;
@property(strong, nonnull) NSString* borderFillIDRef;

// nullable

@property(nullable, strong) SubList *subList;
@property(nullable, strong) CellAddr *cellAddr;
@property(nullable, strong) CellSpan *cellSpan;
@property(nullable, strong) CellSz *cellSz;
@property(nullable, strong) CellMargin *cellMargin;

@end

