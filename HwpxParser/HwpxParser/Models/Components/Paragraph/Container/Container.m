//
//  Container.m
//  HwpxParser
//
//  Created by Wonsang Hwang on 4/9/26.
//

#import "Container.h"
#import "../../../../Extensions/NSObject+ParsingHelper.h"
#import "../../../../Models/Components/Pic/Pic.h"

@implementation Container

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initializeWithMutableArray];
        [self addObserver:self forKeyPath:@"pic" options:(NSKeyValueObservingOptionNew) context:NULL];
        [self addObserver:self forKeyPath:@"divrect" options:(NSKeyValueObservingOptionNew) context:NULL];
    }
    return self;
}

- (void)dealloc
{
    @try {
        [self removeObserver:self forKeyPath:@"pic"];
        [self removeObserver:self forKeyPath:@"divrect"];
      } @catch (NSException *exception) {
          NSLog(@"옵저버 제거 중 예외 발생: %@", exception);
      }
}

-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                      context:(void *)context
{
    if (object == self) {
        
        if ([keyPath isEqualToString:@"pic"]) {
            Pic* t = change[NSKeyValueChangeNewKey];
            if (t && ![t isEqual:[NSNull null]]) {
                [self.contents addObject:t];
            }
        } else if ([keyPath isEqualToString:@"divrect"]) {
//            Pic* t = change[NSKeyValueChangeNewKey];
//            if (t && ![t isEqual:[NSNull null]]) {
//                [self.contents addObject:t];
//            }
        }
    }
    return;
}
@end
