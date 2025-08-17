//
//  NSObject+ParsingHelper.m
//  HwpxParser
//
//  Created by Wonsang Hwang on 8/13/25.
//

#import "NSObject+ParsingHelper.h"
#import "objc/runtime.h"

@implementation NSObject (ParsingHelper)
- (NSString *)convertUnsignedIntToPt:(NSString *)val
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

-(NSString*)convertHwpunitToPt:(NSString*) hwpUnit
{
    // hwpunit converter
    float unit = [hwpUnit floatValue];
    float pt = unit / 100.0f;
    NSNumber* nsPt = [NSNumber numberWithFloat:pt];
    NSString* ptString = [nsPt stringValue];
    
    return [ptString stringByAppendingString:@"pt"];
}

- (void)initializeWithMutableArray
{
    unsigned int count = 0;
    // 1. 클래스의 모든 프로퍼티 리스트를 로오드
    objc_property_t *properties = class_copyPropertyList([self class], &count);

    for (int i = 0; i < count; i++) {
        objc_property_t property = properties[i];
        
        // 2. 프로퍼티의 문자열로
        const char *attrs = property_getAttributes(property);
        NSString *attrsString = [NSString stringWithUTF8String:attrs];

        // 3. 속성 문자열에 "NSMutableArray"가 포함되어 있는지 확인
        if ([attrsString containsString:@"NSMutableArray"]) {
            // 4. 프로퍼티의 이름을 로등
            const char *name = property_getName(property);
            NSString *propertyName = [NSString stringWithUTF8String:name];
            
            // 5. arr 초기화
            [self setValue:[[NSMutableArray alloc] init] forKey:propertyName];
        }
    }
    // 6. 해제
    free(properties);
}

- (NSString *)createAttribute:(NSMutableDictionary *)dic
{
    NSMutableString* atts = [NSMutableString string];
    for (NSString* key in dic) {
        NSString* value = dic[key];
        
        [atts appendFormat:@"%@:%@; ", key, value];
    }
    
    return atts;
}

@end
