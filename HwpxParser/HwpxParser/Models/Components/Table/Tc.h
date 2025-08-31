//
//  Tc.h
//  HwpxParser
//
//  Created by Wonsang Hwang on 8/13/25.
//

#import <Foundation/Foundation.h>
#import "../Paragraph/SubList.h"
#import "CellAddr.h"
#import "CellSpan.h"
#import "CellSz.h"
#import "CellMargin.h"
@import HTMLKit;

@interface Tc : NSObject

@property(strong, nonnull)NSString* name;
@property(strong, nonnull)NSString* header;
@property(strong, nonnull)NSString* hasMargin;
@property(strong, nonnull)NSString* protect;
@property(strong, nonnull)NSString* editable;
@property(strong, nonnull)NSString* dirty;

@property(nullable, strong)SubList* subList;
@property(nullable, strong)CellAddr* cellAddr;
@property(nullable, strong)CellSpan* cellSpan;
@property(nullable, strong)CellSz* cellSz;
@property(nullable, strong)CellMargin* cellMargin;

-(HTMLElement*_Nonnull)convertToHtml;

@end


