//
//  CurSz.h
//  HwpParser
//
//  Created by WonsangHwang on 7/11/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CurSz : NSObject
@property(nonnull,nonatomic, strong) NSString *height;
@property(nonnull,nonatomic, strong) NSString *width;

-(NSMutableDictionary*)getCurSize;

@end

NS_ASSUME_NONNULL_END
