//
//  Lineseg.m
//  HwpParser
//
//  Created by Wonsang Hwang on 7/16/25.
//

#import "Lineseg.h"

NS_ASSUME_NONNULL_BEGIN

@implementation Lineseg

@synthesize textpos;
@synthesize vertpos;
@synthesize vertsize;
@synthesize textheight;
@synthesize baseline;
@synthesize spacing;
@synthesize horzpos;
@synthesize horzsize;
@synthesize flags;

- (HTMLElement *)convertToHtml
{
    // 실제 높이 계산 vertsize + spacing
    float calculatedSize = [self.vertsize floatValue] + [self.spacing floatValue];
    NSString *sizeStr = [NSString stringWithFormat:@"%f", calculatedSize];
    HTMLElement* outerFrame = [[HTMLElement alloc] initWithTagName:@"div"];
    
    NSMutableDictionary* outerAtt = [@{
        @"position" : @"relative",
        @"padding-top" : [self convertUnsignedIntToPt:self.vertpos],
        @"padding-left" : [self convertUnsignedIntToPt:self.textpos],
        @"height" : [self convertUnsignedIntToPt:sizeStr],
        @"width" : [self convertUnsignedIntToPt:self.horzsize]
    }mutableCopy];
    
    [outerFrame setAttributes:outerAtt];
        
    return outerFrame;
}


- (BOOL)isNewPage
{
    if ([self.vertpos isEqualToString:@"0"]) {
        return YES;
    }
    return NO;
}
@end

NS_ASSUME_NONNULL_END
