//
//  HH_TabPr.h
//  HwpxParser
//
//  Created by WonsangHwang on 11/12/25.
//

#import <Foundation/Foundation.h>

@class HH_Default;

@interface HH_TabPr : NSObject

@property(strong, nonnull) NSString *identification;
@property(strong, nonnull) NSString *autoTabLeft;
@property(strong, nonnull) NSString *autoTabRight;
@property(strong, nullable) HH_Default *defaults;

@end

