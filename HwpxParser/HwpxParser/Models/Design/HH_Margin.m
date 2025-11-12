//
//  HH_Margin.m
//  HwpxParser
//
//  Created by 인스웨이브 on 11/12/25.
//

#import "HH_Margin.h"
#import "../../Extensions/NSObject+ParsingHelper.h"

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
        css = [self buildCssString:css withKey:@"text-indent" withValue:[self convertUnsignedIntToPt:self.intent]];
    }
    
    // 왼쪽 여백
    if (self.left) {
        css = [self buildCssString:css withKey:@"margin-left" withValue:[self convertUnsignedIntToPt:self.left]];
    }
    
    // 오른쪽 여백
    if (self.right) {
        css = [self buildCssString:css withKey:@"margin-right" withValue:[self convertUnsignedIntToPt:self.right]];
    }
    
    // 이전 문단과 간격 (위 여백)
    if (self.prev) {
        css = [self buildCssString:css withKey:@"margin-top" withValue:[self convertUnsignedIntToPt:self.prev]];
    }
    
    // 다음 문단과 간격 (아래 여백)
    if (self.next) {
        css = [self buildCssString:css withKey:@"margin-top" withValue:[self convertUnsignedIntToPt:self.next]];
    }
    return css;
}

@end
