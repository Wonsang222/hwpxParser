//
//  HH_TabProperties.m
//  HwpxParser
//
//  Created by 인스웨이브 on 11/12/25.
//

#import "HH_TabProperties.h"
#import "HH_TabPr.h"
#import "../../Extensions/NSObject+ParsingHelper.h"

@implementation HH_TabProperties

@synthesize itemCnt;
@synthesize tabPr;
@synthesize contents;

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addKVO:self withMember:@"tabPr"];
    }
    return self;
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if (object) {
        if ([keyPath isEqualToString:@"tabPr"]) {
            HH_TabPr *tabPr = change[NSKeyValueChangeNewKey];
            [self addContents:self.contents withContent:tabPr];
        }
    }
}

- (void)dealloc
{
    [self removeKVO:self withMember:@"tabPr"];
}

@end
