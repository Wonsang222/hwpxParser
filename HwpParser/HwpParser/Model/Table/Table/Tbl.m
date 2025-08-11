//
//  Table.m
//  HwpParser
//
//  Created by 인스웨이브 on 7/1/25.
//

#import "Tbl.h"
#import "Tr.h"
#import "../../../Extension/NSObject+MutableArrayInit.h"

NS_ASSUME_NONNULL_BEGIN

@implementation Tbl

@synthesize pageBreak;
@synthesize repeatHeader;
@synthesize rowCnt;
@synthesize colCnt;
@synthesize noAdjust;
@synthesize cellSpacing;
@synthesize borderFillIDRef;
@synthesize inMargin;
@synthesize cellZone;
@synthesize tr;
@synthesize label;


-(instancetype)init {
    self = [super init];
    [self initializeWithMutableArray];
    return self;
}
@end

NS_ASSUME_NONNULL_END
