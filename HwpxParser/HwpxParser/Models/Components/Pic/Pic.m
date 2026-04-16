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
#import "../../Base/AbstractShapeComponent/RenderingInfo.h"
#import "../../Base/AbstractShapeComponent/MatrixType/ScaMatrix.h"
#import "../../Base/AbstractShapeComponent/Offset.h"
#import "../../Base/AbstractShape/Pos.h"
#import "../../../Utils/FsManager.h"
#import "../../../main.h"


NS_ASSUME_NONNULL_BEGIN

@interface Pic ()
- (NSMutableDictionary *)scaledSizeWithCurSz;
@end

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

///// self.stackSizes (getAtts 반환값 배열) 를 순회하며 width / height 의 합산값을 반환한다.
//- (NSMutableDictionary *)sumOfStackSizes
//{
//    CGFloat totalWidth  = 0.0f;
//    CGFloat totalHeight = 0.0f;
//
//    for (NSMutableDictionary *size in self.stackSizes) {
//        NSString *widthStr  = size[@"width"];
//        NSString *heightStr = size[@"height"];
//        totalWidth  += [[widthStr  stringByReplacingOccurrencesOfString:@"pt" withString:@""] floatValue];
//        totalHeight += [[heightStr stringByReplacingOccurrencesOfString:@"pt" withString:@""] floatValue];
//    }
//
//    return [@{
//        @"width"  : [NSString stringWithFormat:@"%gpt", totalWidth],
//        @"height" : [NSString stringWithFormat:@"%gpt", totalHeight]
//    } mutableCopy];
//}

/// margin 문자열(예: "top:10pt; left:20pt; right:...; bottom:...;")에서
/// top, left 각각의 pt 값에 addTop / addLeft ("Xpt" 형태) 를 더해 새 margin 문자열을 반환한다.
- (NSString *)marginStringByAddingTop:(NSString *)addTop
                                 left:(NSString *)addLeft
                             toMargin:(NSString *)margin
{
    // "Xpt" → CGFloat 변환 (소수점 포함 대응)
    CGFloat addTopValue  = [[addTop  stringByReplacingOccurrencesOfString:@"pt" withString:@""] floatValue];
    CGFloat addLeftValue = [[addLeft stringByReplacingOccurrencesOfString:@"pt" withString:@""] floatValue];

    NSMutableString *result = [margin mutableCopy];

    // top 값 파싱 → 덧셈 → 교체
    NSRegularExpression *topRegex =
        [NSRegularExpression regularExpressionWithPattern:@"top:([0-9.]+)pt"
                                                  options:0
                                                    error:nil];
    NSTextCheckingResult *topMatch =
        [topRegex firstMatchInString:result
                             options:0
                               range:NSMakeRange(0, result.length)];
    if (topMatch && topMatch.numberOfRanges > 1) {
        CGFloat topValue = [[result substringWithRange:[topMatch rangeAtIndex:1]] floatValue];
        topValue += addTopValue;
        [result replaceCharactersInRange:topMatch.range
                              withString:[NSString stringWithFormat:@"top:%gpt", topValue]];
    }

    // left 값 파싱 → 덧셈 → 교체 (result 기준으로 재탐색)
    NSRegularExpression *leftRegex =
        [NSRegularExpression regularExpressionWithPattern:@"left:([0-9.]+)pt"
                                                  options:0
                                                    error:nil];
    NSTextCheckingResult *leftMatch =
        [leftRegex firstMatchInString:result
                              options:0
                                range:NSMakeRange(0, result.length)];
    if (leftMatch && leftMatch.numberOfRanges > 1) {
        CGFloat leftValue = [[result substringWithRange:[leftMatch rangeAtIndex:1]] floatValue];
        leftValue += addLeftValue;
        [result replaceCharactersInRange:leftMatch.range
                              withString:[NSString stringWithFormat:@"left:%gpt", leftValue]];
    }

    return [result copy];
}

