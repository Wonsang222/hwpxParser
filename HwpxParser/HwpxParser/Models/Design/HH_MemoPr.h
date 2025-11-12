//
//  HH_MemoPr.h
//  HwpxParser
//
//  Created by 인스웨이브 on 11/12/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HH_MemoPr : NSObject

@property(strong, nonnull) NSString *identification;
@property(strong, nonnull) NSString *width;
@property(strong, nonnull) NSString *lineWidth;
@property(strong, nonnull) NSString *lineType;
@property(strong, nonnull) NSString *lineColor;
@property(strong, nonnull) NSString *fillColor;
@property(strong, nonnull) NSString *activeColor;
@property(strong, nonnull) NSString *memoType;

@end

NS_ASSUME_NONNULL_END
