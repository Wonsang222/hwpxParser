//
//  Run.m
//  HwpParser
//
//  Created by 인스웨이브 on 7/1/25.
//

#import "Run.h"

#import "SecPr/SecPr.h"
#import "../Pic/Pic.h"
#import "SecPr/LineNumberShape.h"
#import "SecPr/PagePr.h"
#import "SecPr/Note/FootNotePr.h"
#import "SecPr/Note/EndNotePr.h"
#import "../Table/Tbl.h"

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

- (BOOL)hasSecPr
{
    if (self.secPr) {
        return YES;
    }
    return NO;
}

- (HTMLElement *)getPaper
{
    return [self.secPr getHtml];
}

- (HTMLElement * _Nonnull)convertToHTML {
    HTMLElement* paper;
        
    int count = (int) [self.contents count] - 1;
    
    for (int i = 0 ; i <= count ; i++) {
        id target = [self.contents objectAtIndex:i];
        if ([target respondsToSelector:@selector(convertToHtml)]) {
            if (!paper) {
                paper = [target getHtml];
                continue;
            }
            [paper appendNode:[target convertToHtml]];
        }
    }
    
    return paper;
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
            Pic* t = change[NSKeyValueChangeNewKey];
            if (t && ![t isEqual:[NSNull null]]) {
                [self.contents addObject:t];
            }
        }
    }
    return;
}

// secPr이 먼저 있는지 없는지가 젤 중요
// 용지를 정의하기 때문
// 다시 해야함



-(void)dealloc
{
    @try {
          [self removeObserver:self forKeyPath:@"text"];
          [self removeObserver:self forKeyPath:@"pic"];
        [self removeObserver:self forKeyPath:@"secPr"];
      } @catch (NSException *exception) {
          NSLog(@"옵저버 제거 중 예외 발생: %@", exception);
      }
}



@end
