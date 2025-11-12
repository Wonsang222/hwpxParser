//
//  HH_ParaProperties.m
//  HwpxParser
//
//  Created by 인스웨이브 on 11/12/25.
//

#import "HH_ParaProperties.h"
#import "../../Extensions/NSObject+ParsingHelper.h"
#import "HH_ParaPr.h"

@implementation HH_ParaProperties

@synthesize itemCnt;
@synthesize contents;
@synthesize paraPr;

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initializeWithMutableArray];
        [self addKVO:self withMember:@"paraPr"];
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if (object) {
        if ([keyPath isEqualToString:@"paraPr"]) {
            HH_ParaPr *paraPr = change[NSKeyValueChangeNewKey];
            [self addContents:self.contents withContent:paraPr];
        }
    }
}

- (void)dealloc
{
    [self removeKVO:self withMember:@"paraPr"];
}

@end
