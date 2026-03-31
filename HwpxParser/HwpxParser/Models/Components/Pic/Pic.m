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

/// self.stackSizes (getAtts 반환값 배열) 를 순회하며 width / height 의 합산값을 반환한다.
- (NSMutableDictionary *)sumOfStackSizes
{
    CGFloat totalWidth  = 0.0f;
    CGFloat totalHeight = 0.0f;

    for (NSMutableDictionary *size in self.stackSizes) {
        NSString *widthStr  = size[@"width"];
        NSString *heightStr = size[@"height"];
        totalWidth  += [[widthStr  stringByReplacingOccurrencesOfString:@"pt" withString:@""] floatValue];
        totalHeight += [[heightStr stringByReplacingOccurrencesOfString:@"pt" withString:@""] floatValue];
    }

    return [@{
        @"width"  : [NSString stringWithFormat:@"%gpt", totalWidth],
        @"height" : [NSString stringWithFormat:@"%gpt", totalHeight]
    } mutableCopy];
}

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
        return [self convertToHtml];
    }

    NSMutableDictionary* att1 = [self getAtts]; // size
    NSString *sizeString = [self convertDic:att1];
    HTMLElement *wrapper = [[HTMLElement alloc] initWithTagName:@"div"];
    NSString *absolute = @"position: absolute; ";
    NSString *absoluteSize = [absolute stringByAppendingString:sizeString];

    // margin의 left + stackSizes 누적 width 합산값을 wrapperDiv의 left로 사용
    NSString *stackedWidth = [self sumOfStackSizes][@"width"];
    NSString *adjustedMargin = [self marginStringByAddingTop:@"0pt"
                                                        left:stackedWidth
                                                    toMargin:margin];

    NSString *sizeWithMargin;

    if ([self.offset.x isEqualToString:@"0"] && [self.offset.y isEqualToString:@"0"]) {
        sizeWithMargin = [absoluteSize stringByAppendingString:adjustedMargin];
    } else {
        NSString *offsetX = [self convertUnsignedIntToPt:self.offset.x];
        NSString *offsetY = [self convertUnsignedIntToPt:self.offset.y];
        NSString *offsetAdjustedMargin = [self marginStringByAddingTop:offsetY left:offsetX toMargin:adjustedMargin];
        sizeWithMargin = [absoluteSize stringByAppendingString:offsetAdjustedMargin];
    }
    
    [wrapper setAttributes:[@{
        @"style" : sizeWithMargin
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
