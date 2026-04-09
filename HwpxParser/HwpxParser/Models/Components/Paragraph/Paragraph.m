//
//  Paragraph.m
//  HwpParser
//
//  Created by WonsangHwang on 7/1/25.
//

#import "Paragraph.h"
#import "Run.h"
#import "Lineseg.h"
#import "Linesegarray.h"
#import "../Pic/Pic.h"
#import "../../Design/HH_Head.h"
#import "Lineseg.h"
#import "../../WrapperP.h"
#import "../../MarginSender.h"
#import "../../Design/HH_Head.h"
@import HTMLKit;

extern HH_Head *head;

@implementation Paragraph

@synthesize identification;
@synthesize paraPrIDRef;
@synthesize styleIDRef;
@synthesize pageBreak;
@synthesize columnBreak;
@synthesize merged;
@synthesize run;
@synthesize linesegarray;

-(instancetype)init
{
    self = [super init];
    [self initializeWithMutableArray];
    return self;
}

- (NSMutableDictionary *)getP
{
    NSMutableDictionary* paper;
    
    for (int i = 0 ; i < [run count] ; i++) {
        Run* targetRun = run[i];
        if (targetRun.secPr) {
            paper = [targetRun getPaper];
            break;
        }
        continue;
    }
    return paper;
}

- (BOOL)hasSecPr
{
    for (Run* r in run) {
        if ([r hasSecPr]) {
            return YES;
        }
    }
    return NO;
}

- (BOOL)isNewPage
{
    return [linesegarray isNewPage];
}

// Sec에서 호출
- (NSMutableArray<WrapperP *> *)convertParagraphWithHead
{
    NSMutableArray<WrapperP*>* result = [[NSMutableArray alloc]init];
    if ([linesegarray.lineseg count] == 1 && [self.run count] == 1) {
        Run *targetRun = [self.run firstObject];
        Lineseg *lineSeg = [linesegarray.lineseg firstObject];
        // wraapper innerDiv
        WrapperP *wrapper = [lineSeg getOuterP];
        HTMLElement *innerDiv = wrapper.inner;
        // Contents
        WrapperP *content = [targetRun getContent];
        
        // innerDiv에 Content 배치
        if (content) {
            [innerDiv appendNode:content.outer];
        }
        // result에 append
        [result addObject:wrapper];
        
    } else {
        if ([self.run count] > 1 && [linesegarray.lineseg count] > 1) {
            // 텍스트인 경우 배치
            if ([self areAllTexts]) {
                // 문단을 나눌 컷 포인트
                NSMutableArray *cutPoints = [NSMutableArray new];
                [cutPoints addObject:@"0"];
                for (Lineseg *line in linesegarray.lineseg) {
                    if (![line.textpos isEqualToString:@"0"]) {
                        [cutPoints addObject:line.textpos];
                    }
                }
                
                NSInteger next = 0;
                NSUInteger charStack = 0;
                int startIdx = 0;
                HTMLElement *pendingElement = nil; // 이전 줄에서 분할된 나머지 텍스트
                for (int i = 0; i < [cutPoints count];i++) {

                    if (i == [cutPoints count] - 1) {
                        // 마지막
                        next = NSIntegerMax;
                    } else {
                        next = [cutPoints[i+1] integerValue];
                    }

                    Lineseg *lineSeg = linesegarray.lineseg[i];
                    // wraapper innerDiv
                    WrapperP *wrapper = [lineSeg getOuterP];
                    HTMLElement *innerDiv = wrapper.inner;

                    HTMLElement *line = [[HTMLElement alloc] initWithTagName:@"span" attributes:[@{
                        @"style" : @"display:flex"
                    }mutableCopy]];

                    // 이전 줄에서 분할된 나머지가 있으면 현재 줄 앞에 배치
                    if (pendingElement) {
                        [line appendNode:pendingElement];
                        pendingElement = nil;
                    }

                    // Contents
                    for (;startIdx < [self.run count]; startIdx++) {
                        Run *targetRun = self.run[startIdx];
                        if ([targetRun.contents count] == 0) {
                            continue;
                        }
                        charStack += [targetRun.text.content length];
                        if (charStack < next) {
                            HTMLElement *content = [targetRun getContent].outer;
                            NSDictionary *charPr = [head getCharPr:targetRun.charPrIDRef];
                            NSMutableString *charStyle = [NSMutableString string];
                            for (NSString *key in charPr) {
                                [charStyle appendFormat:@" %@:%@;", key, charPr[key]];
                            }
                            [content setAttributes:[@{
                                @"style" : charStyle
                            }mutableCopy]];
                            [line appendNode:content];
                        } else if (charStack == next) {
                            // 현재 run의 텍스트가 정확히 줄바꿈 지점에서 끝남
                            // -> 현재 line에 추가하고 다음 lineseg로 이동
                            HTMLElement *content = [targetRun getContent].outer;
                            NSDictionary *charPr = [head getCharPr:targetRun.charPrIDRef];
                            NSMutableString *charStyle = [NSMutableString string];
                            for (NSString *key in charPr) {
                                [charStyle appendFormat:@" %@:%@;", key, charPr[key]];
                            }
                            [content setAttributes:[@{
                                @"style" : charStyle
                            }mutableCopy]];
                            [line appendNode:content];
                            startIdx++;
                            break;
                        } else {
                            // charStack > next: 텍스트가 줄바꿈 지점을 넘어감
                            // -> 텍스트를 분할하여 앞부분은 현재 줄, 뒷부분은 다음 줄로
                            NSDictionary *charPr = [head getCharPr:targetRun.charPrIDRef];
                            NSMutableString *charStyle = [NSMutableString string];
                            for (NSString *key in charPr) {
                                [charStyle appendFormat:@" %@:%@;", key, charPr[key]];
                            }
                            NSUInteger gap = charStack - next;
                            NSMutableArray *splitTexts = [targetRun.text splitTextAt:gap css:charStyle];
                            // 앞부분 → 현재 줄
                            [line appendNode:splitTexts[0]];
                            // 뒷부분 → 다음 줄에 배치될 pending
                            pendingElement = splitTexts[1];
                            startIdx++;
                            break;
                        }
                    }
                    [innerDiv appendNode:line];
                    // result에 append
                    [result addObject:wrapper];
                }
            } else {
                NSLog(@"No Outer Paragraph!!!! make it work");
                __builtin_trap();
            }
        } else {
            NSLog(@"outer Paragraph logic must be modified!!");
            __builtin_trap();
        }
    }
    return result;
}

