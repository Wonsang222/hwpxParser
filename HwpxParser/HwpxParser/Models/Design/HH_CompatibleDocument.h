//
//  HH_CompatibleDocument.h
//  HwpxParser
//
//  Created by WonsangHwang on 11/12/25.
//

#import <Foundation/Foundation.h>

@class HH_LayoutCompatibility;

NS_ASSUME_NONNULL_BEGIN

@interface HH_CompatibleDocument : NSObject

@property(strong, nonnull) NSString *targetProgram;
@property(strong, nullable) HH_LayoutCompatibility *layoutCompatibility;

@end

NS_ASSUME_NONNULL_END
