//
//  NSObject+AttributeSetter.m
//  HwpParser
//
//  Created by Wonsang Hwang on 8/10/25.
//

#import "NSObject+AttributeSetter.h"

@implementation NSObject (AttributeSetter)
- (NSString *)createAttribute:(NSMutableDictionary *)dic
{
    NSMutableString* atts = [NSMutableString string];
    for (NSString* key in dic) {
        NSString* value = dic[key];
        
        [atts appendFormat:@"%@:%@; ", key, value];
    }
    
    return atts;
}
@end
