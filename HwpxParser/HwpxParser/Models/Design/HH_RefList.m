//
//  HH_RefList.m
//  HwpxParser
//
//  Created by 인스웨이브 on 11/11/25.
//

#import "HH_RefList.h"
#import "HH_ParaProperties.h"
#import "HH_BorderFills.h"

@implementation HH_RefList

@synthesize fontfaces;
@synthesize borderFills;
@synthesize charProperties;
@synthesize tabProperties;
@synthesize numberings;
@synthesize paraProperties;
@synthesize styles;
@synthesize memoProperties;

- (NSDictionary*)getParaPr:(NSString *)num
{
    return [self.paraProperties getParaPr:num];
}

- (NSDictionary *)getBorderFill:(NSString *)num
{
    return [self.borderFills getBorderFill:num];
}

@end
