//
//  RotationInfo.h
//  HwpParser
//
//  Created by Wonsang Hwang on 7/12/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RotationInfo : NSObject
@property(nonnull,nonatomic, strong) NSString *angle;
@property(nonnull,nonatomic, strong) NSString *centerX;
@property(nonnull,nonatomic, strong) NSString *centerY;
@property(nonnull,nonatomic, strong) NSString *rotateimage;
@end

NS_ASSUME_NONNULL_END
