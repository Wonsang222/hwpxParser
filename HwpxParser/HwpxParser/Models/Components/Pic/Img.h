//
//  Img.h
//  HwpParser
//
//  Created by Wonsang Hwang on 7/16/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Img : NSObject
@property(nonnull,nonatomic, strong) NSString *binaryItemIDRef;
@property(nonnull,nonatomic, strong) NSString *bright;
@property(nonnull,nonatomic, strong) NSString *contrast;
@property(nonnull,nonatomic, strong) NSString *effect;
@property(nonnull,nonatomic, strong) NSString *alpha;
@end

NS_ASSUME_NONNULL_END
