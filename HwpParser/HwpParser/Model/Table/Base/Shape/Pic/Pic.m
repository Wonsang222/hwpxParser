//
//  Pic.m
//  HwpParser
//
//  Created by Wonsang Hwang on 7/12/25.
//

#import "Pic.h"
#import "../../../../../Extension/NSObject+HwpUnit.h"

NS_ASSUME_NONNULL_BEGIN

@implementation Pic

@synthesize reverse;
@synthesize lineShape;
@synthesize imgRect;
@synthesize imgClip;
@synthesize inMargin;
@synthesize imgDim;
@synthesize img;

- (HTMLElement *)convertToHtml
{
    HTMLElement *picture = [[HTMLElement alloc] initWithTagName:@"img"];
    
//    if ([self.pos.treatAsChar isEqualToString:@"1"]) {
//        // 이미지를 글자처럼 사용할때
//    } else {
//        // 이미지를 아닐때
//    }
    
    NSString* imgFilePath = [@"BinData/" stringByAppendingString:self.img.binaryItemIDRef];
    
    NSMutableDictionary* att = [@{
        @"box-sizing" : @"border-box",
        @"position" : @"absolute",
        @"padding-top" : [self convertHwpunitToPt:self.inMargin.top],
        @"padding-bottom" : [self convertHwpunitToPt:self.inMargin.bottom],
        @"padding-left" : [self convertHwpunitToPt:self.inMargin.left],
        @"padding-right" : [self convertHwpunitToPt:self.inMargin.right],
        @"width" : [self convertHwpunitToPt:self.sz.width],
        @"height" : [self convertHwpunitToPt:self.sz.height],
        @"top" : [self convertUnsignedIntToPt:self.offset.y],
        @"left" : [self convertUnsignedIntToPt:self.offset.x],
        @"src" : imgFilePath,
    } mutableCopy];
    
    [picture setAttributes:att];
    return picture;
}

@end

NS_ASSUME_NONNULL_END
