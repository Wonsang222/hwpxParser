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

- (NSMutableArray *)splitTextAt:(NSUInteger)index css:(NSString *)cssString
{
    NSMutableArray *result = [NSMutableArray new];
    HTMLElement* div1 = [[HTMLElement alloc] initWithTagName:@"div"];
    HTMLElement* div2 = [[HTMLElement alloc] initWithTagName:@"div"];
    [div1 setAttributes:[@{
        @"style" : cssString
    }mutableCopy]];
    [div2 setAttributes:[@{
        @"style" : cssString
    }mutableCopy]];
    
    NSUInteger splitPos = self.content.length - index;
    NSString *firstPart = [self.content substringToIndex:splitPos];
    NSString *secondPart = [self.content substringFromIndex:splitPos];
    [div1 setInnerHTML:firstPart];
    [div2 setInnerHTML:secondPart];
    
    [result addObject:div1];
    [result addObject:div2];
    return result;
}

- (HTMLElement *)convertToHtml
{
    HTMLElement* div = [[HTMLElement alloc] initWithTagName:@"div"];
    [div setTextContent:self.content];
    return div;
}


-(BOOL)hasSuffixSpacing
{
    if ([self.content hasSuffix:@" "]) {
        return YES;
    }
    return NO;
    
}

-(void)removeSpacing
{
    self.content = [self.content substringToIndex:[self.content length] - 1];
}

-(void)addSpacing
{
    NSString *spacing = @" ";
    self.content = [spacing stringByAppendingString:self.content];
}

@end
