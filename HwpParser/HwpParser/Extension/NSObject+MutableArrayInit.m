//
//  NSObject+MutableArrayInit.m
//  HwpParser
//
//  Created by 인스웨이브 on 7/18/25.
//

#import "NSObject+MutableArrayInit.h"
#import "objc/runtime.h"

@implementation NSObject (MutableArrayInit)

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

@end
