//
//  Pic.m
//  HwpParser
//
//  Created by Wonsang Hwang on 7/12/25.
//

#import "Pic.h"
#import "../../../Extensions/NSObject+ParsingHelper.h"
@import HTMLKit;
#import "LineShape.h"
#import "ImgRect.h"
#import "ImgClip.h"
#import "InMargin.h"
#import "ImgDim.h"
#import "Img.h"
#import "../../Base/AbstractShapeComponent/CurSz.h"
#import "../../Base/AbstractShapeComponent/Offset.h"
#import "../../../Utils/FsManager.h"

NS_ASSUME_NONNULL_BEGIN

@implementation Pic

@synthesize reverse;
@synthesize lineShape;
@synthesize imgRect;
@synthesize imgClip;
@synthesize inMargin;
@synthesize imgDim;
@synthesize img;

-(HTMLElement*)convertToHtml
{
    HTMLElement *picture = [[HTMLElement alloc] initWithTagName:@"img"];
    
//    if ([self.pos.treatAsChar isEqualToString:@"1"]) {
//        // 이미지를 글자처럼 사용할때
//    } else {
//        // 이미지를 아닐때
//    }
    
    NSString* base = [NSString stringWithUTF8String:__FILE__];
    NSString *base1 = [base stringByDeletingLastPathComponent];
    NSString *resultPath = [base1 stringByAppendingPathComponent:@"TestFiles"];
    NSString *resultPath2 = [resultPath stringByAppendingPathComponent:@"Output"];
    NSString *resultPath3 = [resultPath2 stringByAppendingPathComponent:@"BinData"];
    
    NSString*ext = [FsManager getFileExtensionInDirectory:resultPath3 fileName:[self.img getImgName]];
    
    NSString*ext2 = [resultPath3 stringByAppendingPathComponent:[self.img getImgName]];
    NSString*ext3 = [ext2 stringByAppendingPathExtension:ext];
    
    NSMutableDictionary* att = [@{
        @"box-sizing" : @"border-box",
        @"position" : @"absolute",
        @"padding-top" : [self convertUnsignedIntToPt:self.inMargin.top],
        @"padding-bottom" : [self convertUnsignedIntToPt:self.inMargin.bottom],
        @"padding-left" : [self convertUnsignedIntToPt:self.inMargin.left],
        @"padding-right" : [self convertUnsignedIntToPt:self.inMargin.right],
        @"width" : [self convertUnsignedIntToPt:self.curSz.width],
        @"height" : [self convertUnsignedIntToPt:self.curSz.height],
        @"top" : [self convertUnsignedIntToPt:self.offset.y],
        @"left" : [self convertUnsignedIntToPt:self.offset.x],
        @"src" : ext3,
    } mutableCopy];
    
    [picture setAttributes:[self createAttribute:att]];
    return picture;
}

@end

NS_ASSUME_NONNULL_END
