//
//  HH_BorderFills.m
//  HwpxParser
//
//  Created by 인스웨이브 on 11/11/25.
//

#import "HH_BorderFills.h"
#import "../../Extensions/NSObject+ParsingHelper.h"

@implementation HH_BorderFills

@synthesize itemCnt;
@synthesize borderFill;
@synthesize contents;

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initializeWithMutableArray];
        [self addObserver:self
               forKeyPath:@"borderFill" options:NSKeyValueObservingOptionNew
                  context:NULL];
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if (object == self) {
        if ([keyPath isEqualTo:@"borderFill"]) {
            HH_BorderFill *borderFill = change[NSKeyValueChangeNewKey];
            if (borderFill) {
                [self.contents addObject:borderFill];
            }
        }
    }
}


- (void)dealloc
{
    [self removeObserver:self forKeyPath:@"borderFill"];
}

@end

