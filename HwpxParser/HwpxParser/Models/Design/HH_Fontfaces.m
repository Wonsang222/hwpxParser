//
//  HH_Fontfaces.m
//  HwpxParser
//
//  Created by 인스웨이브 on 11/11/25.
//

#import "HH_Fontfaces.h"
#import "../../Extensions/NSObject+ParsingHelper.h"

@implementation HH_Fontfaces

@synthesize itemCnt;
@synthesize fontface;
@synthesize contents;

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initializeWithMutableArray];
        
        [self addObserver:self
               forKeyPath:@"fontface" options:NSKeyValueObservingOptionNew context:NULL];
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                       context:(void *)context
{
    if (object == self) {
        if ([keyPath isEqualToString:@"fontface"]) {
            HH_Fontface *fontface = change[NSKeyValueChangeNewKey];
            if (fontface) {
                [self.contents addObject:fontface];
            }
        }
    }
}

- (void)dealloc
{
    [self removeObserver:self forKeyPath:@"fontface"];
}

@end

