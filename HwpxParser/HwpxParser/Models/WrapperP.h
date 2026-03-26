//
//  WrapperP.h
//  HwpxParser
//
//  Created by Wonsang Hwang on 3/26/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class HTMLElement;

@interface WrapperP : NSObject
@property(nonnull, nonatomic, strong) HTMLElement* outer;
@property(nonnull, nonatomic, strong) HTMLElement* inner;
@end

NS_ASSUME_NONNULL_END
