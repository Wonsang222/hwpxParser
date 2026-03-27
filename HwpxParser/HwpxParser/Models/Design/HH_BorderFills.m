//
//  HH_BorderFills.m
//  HwpxParser
//
//  Created by WonsangHwang on 11/11/25.
//

#import "HH_BorderFills.h"
#import "./BorderFill/HH_BorderFill.h"
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

- (NSDictionary *)getBorderFill:(NSString *)num
{
    for (HH_BorderFill* content in self.contents) {
        if ([num isEqualToString: content.identification]) {
            return [content getBorderFill];
        }
    }
    return @{};
}


- (void)dealloc
{
    [self removeObserver:self forKeyPath:@"borderFill"];
}

@end

