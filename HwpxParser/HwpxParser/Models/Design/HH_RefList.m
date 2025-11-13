//
//  HH_RefList.m
//  HwpxParser
//
//  Created by 인스웨이브 on 11/11/25.
//

#import "HH_RefList.h"
#import "HH_ParaProperties.h"

@implementation HH_RefList

@synthesize fontfaces;
@synthesize borderFills;
@synthesize charProperties;
@synthesize tabProperties;
@synthesize numberings;
@synthesize paraProperties;
@synthesize styles;
@synthesize memoProperties;

- (NSString*)getParaPr:(NSString *)num
{
    return [self.paraProperties getParaPr:num];
}

@end
