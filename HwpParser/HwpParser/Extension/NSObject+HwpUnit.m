//
//  NSObject+HwpUnit.m
//  HwpParser
//
//  Created by 인스웨이브 on 7/28/25.
//

#import "NSObject+HwpUnit.h"

@implementation NSObject (HwpUnit)
-(NSString*)convertHwpunitToPt:(NSString*) hwpUnit
{
    // hwpunit converter
    float unit = [hwpUnit floatValue];
    float pt = unit / 100.0f;
    NSNumber* nsPt = [NSNumber numberWithFloat:pt];
    NSString* ptString = [nsPt stringValue];
    
    return [ptString stringByAppendingString:@"pt"];
}

-(NSString*)convertUnsignedIntToPt:(NSString*)val
{
    // 큰 수를 처리하기 위해 long long 사용
    long long unsignedVal = [val longLongValue];
    
    // 32비트 범위로 제한 (오버플로우 처리)
    uint32_t maskedVal = (uint32_t)(unsignedVal & 0xFFFFFFFF);
    
    // 32비트의 절반값 (2^31 - 1)
    uint32_t half = UINT32_MAX / 2;
    
    if (maskedVal > half) {
        // 2의 보수 변환: 큰 값을 음수로 변환
        int32_t result = (int32_t)maskedVal;
        
        NSString* val = [NSString stringWithFormat:@"%d", result];
        return [self convertHwpunitToPt:val];
    } else {
        // 양수 범위
        NSString* val = [NSString stringWithFormat:@"%u", maskedVal];
        return [self convertHwpunitToPt:val];
    }
}

@end
