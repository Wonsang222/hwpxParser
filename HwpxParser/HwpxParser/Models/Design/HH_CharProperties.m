//
//  HH_CharProperties.m
//  HwpxParser
//
//  Created by 인스웨이브 on 11/12/25.
//

#import "HH_CharProperties.h"
#import "HH_CharPr.h"
#import "../../Extensions/NSObject+ParsingHelper.h"

@implementation HH_CharProperties

@synthesize itemCnt;
@synthesize charPr;
@synthesize contents;

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initializeWithMutableArray];
        [self addKVO:self withMember:@"charPr"];
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                       context:(void *)context
{
    if (object) {
        if ([keyPath isEqualToString:@"charPr"]) {
            HH_CharPr *charPr = change[NSKeyValueChangeNewKey];
            [self addContents:self.contents withContent:charPr];
        }
    }
}

- (void)dealloc
{
    [self removeKVO:self withMember:@"charPr"];
}

@end
