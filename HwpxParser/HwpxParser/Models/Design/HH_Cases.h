//
//  HH_Case.h
//  HwpxParser
//
//  Created by WonsangHwang on 11/14/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class HH_Margin;
@class HH_LineSpacing;

@interface HH_Cases : NSObject
@property(strong) NSString* requirednamespace;
@property(strong) HH_Margin* margin;
@property(strong) HH_LineSpacing* lineSpacing;

-(NSDictionary*)getCSSData;
-(nullable NSString*)getIntentCSS;
-(CGFloat)getIntentPt;
@end

NS_ASSUME_NONNULL_END
