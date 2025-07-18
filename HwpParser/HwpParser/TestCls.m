//
//  TestCls.m
//  HwpParser
//
//  Created by 인스웨이브 on 7/18/25.
//

#import "TestCls.h"
#import "objc/runtime.h"

NS_ASSUME_NONNULL_BEGIN

@implementation TestCls
@synthesize arr;
@synthesize check;

-(instancetype) init {
    self = [super init];
    [self initializeMutableArr];
    return self;
}

-(void)initializeMutableArr
{
    unsigned int count = 0;
    // 1. 클래스의 모든 프로퍼티 리스트를 가져옵니다.
    objc_property_t *properties = class_copyPropertyList([self class], &count);

    for (int i = 0; i < count; i++) {
        objc_property_t property = properties[i];
        
        // 2. 프로퍼티의 속성(attribute) 문자열을 가져옵니다.
        // 예: T@"NSMutableArray",&,N,V_items
        const char *attrs = property_getAttributes(property);
        NSString *attrsString = [NSString stringWithUTF8String:attrs];

        // 3. 속성 문자열에 "NSMutableArray"가 포함되어 있는지 확인합니다.
        if ([attrsString containsString:@"NSMutableArray"]) {
            // 4. 프로퍼티의 이름을 가져옵니다.
            const char *name = property_getName(property);
            NSString *propertyName = [NSString stringWithUTF8String:name];
            
            // 5. KVC(Key-Value Coding)를 사용해 해당 프로퍼티에 초기화된 배열을 할당합니다.
            [self setValue:[[NSMutableArray alloc] init] forKey:propertyName];
        }
    }
    
    // 6. 메모리 누수를 방지하기 위해 할당된 프로퍼티 리스트를 해제합니다.
    free(properties);
}

@end

NS_ASSUME_NONNULL_END
