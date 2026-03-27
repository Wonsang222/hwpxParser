//
//  HH_BorderFills.h
//  HwpxParser
//
//  Created by WonsangHwang on 11/11/25.
//

#import <Foundation/Foundation.h>

@class HH_BorderFill;

@interface HH_BorderFills : NSObject

@property(strong, nonnull) NSString *itemCnt;
@property(strong, nonnull) HH_BorderFill * borderFill;
@property(strong, nonnull) NSMutableArray<HH_BorderFill*>* contents;

-(NSDictionary*_Nonnull)getBorderFill:(NSString*_Nonnull)num;


@end

