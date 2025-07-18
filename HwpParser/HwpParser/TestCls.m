//
//  TestCls.m
//  HwpParser
//
//  Created by 인스웨이브 on 7/18/25.
//

#import "TestCls.h"

#import "Extension/NSObject+MutableArrayInit.h"
#import "Extension/NSObject+FilterNotNullProp.h"

@implementation TestCls
@synthesize arr;
@synthesize check;

-(instancetype) init {
    self = [super init];
    [self initializeWithMutableArray];
    return self;
}

- (NSArray<NSString*>*)nullableProperties
{
    return @[@"check"];
}

- (id)filterNotNull
{
    return [self filterNotNullProp];
}

@end

