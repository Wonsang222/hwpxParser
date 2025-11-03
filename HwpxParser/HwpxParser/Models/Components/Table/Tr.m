//
//  Tr.m
//  HwpxParser
//
//  Created by Wonsang Hwang on 8/13/25.
//

#import "Tr.h"
#import "Tc.h"
@import HTMLKit;

NS_ASSUME_NONNULL_BEGIN

@implementation Tr
@synthesize tc;

-(HTMLElement*)getHtml
{
    HTMLElement* row = [[HTMLElement alloc] initWithTagName:@"tr"];
    for (id content in self.tc) {
        if ([content respondsToSelector:@selector(convertToHtml)]) {
            [row appendNode:[content convertToHtml]];
        }
    }
    return row;
}

@end

NS_ASSUME_NONNULL_END
