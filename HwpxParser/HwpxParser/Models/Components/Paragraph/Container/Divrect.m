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

NS_ASSUME_NONNULL_BEGIN

@implementation Divrect

- (HTMLElement *)getContentHtml
{
    HTMLElement *div = [[HTMLElement alloc] initWithTagName:@"div"];
    NSString *line = [self.lineShape convertToHtmlWith];
    NSString *background = @"background-color: transparent ;";
    NSString *position = @"position:absolute; ";
    NSMutableDictionary *sisze = [self getAtt]; // size
    NSString *sizeString = [self convertDic:sisze];

    if (self.fillBrush) {
        
    }
    
    NSString *final = [[[position stringByAppendingString:sizeString] stringByAppendingString:background] stringByAppendingString:line];
    
    [div setAttributes:[@{
        @"style" : final
    }mutableCopy]];
    
    return div;
}

@end

NS_ASSUME_NONNULL_END
