//
//  Text.m
//  HwpParser
//
//  Created by Wonsang Hwang on 7/15/25.
//

#import "Text.h"

@implementation Text

@synthesize content;
-(HTMLElement *)convertToHtml
{
    HTMLElement* span = [[HTMLElement alloc] initWithTagName:@"span"];
    [span setInnerHTML:self.content];
    return span;
}
@end
