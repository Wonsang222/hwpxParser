//
//  HH_ParaPr.h
//  HwpxParser
//
//  Created by 인스웨이브 on 11/12/25.
//

#import <Foundation/Foundation.h>

@class HH_Align;
@class HH_Heading;
@class HH_BreakSetting;
@class HH_AutoSpacing;
@class HH_Margin;
@class HH_LineSpacing;
@class HH_Border;
@class HH_Default;
@class HH_Switches;

@interface HH_ParaPr : NSObject

@property(strong, nonnull) NSString *identification;
@property(strong, nonnull) NSString *tabPrIDRef;
@property(strong, nonnull) NSString *condense;
@property(strong, nonnull) NSString *fontLineHeight;
@property(strong, nonnull) NSString *snapToGrid;
@property(strong, nonnull) NSString *suppressLineNumbers;
@property(strong, nonnull) NSString *checked;

@property(strong, nullable) HH_Align *align;
@property(strong, nullable) HH_Heading *heading;
@property(strong, nullable) HH_BreakSetting *breakSetting;
@property(strong, nullable) HH_AutoSpacing *autoSpacing;
@property(strong, nullable) HH_Border *border;

@property(strong, nullable) HH_Switches *switches;

-(NSDictionary*_Nonnull)getStyleData;

@end

