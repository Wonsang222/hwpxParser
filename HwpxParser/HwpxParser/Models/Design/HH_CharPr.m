//
//  HH_CharPr.m
//  HwpxParser
//
//  Created by 인스웨이브 on 11/12/25.
//

#import "HH_CharPr.h"
#import "../../Extensions/NSObject+ParsingHelper.h"
#import "HH_FontRef.h"

@implementation HH_CharPr

@synthesize identification;
@synthesize height;
@synthesize textColor;
@synthesize shadeColor;
@synthesize useFontSpace;
@synthesize useKerning;
@synthesize symMark;
@synthesize borderFillIDRef;
@synthesize fontRef;
@synthesize ratio;
@synthesize spacing;
@synthesize relSz;
@synthesize offset;
@synthesize underline;
@synthesize strikeout;
@synthesize outline;
@synthesize shadow;
@synthesize parent;

- (NSDictionary *)getCSS
{
    NSMutableDictionary *res = [@{}mutableCopy];
    res[@"font-size"] = [self convertUnsignedIntToPt:self.height];
    res[@"color"] = self.textColor;
    
    NSString* fontID = [self.parent getFontWithNum:[self.fontRef hangul]];
    NSString *fontName = [self.parent getFontWithNum:fontID];
    
    res[@"font-family"] = fontName;
    
    return res;
}

@end
