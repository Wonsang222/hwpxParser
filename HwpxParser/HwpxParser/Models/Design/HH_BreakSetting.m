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

-(NSDictionary*)getCssData
{
    NSMutableDictionary *css = [@{}mutableCopy];

        // 영어 단어 줄바꿈
        if ([breakLatinWord isEqualToString:@"BREAK"]) {
            css[@"word-break"] = @"break-all";
        } else if ([breakLatinWord isEqualToString:@"KEEP_WORD"]) {
            css[@"word-break"] = @"keep-all";
        }
        // 줄바꿈 처리
        if ([lineWrap isEqualToString:@"BREAK"]) {
            css[@"white-space"] = @"normal";
        } else if ([lineWrap isEqualToString:@"BREAK_WORD"]) {
            css[@"overflow-wrap"] = @"break-word";
        } else if ([lineWrap isEqualToString:@"KEEP"]) {
            css[@"white-space"] = @"nowrap";
        }
        // 페이지 관련
        if ([pageBreakBefore isEqualToString:@"1"]) {
            css[@"page-break-before"] = @"always";
        }

        if ([keepWithNext isEqualToString:@"1"]) {
            css[@"break-after"] = @"avoid";
        }

        if ([keepLines isEqualToString:@"1"]) {
            css[@"break-inside"] = @"avoid";
        }

        if ([widowOrphan isEqualToString:@"1"]) {
            css[@"orphans"] = @"2";
            css[@"windows"] = @"2";
        }
        return css;
}

@end
