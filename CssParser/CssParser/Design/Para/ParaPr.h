//
//  ParaPr.h
//  HwpParser
//
//  Created by 인스웨이브 on 7/25/25.
//

#import <Foundation/Foundation.h>
#import "Align.h"
#import "Border.h"
#import "Margin.h"

@interface ParaPr : NSObject
@property(nonnull, strong) NSString* identification;
@property(nonnull, strong) NSString* tabPrIDRef;
@property(nonnull, strong) NSString* condense;

@property(nonnull, strong) NSString* fontLineHeight;
@property(nonnull, strong) NSString* snapToGrid;
@property(nonnull, strong) NSString* suppressLineNumbers;
@property(nonnull, strong) NSString* checked;
@property(nonnull, strong) NSString* textDir;

@property(nonnull, strong) Align* align;
@property(nullable, strong) Border* border;
@property(nullable, strong) Margin* margin;


@end

