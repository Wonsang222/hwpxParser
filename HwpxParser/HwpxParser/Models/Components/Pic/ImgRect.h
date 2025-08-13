//
//  ImgRect.h
//  HwpParser
//
//  Created by Wonsang Hwang on 7/12/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImgRect : NSObject
@property(nonnull,nonatomic, strong) NSString *pt0;
@property(nonnull,nonatomic, strong) NSString *pt1;
@property(nonnull,nonatomic, strong) NSString *pt2;
@property(nonnull,nonatomic, strong) NSString *pt3;

@end

NS_ASSUME_NONNULL_END
