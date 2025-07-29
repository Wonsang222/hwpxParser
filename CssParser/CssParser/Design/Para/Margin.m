//
//  Margin.m
//  CssParser
//
//  Created by 인스웨이브 on 7/29/25.
//

#import "Margin.h"

NS_ASSUME_NONNULL_BEGIN

@implementation Margin

@synthesize intent;
@synthesize left;
@synthesize right;
@synthesize prev;
@synthesize next;

- (NSMutableDictionary *)getCSS
{
    int val = [self.intent.value intValue];
    NSMutableDictionary* result = [@{} mutableCopy];
    if (val > 0) {
        //들여쓰기
        NSString* stringVal = [NSString stringWithFormat:@"%.2fpt", val / 100.0f];
        result = [@{
            @"text-indent" : stringVal
        } mutableCopy];
    } else if ( val < 0) {
        // 내어쓰기
        int plusValue = val * -1;
        NSString* plusVal = [NSString stringWithFormat:@"%.2fpt", plusValue / 100.0f];
        NSString* minusVal = [NSString stringWithFormat:@"-%.2fpt", plusValue / 100.0f];
        result = [@{
            @"text-indent" : minusVal,
            @"padding-left" : plusVal
        } mutableCopy];
    }
    return result;
}

@end

NS_ASSUME_NONNULL_END
