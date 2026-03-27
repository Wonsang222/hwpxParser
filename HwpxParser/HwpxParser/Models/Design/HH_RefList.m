//
//  HH_RefList.m
//  HwpxParser
//
//  Created by WonsangHwang on 11/11/25.
//

#import "HH_RefList.h"
#import "HH_ParaProperties.h"
#import "HH_BorderFills.h"
#import "HH_CharProperties.h"
#import "HH_Fontfaces.h"

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

-(NSDictionary*_Nonnull)getCharPr:(NSString*_Nonnull)num;
{
    return [self.charProperties getCharPr:num];
}

- (NSString *)getFontWithNum:(NSString *)num
{
    return [self.fontfaces getFontWithNum:num];
}

@end
