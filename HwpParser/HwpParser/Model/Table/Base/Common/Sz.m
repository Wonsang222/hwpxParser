//
//  Sz.m
//  HwpParser
//
//  Created by 인스웨이브 on 6/30/25.
//

#import "Sz.h"
#import "../../../../Extension/NSObject+CssString.h"
#import "../../../../Extension/NSObject+HwpUnit.h"

NS_ASSUME_NONNULL_BEGIN

@implementation Sz
@synthesize width;
@synthesize widthRelTo;
@synthesize height;
@synthesize heightRelTo;
@synthesize protect;

-(NSString *)getCssText
{
    float convertedWidth = [self convertHwpunitToPt:width];
    float convertedHeight = [self convertHwpunitToPt:height];
    NSString* result = [NSString stringWithFormat:@"width: %.2fpt; height: %.2fpt;", convertedWidth, convertedHeight];
    return result;
}

@end

NS_ASSUME_NONNULL_END