- (HTMLElement *)convertToHtmlWith:(NSString *)margin
{
    if (!margin) {
        __builtin_trap();
    }
    
    HTMLElement *wrapper = [[HTMLElement alloc] initWithTagName:@"div"];
    NSMutableDictionary* att1 = [self getAtts]; // size
    NSString *sizeString = [self convertDic:att1];
    NSString *position;
    NSString *final;
    
    if ([self.pos.treatAsChar isEqualToString:@"1"]) {
        // 문자열로 처리
        NSString *display = @"display:inline-block; ";
        position = @"position:relative; ";
        position = [position stringByAppendingString:display];
        NSString *absoluteSize = [sizeString stringByAppendingString:position];
        NSString *absoluteSizeWithLocation = [absoluteSize stringByAppendingString:margin];
        final = absoluteSizeWithLocation;
    } else {
        position = @"position:absolute; ";
        NSString *absoluteSize = [sizeString stringByAppendingString:position];
        NSString *absoluteSizeMargin = [absoluteSize stringByAppendingString:margin];
        final = absoluteSizeMargin;
    }
    
    [wrapper setAttributes:[@{
        @"style" : final
    }mutableCopy]];

    


//    // margin의 left + stackSizes 누적 width 합산값을 wrapperDiv의 left로 사용
//    NSString *stackedWidth = [self sumOfStackSizes][@"width"];
//    NSString *adjustedMargin = [self marginStringByAddingTop:@"0pt"
//                                                        left:stackedWidth
//                                                    toMargin:margin];
//    NSString *sizeWithMargin;
//
//    if ([self.offset.x isEqualToString:@"0"] && [self.offset.y isEqualToString:@"0"]) {
//        sizeWithMargin = [absoluteSize stringByAppendingString:adjustedMargin];
//    } else {
//        NSString *offsetX = [self convertUnsignedIntToPt:self.offset.x];
//        NSString *offsetY = [self convertUnsignedIntToPt:self.offset.y];
//        NSString *offsetAdjustedMargin = [self marginStringByAddingTop:offsetY left:offsetX toMargin:adjustedMargin];
//        sizeWithMargin = [absoluteSize stringByAppendingString:offsetAdjustedMargin];
//    }
    
//    [wrapper setAttributes:[@{
//        @"style" : sizeWithMargin
//    }mutableCopy]];
    
    HTMLElement *picture = [self getContentHtml];
    [wrapper appendNode:picture];
    
    return wrapper;
}

- (NSMutableDictionary *)scaledSizeWithCurSz
{
    NSString *widthPt  = [self convertUnsignedIntToPt:self.curSz.width];
    NSString *heightPt = [self convertUnsignedIntToPt:self.curSz.height];

    CGFloat widthValue  = [[widthPt  stringByReplacingOccurrencesOfString:@"pt" withString:@""] floatValue];
    CGFloat heightValue = [[heightPt stringByReplacingOccurrencesOfString:@"pt" withString:@""] floatValue];

    CGFloat scaE1 = [self.renderingInfo.scaMatrix.e1 floatValue];
    CGFloat scaE5 = [self.renderingInfo.scaMatrix.e5 floatValue];

    return [@{
        @"width"  : [NSString stringWithFormat:@"%gpt", widthValue  * scaE1],
        @"height" : [NSString stringWithFormat:@"%gpt", heightValue * scaE5]
    } mutableCopy];
}

-(HTMLElement*)getContentHtml
{
    HTMLElement *picture = [[HTMLElement alloc] initWithTagName:@"img"];
    NSMutableDictionary* att1 = [self getAtts]; // size
    if (!att1) {
        att1 = [self scaledSizeWithCurSz];
    }
    NSString *sizeString = [self convertDic:att1];
    NSString *srcString = [self imgSrc];
    
    NSString *final;
    if ([self isTreatAsChar]) {
        NSString *relative = @"position:relative; ";
        final = [relative stringByAppendingString:sizeString];
    } else {
        NSString *absolute = @"position:absolute; ";
        final = [absolute stringByAppendingString:sizeString];
    }
    [picture setAttributes:[@{
        @"style" : final,
        @"src" : srcString
    } mutableCopy]];
    return picture;
}

- (BOOL)isTreatAsChar
{
    return [self.pos.treatAsChar isEqualToString:@"1"] ? TRUE : FALSE;
}


@end

NS_ASSUME_NONNULL_END
