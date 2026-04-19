//
//  AbstractShapeObjectType.m
//  HwpxParser
//
//  Created by WonsangHwang on 8/12/25.
//

#import "AbstractShapeObjectType.h"
#import "Sz.h"
#import "Pos.h"
#import "OutMargin.h"
#import "../../../Extensions/NSObject+ParsingHelper.h"
@import HTMLKit;

NS_ASSUME_NONNULL_BEGIN

@implementation AbstractShapeObjectType

@synthesize identification;
@synthesize zOrder;
@synthesize numberingType;
@synthesize textWrap;
@synthesize textFlow;
@synthesize lock;
@synthesize dropcapstyle;

@synthesize sz;
@synthesize pos;
@synthesize outMargin;
//@synthesize caption;
//@synthesize shapeComment;

- (HTMLElement *)getWrapperDiv
{
    HTMLElement *div = [[HTMLElement alloc] initWithTagName:@"div"];
    NSString *cssString = [NSString stringWithFormat:@"height:%@; width:%@; top:%@; left:%@; position:absolute;",
                           [self convertUnsignedIntToPt:self.sz.height],
                           [self convertUnsignedIntToPt:self.sz.width],
                           [self convertUnsignedIntToPt:self.outMargin.top],
                           [self convertUnsignedIntToPt:self.outMargin.left]
    ];
    
    [div setAttributes:[@{
        @"style" : cssString
    }mutableCopy]];
    return div;
}

- (NSMutableDictionary *)getAtt
{
    NSMutableDictionary* sizes = [self.sz getAtt];
    return sizes;
}

- (NSString *)getSize
{
    NSString *width = [self convertUnsignedIntToPt:self.sz.width];
    NSString *height = [self convertUnsignedIntToPt:self.sz.height];
    
    return [NSString stringWithFormat:@"width:%@; height:%@;", width, height];
}

- (NSMutableDictionary *)getOMargin
{
    NSMutableDictionary *result = [@[]mutableCopy];
    NSString *top = [self convertUnsignedIntToPt:self.outMargin.top] ?: @"0";
    NSString *left = [self convertUnsignedIntToPt:self.outMargin.left] ?: @"0";
    NSString *right = [self convertUnsignedIntToPt:self.outMargin.right] ?: @"0";
    NSString *bottom = [self convertUnsignedIntToPt:self.outMargin.bottom] ?: @"0";
    
    result[@"top"] = top;
    result[@"left"] = left;
    result[@"right"] = right;
    result[@"bottom"] = bottom;
    
    return result;
}

- (NSMutableDictionary *)getCSS
{
    NSMutableDictionary* result = [@{}mutableCopy];
    // fuck z order
    NSDictionary* oMargin = [self.outMargin getAtt];
    NSDictionary* size = [self.sz getAtt];
    
    result[@"z-index"] = self.zOrder;
    [result addEntriesFromDictionary:oMargin];
    [result addEntriesFromDictionary:size];
    
    return result;
}

@end

NS_ASSUME_NONNULL_END
