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
    NSString *resultPath = [base1 stringByAppendingPathComponent:@"result"];
    NSString *resultPath3 = [resultPath stringByAppendingPathComponent:@"BinData"];
    
    NSString*ext = [FsManager getFileExtensionInDirectory:resultPath3 fileName:[self.img getImgName]];
    
    NSString*ext2 = [resultPath3 stringByAppendingPathComponent:[self.img getImgName]];
    NSString*ext3 = [ext2 stringByAppendingPathExtension:ext];
    
    NSMutableDictionary* att1 = [self getAtts];
    NSMutableDictionary* att2 = [self.inMargin getAtt];
    
    [att1 addEntriesFromDictionary:att2];
    [picture setAttributes:[self createAttribute:att1]];
    
    // src settting
    
    [picture setAttributes:[@{
        @"src" : @"fads"
    }mutableCopy]];
    
    return picture;
}

@end

NS_ASSUME_NONNULL_END
