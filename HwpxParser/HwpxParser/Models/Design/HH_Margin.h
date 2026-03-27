//
//  HH_Margin.h
//  HwpxParser
//
//  Created by WonsangHwang on 11/12/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class HH_Intent;
@class HH_Left;
@class HH_Right;
@class HH_Prev;
@class HH_Next;

@interface HH_Margin : NSObject

@property(strong, nullable) HH_Intent *intent;
@property(strong, nullable) HH_Left *left;
@property(strong, nullable) HH_Right *right;
@property(strong, nullable) HH_Prev *prev;
@property(strong, nullable) HH_Next *next;

-(NSDictionary*)getCssData;

@end

NS_ASSUME_NONNULL_END
