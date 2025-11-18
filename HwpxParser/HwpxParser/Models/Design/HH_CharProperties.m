//
//  HH_CharProperties.m
//  HwpxParser
//
//  Created by 인스웨이브 on 11/12/25.
//

#import "HH_CharProperties.h"
#import "HH_CharPr.h"
#import "../../Extensions/NSObject+ParsingHelper.h"

@implementation HH_CharProperties

@synthesize itemCnt;
@synthesize charPr;
@synthesize contents;
@synthesize parent;

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initializeWithMutableArray];
        [self addKVO:self withMember:@"charPr"];
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                       context:(void *)context
{
    if (object) {
        if ([keyPath isEqualToString:@"charPr"]) {
            HH_CharPr *charPr = change[NSKeyValueChangeNewKey];
            [self addContents:self.contents withContent:charPr];
        }
    }
}

- (void)dealloc
{
    [self removeKVO:self withMember:@"charPr"];
}

- (NSDictionary *)getCharPr:(NSString *)num
{
    NSMutableDictionary *res = [@{}mutableCopy];
    NSPredicate* filter = [NSPredicate predicateWithFormat:@"%k == %@", @"identification", num];
    HH_CharPr *target = [[self.contents filteredArrayUsingPredicate:filter] firstObject];
    NSDictionary *targetCSS = [target getCSS];
    // borderFill
    NSString *borderFillID = [target borderFillIDRef];
    NSDictionary *borderCSS = [parent getBorderFill:borderFillID];
    
    [res addEntriesFromDictionary:borderCSS];
    [res addEntriesFromDictionary:targetCSS];
    
    return res;
}

- (NSString *)getFontWithNum:(NSString *)num
{
    return [self.parent getFontWithNum:num];
}

@end
