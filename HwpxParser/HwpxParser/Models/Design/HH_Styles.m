//
//  HH_Styles.m
//  HwpxParser
//
//  Created by 인스웨이브 on 11/12/25.
//

#import "HH_Styles.h"
#import "../../Extensions/NSObject+ParsingHelper.h"
#import "HH_Style.h"



@implementation HH_Styles

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initializeWithMutableArray];
        [self addKVO:self withMember:@"style"];
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if (object) {
        if ([keyPath isEqualToString:@"style"]) {
            HH_Style *style = change[NSKeyValueChangeNewKey];
            [self addContents:self.contents withContent:style];
        }
    }
}

- (void)dealloc
{
    [self removeKVO:self withMember:@"style"];
}

@end

