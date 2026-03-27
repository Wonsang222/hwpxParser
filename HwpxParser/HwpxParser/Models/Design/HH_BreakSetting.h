//
//  HH_BreakSetting.h
//  HwpxParser
//
//  Created by WonsangHwang on 11/12/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HH_BreakSetting : NSObject

@property(strong) NSString *breakLatinWord;
@property(strong) NSString *breakNonLatinWord;
@property(strong) NSString *widowOrphan;
@property(strong) NSString *keepWithNext;
@property(strong) NSString *keepLines;
@property(strong) NSString *pageBreakBefore;
@property(strong) NSString *lineWrap;

-(NSDictionary*)getCssData;


@end

NS_ASSUME_NONNULL_END
