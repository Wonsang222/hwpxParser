//
//  Text.m
//  HwpParser
//
//  Created by Wonsang Hwang on 7/15/25.
//

#import "Text.h"
#import "../../../Design/HH_Head.h"

extern HH_Head *head;

@implementation Text
@synthesize content;

- (HTMLElement *)convertToHtmlWith:(NSString *)margin
{
    HTMLElement* span = [[HTMLElement alloc] initWithTagName:@"span"];
    
    
    
    [span setInnerHTML:self.content];
    return span;
}
- (BOOL)isTreatAsChar
{
    return TRUE;
}

-(HTMLElement*_Nonnull)getContentHtml
{
    HTMLElement* span = [[HTMLElement alloc] initWithTagName:@"span"];
    [span setInnerHTML:self.content];
    return span;
}

@end
