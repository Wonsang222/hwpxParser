//
//  HH_Margin.m
//  HwpxParser
//
//  Created by 인스웨이브 on 11/12/25.
//

#import "HH_Margin.h"
#import "../../Extensions/NSObject+ParsingHelper.h"
#import "HH_Intent.h"
#import "HH_Left.h"
#import "HH_Right.h"
#import "HH_Prev.h"
#import "HH_Next.h""


@implementation HH_Margin

@synthesize intent;
@synthesize left;
@synthesize right;
@synthesize prev;
@synthesize next;

- (NSString *)getCssData
{
    NSMutableString *css = [NSMutableString string];
    
    // 들여쓰기
    if (self.intent) {
        css = [self buildCssString:css withKey:@"text-indent"
                         withValue: [self.intent getCSSData]];
    }
    
    // 왼쪽 여백
    if (self.left) {
        css = [self buildCssString:css withKey:@"margin-left"
                         withValue: [self.left getCSSData]];
    }
    
    // 오른쪽 여백
    if (self.right) {
        css = [self buildCssString:css withKey:@"margin-right"
                         withValue: [self.right getCSSData]];
    }
    
    // 이전 문단과 간격 (위 여백)
    if (self.prev) {
        css = [self buildCssString:css withKey:@"margin-top"
                         withValue: [self.prev getCSSData]];
    }
    
    // 다음 문단과 간격 (아래 여백)
    if (self.next) {
        css = [self buildCssString:css withKey:@"margin-top"
                         withValue: [self.next getCSSData]];
    }
    return css;
}

@end
