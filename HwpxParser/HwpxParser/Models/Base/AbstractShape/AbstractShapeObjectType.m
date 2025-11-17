//
//  AbstractShapeObjectType.m
//  HwpxParser
//
//  Created by 인스웨이브 on 8/12/25.
//

#import "AbstractShapeObjectType.h"
#import "Sz.h"
#import "Pos.h"
#import "OutMargin.h"


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

- (NSMutableDictionary *)getAtt
{
    NSMutableDictionary* sizes = [self.sz getAtt];
    NSMutableDictionary* outMargins = [self.outMargin getAtt];
    
    [sizes addEntriesFromDictionary:outMargins];
    return sizes;
}

- (NSMutableArray<NSString *> *)getSize
{
    NSMutableArray *result = [[NSMutableArray alloc] init];
    NSString* height = self.sz.height;
    NSString* width = self.sz.width;
    
    [result addObject:height];
    [result addObject:width];
    return result;
}

- (NSMutableArray<NSString *> *)getOMargin
{
    NSMutableArray *result = [[NSMutableArray alloc] init];
    NSString *top = self.outMargin.top ?: @"0";
    NSString *left = self.outMargin.left ?: @"0";
    NSString *right = self.outMargin.right ?: @"0";
    NSString *bottom = self.outMargin.bottom ?: @"0";
    
    
    [result addObject:top];
    [result addObject:left];
    [result addObject:right];
    [result addObject:bottom];
    
    return result;
}

- (NSMutableDictionary *)getCSS
{
    NSMutableDictionary* result = [@{}mutableCopy];
    // fuck z order
    NSDictionary* oMargin = [self.outMargin getAtt];
    NSDictionary* size = [self.sz getAtt];
    
    [result addEntriesFromDictionary:oMargin];
    [result addEntriesFromDictionary:size];
    
    return result;
}

@end

NS_ASSUME_NONNULL_END
