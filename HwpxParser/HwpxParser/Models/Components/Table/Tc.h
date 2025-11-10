//
//  Tc.h
//  HwpxParser
//
//  Created by Wonsang Hwang on 8/13/25.
//

#import <Foundation/Foundation.h>
#import "../../../Delegate/ContentDelegate.h"

@class SubList;
@class CellAddr;
@class CellSpan;
@class CellSz;
@class CellMargin;
@class HTMLElement;

@interface Tc : NSObject <ContentDelegate>

@property(strong, nonnull)NSString* name;
@property(strong, nonnull)NSString* header;
@property(strong, nonnull)NSString* hasMargin;
@property(strong, nonnull)NSString* protect;
@property(strong, nonnull)NSString* editable;
@property(strong, nonnull)NSString* dirty;
@property(strong, nonatomic, nonnull) NSString* borderFillIDRef;

@property(nullable, strong)SubList* subList;
@property(nullable, strong)CellAddr* cellAddr;
@property(nullable, strong)CellSpan* cellSpan;
@property(nullable, strong)CellSz* cellSz;
@property(nullable, strong)CellMargin* cellMargin;

-(HTMLElement*_Nonnull)convertToHtml;
-(NSMutableDictionary*_Nonnull) getPaddings;

@end


