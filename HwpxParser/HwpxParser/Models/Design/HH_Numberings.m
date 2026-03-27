//
//  HH_Numberings.m
//  HwpxParser
//
//  Created by WonsangHwang on 11/12/25.
//

#import "HH_Numberings.h"
#import "../../Extensions/NSObject+ParsingHelper.h"
#import "HH_Numbering.h"

@implementation HH_Numberings

@synthesize itemCnt;
@synthesize contents;
@synthesize numbering;

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initializeWithMutableArray];
        [self addKVO:self withMember:@"numbering"];
        
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if (object) {
        if ([keyPath isEqualToString:@"numbering"]) {
            HH_Numbering *numbering = change[NSKeyValueChangeNewKey];
            [self addContents:self.contents withContent:numbering];
        }
    }
}

- (void)dealloc
{
    [self removeKVO:self withMember:@"numbering"];
}

@end
