//
//  HH_RefList.h
//  HwpxParser
//
//  Created by WonsangHwang on 11/11/25.
//

#import <Foundation/Foundation.h>
#import "../../Delegate/ContentDelegate.h"

@class HH_Fontfaces;
@class HH_BorderFills;
@class HH_CharProperties;
@class HH_TabProperties;
@class HH_Numberings;
@class HH_ParaProperties;
@class HH_Styles;
@class HH_MemoProperties;

@interface HH_RefList : NSObject <ContentDelegate>

@property(strong, nullable) HH_Fontfaces *fontfaces;
@property(strong, nullable) HH_BorderFills *borderFills;
@property(strong, nullable) HH_CharProperties *charProperties;
@property(strong, nullable) HH_TabProperties *tabProperties;
@property(strong, nullable) HH_Numberings *numberings;
@property(strong, nullable) HH_ParaProperties *paraProperties;
@property(strong, nullable) HH_Styles *styles;
@property(strong, nullable) HH_MemoProperties *memoProperties;

-(NSDictionary*_Nonnull)getParaPr:(NSString*_Nonnull)num;
-(CGFloat)getIntentPtForParaPr:(NSString*_Nonnull)num;
-(NSDictionary*_Nonnull)getBorderFill:(NSString*_Nonnull)num;
-(NSDictionary*_Nonnull)getCharPr:(NSString*_Nonnull)num;
- (NSString *_Nonnull)getFontWithNum:(NSString *_Nonnull)num;


@end
