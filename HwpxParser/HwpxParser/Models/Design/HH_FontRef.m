//
//  HH_FontRef.m
//  HwpxParser
//
//  Created by WonsangHwang on 11/12/25.
//

#import "HH_FontRef.h"

@implementation HH_FontRef

@synthesize hangul;
@synthesize latin;
@synthesize hanja;
@synthesize japanese;
@synthesize other;
@synthesize symbol;
@synthesize user;

- (NSString *)getFont
{
    return self.hangul;
}

@end
