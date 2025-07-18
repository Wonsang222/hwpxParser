//
//  NSObject+FilterNotNullProp.m
//  HwpParser
//
//  Created by 인스웨이브 on 7/18/25.
//

#import "NSObject+FilterNotNullProp.h"
#import "objc/runtime.h"

@implementation NSObject (FilterNotNullProp)
- (id)filterNotNullProp
{
    unsigned int count = 0;
    objc_property_t *properties = class_copyPropertyList([self class], &count);

    for (int i = 0; i < count; i++) {
        objc_property_t prop = properties[i];
        if ([self hasNullAtt:prop]) {
            if ([self isNotNull:prop obj:self]) {
                const char *propName = property_getName(prop);
                NSString *name = [NSString stringWithUTF8String:propName];
                return [self valueForKey:name];
            }
        }
    }
    
    return nil;
}

-(NSArray<NSString*>*)nullableProperties
{
    // 서브클래스에서 오버라이드하여 nullable 속성들을 명시적으로 정의
    return @[];
}

-(BOOL) hasNullAtt:(objc_property_t)prop
{
    const char *propName = property_getName(prop);
    NSString *propNameStr = [NSString stringWithUTF8String:propName];
    
    // nullable 속성 리스트를 확인
    NSArray<NSString*> *nullableProps = [self nullableProperties];
    return [nullableProps containsObject:propNameStr];
}

-(BOOL) isNotNull:(objc_property_t)prop obj:(id)object
{
    const char *name = property_getName(prop);
    NSString *nameString = [NSString stringWithUTF8String:name];
    
    @try {
        id value = [object valueForKey:nameString];
        return (value != nil);
    } @catch (NSException *exception) {
        return NO;
    }
}
@end
