//
//  Run.m
//  HwpParser
//
//  Created by 인스웨이브 on 7/1/25.
//

#import "Run.h"
#import "../../../../../Extension/NSObject+FilterNotNullProp.h"

NS_ASSUME_NONNULL_BEGIN

@implementation Run

@synthesize charPrIDRef;
@synthesize charTcId;
@synthesize secPr;
@synthesize text;
@synthesize pic;

- (NSArray<NSString*>*)nullableProperties
{
    return @[@"secPr",@"text", @"pic"];
}

- (id _Nullable)filterNotNull
{
    return [self filterNotNullProp];
}

@end

NS_ASSUME_NONNULL_END
