//
//  HwpUnit.m
//  HwpParser
//
//  Created by 인스웨이브 on 6/30/25.
//

#import "HwpUnit.h"

NS_ASSUME_NONNULL_BEGIN

@interface HwpUnit()

// pt로 변환된 값을 저장하기 위한 내부 프로퍼티
@property (nonatomic, assign) CGFloat pointSize;

@end


@implementation HwpUnit

/**
 * @brief hwpunit 값이 담긴 문자열로 객체를 초기화합니다.
 * @param hwpUnitString hwpunit 단위의 값 문자열
 * @return 초기화된 HwpUnit 객체
 */
- (instancetype)initWithString:(NSString *)hwpUnitString
{
    self = [super init];
    if (self) {
        // 입력된 문자열을 정수(NSInteger)로 변환합니다.
        NSInteger hwpValue = [hwpUnitString integerValue];
        
        // hwpunit을 pt로 변환합니다. (1pt = 100hwpunit)
        // 소수점 계산을 위해 100.0f로 나눕니다.
        _pointSize = (CGFloat)hwpValue / 100.0f;
    }
    return self;
}

/**
 * @brief 변환된 pt 값을 CGFloat 타입으로 반환합니다.
 * @return pt 단위 값
 */
- (CGFloat)ptValue
{
    return self.pointSize;
}

/**
 * @brief 웹뷰의 CSS 등에서 사용할 수 있도록 포맷팅된 pt 문자열을 반환합니다. (예: "12.50pt")
 * @return pt 단위가 포함된 문자열
 */
- (NSString *)ptStringForWebView
{
    // 소수점 둘째 자리까지 표시하여 "pt" 단위를 붙여 반환합니다.
    return [NSString stringWithFormat:@"%.2fpt", self.pointSize];
}

@end

NS_ASSUME_NONNULL_END
