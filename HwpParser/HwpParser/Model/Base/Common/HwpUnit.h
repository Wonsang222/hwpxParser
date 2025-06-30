//
//  HwpUnit.h
//  HwpParser
//
//  Created by 인스웨이브 on 6/30/25.
//
#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h> // CGFloat를 사용하기 위해 import 합니다.

NS_ASSUME_NONNULL_BEGIN

/**
 * @class HwpUnit
 * @brief HWP 단위를 포인트(pt) 단위로 변환하는 클래스
 */
@interface HwpUnit : NSObject

/**
 * @brief hwpunit 값이 담긴 문자열로 객체를 초기화합니다.
 * @param hwpUnitString hwpunit 단위의 값 문자열
 * @return 초기화된 HwpUnit 객체
 */
- (instancetype)initWithString:(NSString *)hwpUnitString;

/**
 * @brief 변환된 pt 값을 CGFloat 타입으로 반환합니다.
 * @return pt 단위 값
 */
- (CGFloat)ptValue;

/**
 * @brief 웹뷰의 CSS 등에서 사용할 수 있도록 форматированный pt 문자열을 반환합니다. (예: "12.50pt")
 * @return pt 단위가 포함된 문자열
 */
- (NSString *)ptStringForWebView;

@end

NS_ASSUME_NONNULL_END
