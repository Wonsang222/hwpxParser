//
//  NSObject+HwpUnit.m
//  HwpParser
//
//  Created by 인스웨이브 on 7/28/25.
//

#import "NSObject+HwpUnit.h"

@implementation NSObject (HwpUnit)
-(float)convertHwpunitToPt:(NSString*) hwpUnit
{
    float floatHwpUnit = [hwpUnit floatValue];
    float floatPt = floatHwpUnit / 100.0f;
    return floatPt;
}
@end
