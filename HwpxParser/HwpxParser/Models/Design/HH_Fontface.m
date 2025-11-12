//
//  HH_Fontface.m
//  HwpxParser
//
//  Created by 인스웨이브 on 11/11/25.
//

#import "HH_Fontface.h"
#import "../../Extensions/NSObject+ParsingHelper.h"

NS_ASSUME_NONNULL_BEGIN

@implementation HH_Fontface

@synthesize font;
@synthesize contents;
@synthesize lang;

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initializeWithMutableArray];
        [self addObserver:self forKeyPath:@"font" options:NSKeyValueObservingOptionNew context:NULL];
    }
    return self;
}

- (void)dealloc
{
    [self removeObserver:self forKeyPath:@"font"];
}

@end

NS_ASSUME_NONNULL_END
