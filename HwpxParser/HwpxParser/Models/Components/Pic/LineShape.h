//
//  LineShape.h
//  HwpParser
//
//  Created by Wonsang Hwang on 7/12/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LineShape : NSObject
@property(nonnull,nonatomic, strong) NSString *color;
@property(nonnull,nonatomic, strong) NSString *width;
@property(nonnull,nonatomic, strong) NSString *style;
@property(nonnull,nonatomic, strong) NSString *endCap;
@property(nonnull,nonatomic, strong) NSString *headStyle;
@property(nonnull,nonatomic, strong) NSString *tailStyle;
@property(nonnull,nonatomic, strong) NSString *headfill;
@property(nonnull,nonatomic, strong) NSString *headSz;
@property(nonnull,nonatomic, strong) NSString *tailSz;
@property(nonnull,nonatomic, strong) NSString *outlineStyle;
@property(nonnull,nonatomic, strong) NSString *alpha;
@end

NS_ASSUME_NONNULL_END
