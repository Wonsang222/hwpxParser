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

- (NSMutableArray<NSString *> *)getSize
{
    NSMutableArray *result = [[NSMutableArray alloc] init];
    NSString* height = self.sz.height;
    NSString* width = self.sz.width;
    
    [result addObject:height];
    [result addObject:width];
    return result;
}

- (NSMutableArray<NSString *> *)getOutMargin
{
    NSMutableArray *result = [[NSMutableArray alloc] init];
    NSString *top = self.outMargin.top;
    NSString *left = self.outMargin.left;
    NSString *right = self.outMargin.right;
    NSString *bottom = self.outMargin.bottom;
    
    [result addObject:top];
    [result addObject:left];
    [result addObject:right];
    [result addObject:bottom];
    
    return result;
}

@end

NS_ASSUME_NONNULL_END
