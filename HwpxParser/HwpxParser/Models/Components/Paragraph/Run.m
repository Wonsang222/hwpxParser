//
//  Run.m
//  HwpParser
//
//  Created by WonsangHwang on 7/1/25.
//

#import "Run.h"
#import "SecPr/SecPr.h"
#import "../Pic/Pic.h"
#import "SecPr/LineNumberShape.h"
#import "SecPr/PagePr.h"
#import "SecPr/Note/FootNotePr.h"
#import "SecPr/Note/EndNotePr.h"
#import "../Table/Tbl.h"
#import "../../../Models/WrapperP.h"
@import HTMLKit;

@implementation Run

@synthesize charPrIDRef;
@synthesize charTcId;
@synthesize secPr;
@synthesize contents;

-(instancetype)init
{
    self = [super init];
    [self initializeWithMutableArray];
    // 옵저버 설정
    [self addObserver:self
           forKeyPath:@"text"
              options:(NSKeyValueObservingOptionNew) context:NULL];
    
    [self addObserver:self
           forKeyPath:@"pic"
              options:(NSKeyValueObservingOptionNew) context:NULL];
    
    [self addObserver:self
           forKeyPath:@"tbl"
              options:(NSKeyValueObservingOptionNew) context:NULL];
    
    return self;
}

// Sec에서 호출되는 메서드
- (WrapperP *)getContent
{
    id mainContent = [self.contents firstObject];

    if (![mainContent respondsToSelector:@selector(convertToHtml)]) {
        NSLog(@"🤔 No convertToHtml Method at Run | contents: %@", [self.contents description]);
        __builtin_trap();
    }

    id result = [mainContent convertToHtml];

    if ([result isKindOfClass:[WrapperP class]]) {
        return result;
    }

    WrapperP *wrapper = [WrapperP new];
    wrapper.outer = result;
    wrapper.inner = result;
    return wrapper;
}

// Paragraph 안에서 호출되는 메서드
- (NSArray *)getContentWith:(NSString *)margin
{
    NSMutableArray *contents = [@[] mutableCopy];

    if ([self.contents count] == 1) {
        id targetContent = [self.contents firstObject];
        if ([targetContent respondsToSelector:@selector(convertToHtmlWith:)]) {
            HTMLElement* target = [targetContent convertToHtmlWith:margin];
            [contents addObject:target];
        } else {
            NSLog(@"🤔 No convertToHtml Method at Run | contents: %@", [self.contents valueForKey:@"description"]);
            __builtin_trap();
        }
        return contents;
    }

    int index = 0;
    NSMutableArray<NSMutableDictionary*> *sizes = [NSMutableArray new];
    // Run에서 Contents 개수가 1개 이상이면,
    for (id content in self.contents) {
        if ([content respondsToSelector:@selector(convertToHtmlWith:)] && [content respondsToSelector:@selector(getAtts)]) {
            if (index != 0) {
                // 여기는 set
                [content setStackSizes:sizes];
            }
            HTMLElement* target = [content convertToHtmlWith:margin];
            [contents addObject:target];
            [sizes addObject:[content getAtts]];
        } else {
            NSLog(@"🤔 No convertToHtml Method at Run | contents: %@", [self.contents valueForKey:@"description"]);
            __builtin_trap();
        }
        index++;
    }
    return contents;

}

- (BOOL)hasSecPr
{
    if (self.secPr) {
        return YES;
    }
    return NO;
}

- (NSMutableDictionary *)getPaper
{
    return [self.secPr getPaperAtt];
}


-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                      context:(void *)context
{
    if (object == self) {
        
        if ([keyPath isEqualToString:@"text"]) {
            Text* t = change[NSKeyValueChangeNewKey];
            if (t && ![t isEqual:[NSNull null]] && [t.content length] >= 1) {
                [self.contents addObject:t];
            }
        } else if ([keyPath isEqualToString:@"pic"]) {
            Pic* t = change[NSKeyValueChangeNewKey];
            if (t && ![t isEqual:[NSNull null]]) {
                [self.contents addObject:t];
            }
        } else if ([keyPath isEqualToString:@"tbl"]) {
            Tbl* t = change[NSKeyValueChangeNewKey];
            if (t && ![t isEqual:[NSNull null]]) {
                [self.contents addObject:t];
            }
        }
    }
    return;
}

-(void)dealloc
{
    @try {
          [self removeObserver:self forKeyPath:@"text"];
          [self removeObserver:self forKeyPath:@"pic"];
        [self removeObserver:self forKeyPath:@"tbl"];
      } @catch (NSException *exception) {
          NSLog(@"옵저버 제거 중 예외 발생: %@", exception);
      }
}

@end
