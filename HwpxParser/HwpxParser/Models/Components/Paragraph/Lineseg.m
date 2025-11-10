//
//  Lineseg.m
//  HwpParser
//
//  Created by Wonsang Hwang on 7/16/25.
//

#import "Lineseg.h"

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

- (HTMLElement *)convertToHtml:(NSString *)position withParent:(NSMutableDictionary *)parentAtt
{
    // 실제 높이 계산 vertsize + spacing
    float calculatedSize = [self.vertsize floatValue] + [self.spacing floatValue];
    NSString *sizeStr = [NSString stringWithFormat:@"%f", calculatedSize];
    HTMLElement* outerFrame = [[HTMLElement alloc] initWithTagName:@"div"];
    
    NSString* pos = @"relative";
    NSString* positionLeft = [self convertUnsignedIntToPt:self.textpos];
    NSString* positionTop = [self convertUnsignedIntToPt:self.vertpos];
    
    if ([position isEqualToString:@"second"] && parentAtt) {
        pos = @"absolute";
        
        float lef = [parentAtt[@"padding-left"]floatValue] + [self.textpos floatValue];
        float top = [parentAtt[@"padding-right"]floatValue] + [self.vertpos floatValue];
        
        NSString* topString = [NSString stringWithFormat:@"%f", top];
        NSString* leftString = [NSString stringWithFormat:@"%f", lef];
        
        positionTop = [self convertUnsignedIntToPt:topString];
        positionLeft = [self convertUnsignedIntToPt:leftString];
    }
    
    NSMutableDictionary* outerAtt = [@{
        @"position" : pos,
        @"top" : positionTop,
        @"left" : positionLeft,
        @"height" : [self convertUnsignedIntToPt:sizeStr],
        @"width" : [self convertUnsignedIntToPt:self.horzsize],
        @"background-color" : @"#008000"
    }mutableCopy];
    
    NSMutableDictionary* attString = [self createAttribute:outerAtt];
    
    [outerFrame setAttributes:attString];
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

