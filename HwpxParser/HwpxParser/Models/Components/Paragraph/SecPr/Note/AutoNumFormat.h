//
//  AutoNumFormat.h
//  HwpParser
//
//  Created by WonsangHwang on 7/10/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AutoNumFormat : NSObject
@property(nonnull,nonatomic, strong) NSString *type;
@property(nonnull,nonatomic, strong) NSString *userChar;
@property(nonnull,nonatomic, strong) NSString *prefixChar;
@property(nonnull,nonatomic, strong) NSString *suffixChar;
@property(nonnull,nonatomic, strong) NSString *supscript;
@end

NS_ASSUME_NONNULL_END
