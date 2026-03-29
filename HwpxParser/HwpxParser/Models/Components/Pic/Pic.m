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
#import "../../../main.h"

NS_ASSUME_NONNULL_BEGIN

@implementation Pic

@synthesize reverse;
@synthesize lineShape;
@synthesize imgRect;
@synthesize imgClip;
@synthesize inMargin;
@synthesize imgDim;
@synthesize img;

- (NSString *)imgSrc
{
    NSString *rootPath = [base stringByDeletingLastPathComponent];
    NSString *imgName = [self.img getImgName];
    return [FsManager findFileRecursively:rootPath fileName:imgName];
}

-(HTMLElement*)convertToHtml
{
    HTMLElement *picture = [[HTMLElement alloc] initWithTagName:@"img"];

//    if ([self.pos.treatAsChar isEqualToString:@"1"]) {
//        // 이미지를 글자처럼 사용할때
//    } else {
//        // 이미지를 아닐때
//    }

    NSMutableDictionary* att1 = [self getAtts]; // size
    NSMutableDictionary* att2 = [self.inMargin getAtt];

    [att1 addEntriesFromDictionary:att2];

    NSString *position = @"position:relative; ";
    NSString *styleString = [self convertDic:att1];
    NSString *srcString = [self imgSrc];
    
    [picture setAttributes:[@{
        @"src" : srcString,
        @"style" : [position stringByAppendingString:styleString],
    }mutableCopy]];
    return picture;
}

- (HTMLElement *)convertToHtmlWith:(NSString *)margin
{
    if (!margin) {
        return [self convertToHtml];
    }
    
    NSMutableDictionary* att1 = [self getAtts]; // size
    NSString *sizeString = [self convertDic:att1];
    HTMLElement *wrapper = [[HTMLElement alloc] initWithTagName:@"div"];
    NSString *absolute = @"position: absolute ";
    NSString *absoluteSize = [absolute stringByAppendingString:sizeString];
    [wrapper setAttributes:[@{
        @"style" : absoluteSize
    }mutableCopy]];
    
    HTMLElement *picture = [[HTMLElement alloc] initWithTagName:@"img"];
    NSString *relative = @"position:relative; ";
    NSString *relativeSize = [relative stringByAppendingString:sizeString];
    
    NSString *srcString = [self imgSrc];
    [picture setAttributes:[@{
        @"style" : relativeSize,
        @"src" : srcString
    } mutableCopy]];
    
    [wrapper appendNode:picture];
    
    return wrapper;
}

@end

NS_ASSUME_NONNULL_END
