//
//  HH_ParaProperties.m
//  HwpxParser
//
//  Created by WonsangHwang on 11/12/25.
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

- (NSDictionary *)getParaPr:(NSString *)num
{
    for (HH_ParaPr *content in self.contents) {
        if ([content.identification isEqualToString:num]) {
            return [content getStyleData];
        }
    }
    return @{};
}

- (CGFloat)getIntentPtForParaPr:(NSString *)num
{
    for (HH_ParaPr *content in self.contents) {
        if ([content.identification isEqualToString:num]) {
            return [content intentPt];
        }
    }
    return 0.0;
}

- (void)dealloc
{
    [self removeKVO:self withMember:@"paraPr"];
}

@end
