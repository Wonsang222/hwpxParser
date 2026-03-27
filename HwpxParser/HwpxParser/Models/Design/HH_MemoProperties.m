//
//  HH_MemoProperties.m
//  HwpxParser
//
//  Created by WonsangHwang on 11/12/25.
//

#import "HH_MemoProperties.h"
#import "../../Extensions/NSObject+ParsingHelper.h"
#import "HH_MemoPr.h"

@implementation HH_MemoProperties

@synthesize itemCnt;
@synthesize memoPr;
@synthesize contents;

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initializeWithMutableArray];
        [self addKVO:self withMember:@"memoPr"];
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if (object) {
        if ([keyPath isEqualToString:@"memoPr"]) {
            HH_MemoPr *memoPr = change[NSKeyValueChangeNewKey];
            [self addContents:self.contents withContent:memoPr];
        }
    }
}

- (void)dealloc
{
    [self removeKVO:self withMember:@"memoPr"];
}

@end
