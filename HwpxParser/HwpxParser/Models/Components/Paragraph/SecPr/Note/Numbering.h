//
//  Numbering.h
//  HwpParser
//
//  Created by WonsangHwang on 7/10/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Numbering : NSObject
@property(nonnull,nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *newNum NS_RETURNS_NOT_RETAINED;
@end

NS_ASSUME_NONNULL_END
