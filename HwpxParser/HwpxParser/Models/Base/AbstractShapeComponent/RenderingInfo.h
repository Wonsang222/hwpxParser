//
//  RenderingInfo.h
//  HwpParser
//
//  Created by Wonsang Hwang on 7/12/25.
//

#import <Foundation/Foundation.h>

@class TransMatrix;
@class RotMatrix;
@class ScaMatrix;

NS_ASSUME_NONNULL_BEGIN

@interface RenderingInfo : NSObject
@property(nonnull, strong) TransMatrix *transMatrix;
@property(nonnull, strong) RotMatrix *rotMatrix;
@property(nonnull, strong) ScaMatrix *scaMatrix;


@end

NS_ASSUME_NONNULL_END
