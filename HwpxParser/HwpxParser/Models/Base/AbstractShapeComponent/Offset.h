//
//  Offset.h
//  HwpxParser
//
//  Created by WonsangHwang on 8/12/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Offset : NSObject
@property(nullable,nonatomic, strong) NSString* left;
@property(nullable,nonatomic, strong) NSString* right;
@property(nullable,nonatomic, strong) NSString* top;
@property(nullable,nonatomic, strong) NSString* bottom;
@property(nullable,nonatomic, strong) NSString* x;
@property(nullable,nonatomic, strong) NSString* y;
@end

NS_ASSUME_NONNULL_END
