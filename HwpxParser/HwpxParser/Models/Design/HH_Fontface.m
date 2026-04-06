//
//  HH_Fontface.m
//  HwpxParser
//
//  Created by WonsangHwang on 11/11/25.
//

#import "HH_Fontface.h"
#import "../../Extensions/NSObject+ParsingHelper.h"
#import "HH_Font.h"

@implementation HH_Fontface

@synthesize fontCnt;
@synthesize lang;
@synthesize font;
@synthesize contents;

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initializeWithMutableArray];
        [self addObserver:self forKeyPath:@"font" options:NSKeyValueObservingOptionNew context:NULL];
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                       context:(void *)context
{
    if (object == self) {
        if ([keyPath isEqualToString:@"font"]) {
            HH_Font *font = change[NSKeyValueChangeNewKey];
            if (font) {
                [self.contents addObject:font];
            }
        }
    }
}

- (void)dealloc
{
    [self removeObserver:self forKeyPath:@"font"];
}

- (NSString *)getFontWithNum:(NSString *)num
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"identification == %@", num];
    HH_Font *font = [[self.contents filteredArrayUsingPredicate:predicate] firstObject];
    return font.face;
}

@end
