//
//  SubList.m
//  HwpParser
//
//  Created by WonsangHwang on 7/1/25.
//

#import "SubList.h"
#import "../../../Extensions/NSObject+ParsingHelper.h"
#import "Paragraph.h"
#import "../../../main.h"
#import "../../WrapperP.h"
@import HTMLKit;

@implementation SubList
@synthesize identification;
@synthesize textDirection;
@synthesize lineWrap;
@synthesize vertAlign;
@synthesize linkListIDRef;
@synthesize linkListNextIDRef;
@synthesize textWidth;
@synthesize textHeight;
@synthesize hasTextRef;
@synthesize hasNumRef;
@synthesize metatag;
@synthesize paragraph;

-(instancetype) init
{
    self = [super init];
    [self initializeWithMutableArray];
    return self;
}

- (NSMutableArray<HTMLElement *> *)convertToHtml
{
    NSMutableArray* result = [[NSMutableArray alloc] init];
    NSDictionary *lineWrapCSS = [self getLineWrap];
    NSString *lineWrapCSSString = [self convertDic:lineWrapCSS];
        
    for (int i = 0 ; i < [self.paragraph count] ; i++) {
        Paragraph *p = self.paragraph[i];
        
        NSArray *elements = [p convertParagraphWithHead];
        // add Sublist CSS
        for (WrapperP *element in elements) {
            // atts
//            NSMutableDictionary *atts = [element attributes];
//            NSString *style = atts[@"style"];
//            style = [style stringByAppendingString:lineWrapCSSString];
            // 포인터라서 된건가..?
            [result addObject:element];
        }
//        result = [elements mutableCopy];
    }
    return result;
}

- (NSMutableArray<HTMLElement *> *)convertToHtml:(NSString *)margin
{
    NSString *updatedMargin = [self getStyleString:margin];
    
    NSMutableArray* result = [[NSMutableArray alloc] init];
    for (int i = 0 ; i < [self.paragraph count] ; i++) {
        Paragraph *p = self.paragraph[i];
        NSArray *contents = [p convertParagraphWithHeadFromSubList:updatedMargin];
        for (WrapperP *element in contents) {
            [result addObject:element];
        }
    }

    return result;
}

-(NSString*)getStyleString:(NSString*)margin
{
    // top: 50%;  transform: translateY(-50%);
    NSString *styleString = margin;
    if ([self.vertAlign isEqualToString:@"CENTER"]) {
        NSRegularExpression *topRegex = [NSRegularExpression regularExpressionWithPattern:@"top:[0-9.]+pt;"
                                                                             options:0
                                                                               error:NULL];
        NSString *updatedTop = [topRegex stringByReplacingMatchesInString:styleString
                                                                  options:0
                                                                    range:NSMakeRange(0, styleString.length)
                                                             withTemplate:@"top: 50%; transform: translateY(-50%); "];
        NSRegularExpression *rightRegex = [NSRegularExpression regularExpressionWithPattern:@" right:[0-9.]+pt;"
                                                                             options:0
                                                                               error:NULL];
        NSString *finalStyleString = [rightRegex stringByReplacingMatchesInString:updatedTop
                                                                          options:0
                                                                            range:NSMakeRange(0, updatedTop.length)
                                                                     withTemplate:@""];
        
        NSRegularExpression *bottomRegex = [NSRegularExpression regularExpressionWithPattern:@"bottom:[0-9.]+pt;"
                                                                             options:0
                                                                               error:NULL];
        
        NSString *finStyleString = [bottomRegex stringByReplacingMatchesInString:finalStyleString options:0 range:NSMakeRange(0, finalStyleString.length) withTemplate:@""];
        return finStyleString;
    }
    return styleString;
}

-(NSDictionary*)getLineWrap
{
    NSMutableDictionary *res = [@{}mutableCopy];
    
    NSString *key = @"white-space";
    NSString *val;
    
    if ([self.lineWrap isEqualToString:@"BREAK"]) {
        val = @"normal";
    } else if ([self.lineWrap isEqualToString:@"NONE"]) {
        val = @"nowrap";
    } else {
        key = @"hyphens";
        val = @"auto";
    }
    res[key] = val;
    
    if ([self.textDirection isEqualToString:@"VERTICAL"]) {
        NSString *key2 = @"writing-mode";
        NSString *val2 = @"vertical-rl";
        res[key2] = val2;
    }
    
    return res;
}

@end
