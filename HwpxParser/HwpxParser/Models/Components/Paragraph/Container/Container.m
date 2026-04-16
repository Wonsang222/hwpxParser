//
//  Container.m
//  HwpxParser
//
//  Created by Wonsang Hwang on 4/9/26.
//

#import "Container.h"
#import "../../../../Extensions/NSObject+ParsingHelper.h"
#import "../../../../Models/Components/Pic/Pic.h"
#import "Divrect.h"
#import "../../../../Models/Base/AbstractShape/Pos.h"
@import HTMLKit;

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

- (HTMLElement *)getContentHtml
{
    HTMLElement *div = [[HTMLElement alloc] initWithTagName:@"div"];
    NSMutableDictionary *size = [self getAtt];
    NSString *sizeString = [self convertDic:size];
    NSString *position;
    
    if ([self isTreatAsChar]) {
        NSString *display = @"display:inline-block; ";
        position = @"position:relative; ";
        position = [position stringByAppendingString:display];
    } else {
        position = @"position:absolute; ";
    }
    
    NSString *final = [position stringByAppendingString:sizeString];
    
    [div setAttributes:[@{
        @"style" : final
    }mutableCopy]];
    
    for (id content in self.contents) {
        
        if ([content respondsToSelector:@selector(getContentHtml)]) {
            HTMLElement *contentHtml = [content getContentHtml];
            [div appendNode:contentHtml];
        }
    }
    
    return div;
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
            Divrect* t = change[NSKeyValueChangeNewKey];
            if (t && ![t isEqual:[NSNull null]]) {
                [self.contents addObject:t];
            }
        }
    }
    return;
}



- (BOOL)isTreatAsChar
{
    return [self.pos.treatAsChar isEqualToString:@"1"] ? YES : NO;
}
@end
