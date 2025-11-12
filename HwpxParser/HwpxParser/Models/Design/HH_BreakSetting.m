//
//  HH_BreakSetting.m
//  HwpxParser
//
//  Created by 인스웨이브 on 11/12/25.
//

#import "HH_BreakSetting.h"
#import "../../Extensions/NSObject+ParsingHelper.h"

@implementation HH_BreakSetting

@synthesize breakLatinWord;
@synthesize breakNonLatinWord;
@synthesize widowOrphan;
@synthesize keepWithNext;
@synthesize keepLines;
@synthesize pageBreakBefore;
@synthesize lineWrap;

-(NSMutableString*)getCssData
{
    NSMutableString *css = [NSMutableString string];

        // 영어 단어 줄바꿈
        if ([breakLatinWord isEqualToString:@"BREAK"]) {
            css = [self buildCssString:css withKey:@"word-break" withValue:@"break-all"];
        } else if ([breakLatinWord isEqualToString:@"KEEP_WORD"]) {
            css = [self buildCssString:css withKey:@"word-break" withValue:@"keep-all"];
        }

        // 줄바꿈 처리
        if ([lineWrap isEqualToString:@"BREAK"]) {
            css = [self buildCssString:css withKey:@"white-space" withValue:@"normal"];
        } else if ([lineWrap isEqualToString:@"BREAK_WORD"]) {
            css = [self buildCssString:css withKey:@"overflow-wrap" withValue:@"break-word"];
        } else if ([lineWrap isEqualToString:@"KEEP"]) {
            css = [self buildCssString:css withKey:@"white-space" withValue:@"nowrap"];
        }

        // 페이지 관련
        if ([pageBreakBefore isEqualToString:@"1"]) {
            css = [self buildCssString:css withKey:@"page-break-before" withValue:@"always"];
        }

        if ([keepWithNext isEqualToString:@"1"]) {
            css = [self buildCssString:css withKey:@"break-after" withValue:@"avoid"];
        }

        if ([keepLines isEqualToString:@"1"]) {
            css = [self buildCssString:css withKey:@"break-inside" withValue:@"avoid"];
        }

        if ([widowOrphan isEqualToString:@"1"]) {
            css = [self buildCssString:css withKey:@"orphans" withValue:@"2"];
            css = [self buildCssString:css withKey:@"windows" withValue:@"2"];
        }

        return css;
}

@end
