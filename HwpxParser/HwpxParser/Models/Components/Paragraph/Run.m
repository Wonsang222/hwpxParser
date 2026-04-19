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
#import "../../../Models/Components/Paragraph/Text/Text.h"
#import "../../Components/Paragraph/Container/Container.h"
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
    
    NSArray *contentsString = @[
        @"text",
        @"pic",
        @"tbl",
        @"container",
    ];
    
    for (NSString *contentString in contentsString) {
        [self addObserver:self
               forKeyPath:contentString
                  options:(NSKeyValueObservingOptionNew) context:NULL];
    }
    return self;
}

// Sec에서 호출되는 메서드
- (WrapperP *)getContent
{
    WrapperP *wrapper = [WrapperP new];
    if ([self.contents count] == 0) {
        return NULL;
    }
    
    id mainContent = [self.contents firstObject];

    if (![mainContent respondsToSelector:@selector(convertToHtml)]) {
        NSLog(@"🤔 No convertToHtml Method at Run | contents: %@", [mainContent description]);
        __builtin_trap();
    }

    id result = [mainContent convertToHtml];

    if ([result isKindOfClass:[WrapperP class]]) {
        return result;
    }
    
    wrapper.outer = result;
    wrapper.inner = result;
    return wrapper;
}


// Paragraph 안에서 호출되는 메서드
-(NSArray*_Nonnull)getContentWith
{
    NSMutableArray *contents = [@[] mutableCopy];
    
    if([self.contents count] == 0) {
        return contents;
    }

    if ([self.contents count] == 1) {
        id targetContent = [self.contents firstObject];
        if ([targetContent respondsToSelector:@selector(getContentHtml)] && [targetContent respondsToSelector:@selector(isTreatAsChar)]) {
            HTMLElement* target = [targetContent getContentHtml];
            [contents addObject:target];
        } else {
            NSLog(@"🤔 No convertToHtml Method at Run | contents: %@", [self.contents valueForKey:@"description"]);
            __builtin_trap();
        }
        return contents;
    }
    // Run에서 Contents 개수가 1개 이상이면, 즉 lineseg한개에 2개 이상의 컨텐츠가 들어갈때, -> 대다수는 inline일듯?
    for (id content in self.contents) {
        if ([content respondsToSelector:@selector(getContentHtml)] && [content respondsToSelector:@selector(isTreatAsChar)]) {
            HTMLElement* target = [content getContentHtml];
            [contents addObject:target];
        } else {
            NSLog(@"🤔 No convertToHtml Method at Run | contents: %@", [self.contents valueForKey:@"description"]);
            __builtin_trap();
        }
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
        }  else if ([keyPath isEqualToString:@"container"]) {
            Container* t = change[NSKeyValueChangeNewKey];
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

- (BOOL)areTexts
{
    for (id content in self.contents) {
        if (![content isKindOfClass:[Text class]]) {
            return FALSE;
        }
    }
    return TRUE;
}

- (BOOL)isAvailable
{
    for (id content in self.contents) {
        if (!([content isKindOfClass:[Text class]]
              || [content isKindOfClass:[Pic class]])
            || [content isKindOfClass: [Tbl class]]) {
            return FALSE;
        }
    }
    return TRUE;
}

-(void)removeSpacing
{
    [self.text removeSpacing];
}
-(void)addSpacing
{
    [self.text addSpacing];
}
-(BOOL)hasSuffixSpacing{
    return [self.text hasSuffixSpacing];
}


@end
