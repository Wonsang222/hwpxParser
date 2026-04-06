//
//  Tr.m
//  HwpxParser
//
//  Created by Wonsang Hwang on 8/13/25.
//

#import "Tr.h"
#import "Tc.h"
@import HTMLKit;
#import "../../../Extensions/NSObject+ParsingHelper.h"
#import "../../WrapperP.h"
#import "../../MarginSender.h"

@implementation Tr
@synthesize tc;

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initializeWithMutableArray];
        
        [self addObserver:self
               forKeyPath:@"tc" options:NSKeyValueObservingOptionNew context:NULL];
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                       context:(void *)context
{
    if (object == self) {
        if ([keyPath isEqualToString:@"tc"]) {
            Tc *tc = change[NSKeyValueChangeNewKey];
            if (tc && ![tc isEqual:[NSNull null]]) {
                [self.contents addObject:tc];
            }
        }
    }
}

- (HTMLElement *)getHtml:(MarginSender *)margin
{
    HTMLElement* row = [[HTMLElement alloc] initWithTagName:@"tr"];
    for (Tc *t in self.contents) {
        HTMLElement* tcContent = [t convertToHtml:margin];
        [row appendNode:tcContent];
     }
    return row;
}

- (void)dealloc
{
    [self removeObserver:self forKeyPath:@"tc"];
}

@end
