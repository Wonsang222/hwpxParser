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

NS_ASSUME_NONNULL_BEGIN

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


-(HTMLElement*)getHtml
{
    HTMLElement* row = [[HTMLElement alloc] initWithTagName:@"tr"];
    for (Tc *t in self.tc) {
     }
    return row;
}

@end

NS_ASSUME_NONNULL_END
