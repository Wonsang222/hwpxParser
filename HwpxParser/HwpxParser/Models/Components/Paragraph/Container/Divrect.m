//
//  Divrect.m
//  HwpxParser
//
//  Created by Wonsang Hwang on 4/9/26.
//

#import "Divrect.h"
@import HTMLKit;
#import "../../../Components/Pic/LineShape.h"
#import "../../../../Extensions/NSObject+ParsingHelper.h"
#import "../../../../Models/Base/AbstractShapeComponent/Offset.h"
#import "../../../../Models/Base/AbstractShapeComponent/CurSz.h"
#import "../../../../Models/Base/AbstractShapeComponent/OrgSz.h"

NS_ASSUME_NONNULL_BEGIN

@implementation Divrect

- (HTMLElement *)getContentHtml
{
    HTMLElement *div = [[HTMLElement alloc] initWithTagName:@"div"];

    // 크기: curSz 기준
    NSString *width  = [self convertUnsignedIntToPt:self.curSz.width];
    NSString *height = [self convertUnsignedIntToPt:self.curSz.height];
    NSString *sizeString = [NSString stringWithFormat:@"width:%@; height:%@; ", width, height];

    // 위치: offset(container orgSz 좌표계) × (curSz/orgSz) 비율 → 렌더링 pt 위치
    // scaMatrix는 두 개가 존재할 수 있어 파서가 마지막 값을 덮어쓰므로 사용 불가.
    // curSz / orgSz = 첫 번째 scaMatrix(container 스케일)와 동일한 값을 안정적으로 구할 수 있음.
    // convertUnsignedIntToPt가 signed 처리를 이미 담당 (예: 4294965568 → -17.28pt)
    CGFloat scaleX = [self.curSz.width floatValue] / [self.orgSz.width floatValue];
    CGFloat scaleY = [self.curSz.height floatValue] / [self.orgSz.height floatValue];

    NSString *offsetXPt = [self convertUnsignedIntToPt:self.offset.x];
    NSString *offsetYPt = [self convertUnsignedIntToPt:self.offset.y];
    CGFloat offsetX = [[offsetXPt stringByReplacingOccurrencesOfString:@"pt" withString:@""] floatValue];
    CGFloat offsetY = [[offsetYPt stringByReplacingOccurrencesOfString:@"pt" withString:@""] floatValue];

    NSString *left = [NSString stringWithFormat:@"%gpt", offsetX * scaleX];
    NSString *top  = [NSString stringWithFormat:@"%gpt", offsetY * scaleY];
    NSString *positionString = [NSString stringWithFormat:@"position:absolute; left:%@; top:%@; ", left, top];

    // 테두리
    NSString *line = self.lineShape ? [self.lineShape convertToHtmlWith] : @"";

    // 배경
    NSString *background = @"background-color:transparent; ";

    NSString *final = [[[positionString stringByAppendingString:sizeString]
                        stringByAppendingString:background]
                       stringByAppendingString:line];

    [div setAttributes:[@{@"style": final} mutableCopy]];

    return div;
}

@end

NS_ASSUME_NONNULL_END
