//
//  HwpUnit.h
//  HwpParser
//
//  Created by 인스웨이브 on 6/30/25.
//
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HwpUnit : NSObject

// CSS 기준 1pt -> 100hwpunit

- (instancetype)initWithString:(NSString *)hwpUnitString;
- (CGFloat)ptValue;
- (NSString *)ptStringForWebView;

@end

NS_ASSUME_NONNULL_END
