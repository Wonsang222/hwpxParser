//
//  ImgClip.h
//  HwpParser
//
//  Created by Wonsang Hwang on 7/12/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImgClip : NSObject
@property(nonnull,nonatomic, strong) NSString *left;
@property(nonnull,nonatomic, strong) NSString *right;
@property(nonnull,nonatomic, strong) NSString *top;
@property(nonnull,nonatomic, strong) NSString *bottom;

@end

NS_ASSUME_NONNULL_END