// Sublist 에서 호출
- (NSMutableArray<WrapperP *> *)convertParagraphWithHeadFromSubList:(MarginSender *)margin align:(NSString *)alignString
{
    NSMutableArray<WrapperP*>* result = [[NSMutableArray alloc]init];
    
    // lineSeg에 AddMargin
    [self.linesegarray addMarginWith:margin];
    
    if ([linesegarray.lineseg count] == 1)  {
        Lineseg *lineSeg = [linesegarray.lineseg firstObject];
        WrapperP *wrapper = [lineSeg getOuterP];
        HTMLElement *innerDiv = wrapper.inner;
        NSDictionary *paraPr = [head getParaPr:self.paraPrIDRef];
        
        // paraPr CSS를 innerDiv style에 추가
        NSMutableString *paraStyle = [NSMutableString string];
        for (NSString *key in paraPr) {
            [paraStyle appendFormat:@" %@:%@;", key, paraPr[key]];
        }
        NSString *existingStyle = [innerDiv attributes][@"style"];
        [innerDiv setAttributes:[@{@"style": [existingStyle stringByAppendingString:paraStyle]} mutableCopy]];
        
        if ([self.run count] == 1) {
            Run *targetRun = [self.run firstObject];
            NSDictionary *charPr = [head getCharPr:targetRun.charPrIDRef];
            
            // charPr CSS를 innerDiv style에 추가
            NSMutableString *charStyle = [NSMutableString string];
            for (NSString *key in charPr) {
                [charStyle appendFormat:@" %@:%@;", key, charPr[key]];
            }
            NSString *currentStyle = [innerDiv attributes][@"style"];
            [innerDiv setAttributes:[@{@"style": [currentStyle stringByAppendingString:charStyle]} mutableCopy]];
            
            NSArray<HTMLElement*> *contents = [targetRun getContentWith];
            if ([contents count] != 0) {
                [innerDiv appendNodes:contents];
            }
        } else {
            // 1 lineseg + 다중 run: 각 run을 span으로 감싸 charPr 서식을 개별 적용 (한 줄 렌더링)
            for (Run *targetRun in self.run) {
                NSArray<HTMLElement*> *contents = [targetRun getContentWith	];
                if ([contents count] == 0) continue;
                
                NSDictionary *charPr = [head getCharPr:targetRun.charPrIDRef];
                if ([charPr count] > 0) {
                    NSMutableString *charStyle = [NSMutableString string];
                    for (NSString *key in charPr) {
                        [charStyle appendFormat:@" %@:%@;", key, charPr[key]];
                    }
                    HTMLElement *span = [[HTMLElement alloc] initWithTagName:@"span"];
                    [span setAttributes:[@{@"style": [charStyle copy]} mutableCopy]];
                    [span appendNodes:contents];
                    [innerDiv appendNode:span];
                } else {
                    [innerDiv appendNodes:contents];
                }
            }
        }
        [result addObject:wrapper];
    } else {
        NSLog(@"2 lineseg");
        __builtin_trap();
    }
    return result;
}

-(BOOL)areAllTexts
{
    for (Run *r in self.run) {
        // Ctrl 같은 Run이 존재
        if ([r.contents count] == 0) {
            continue;
        }
        if (![r areTexts]) {
            return NO;
        }
        
    }
    return YES;
}

@end

