//
//  LineShape.m
//  HwpParser
//
//  Created by Wonsang Hwang on 7/12/25.
//

#import "LineShape.h"
#import "../../../Extensions/NSObject+ParsingHelper.h"

NS_ASSUME_NONNULL_BEGIN

@implementation LineShape

@synthesize color;
@synthesize width;
@synthesize style;
@synthesize endCap;
@synthesize headStyle;
@synthesize tailStyle;
@synthesize headfill;
@synthesize headSz;
@synthesize tailSz;
@synthesize outlineStyle;
@synthesize alpha;

- (NSString *)convertToHtmlWith:(NSString *)margin
{
    NSString *border = @"border-%@ : %@; ";
    NSString *color = [NSString stringWithFormat:border, @"color",self.color];
    NSString *style = [NSString stringWithFormat:border, @"style",self.style];
    NSString *width = [NSString stringWithFormat:border, @"width",[self convertUnsignedIntToPt:self.width]];
    NSString *result = [@[color, style, width] componentsJoinedByString:@"" ];
    
    return result;
}

@end

NS_ASSUME_NONNULL_END
