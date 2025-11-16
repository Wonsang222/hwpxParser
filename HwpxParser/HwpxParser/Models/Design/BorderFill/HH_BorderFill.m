//
//  HH_BorderFill.m
//  HwpxParser
//
//  Created by 인스웨이브 on 11/11/25.
//

#import "HH_BorderFill.h"
#import "HH_LeftBorder.h"
#import "HH_RightBorder.h"
#import "HH_TopBorder.h"
#import "HH_BottomBorder.h"
#import "HH_FillBrush.h"

@implementation HH_BorderFill

@synthesize identification;
@synthesize threeD;
@synthesize shadow;
@synthesize centerLine;
@synthesize breakCellSeparateLine;
@synthesize slash;
@synthesize backSlash;
@synthesize leftBorder;
@synthesize rightBorder;
@synthesize topBorder;
@synthesize bottomBorder;
@synthesize diagonal;

- (NSDictionary *)getBorderFill
{
    NSMutableDictionary *result = [@{}mutableCopy];
    
    [result addEntriesFromDictionary:[self.leftBorder getCSS]];
    [result addEntriesFromDictionary:[self.rightBorder getCSS]];
    [result addEntriesFromDictionary:[self.topBorder getCSS]];
    [result addEntriesFromDictionary:[self.bottomBorder getCSS]];
    
    if (self.fillBrush) {
        [result addEntriesFromDictionary:[self.fillBrush getCSS]];
    }
    
    return result;
}

@end
