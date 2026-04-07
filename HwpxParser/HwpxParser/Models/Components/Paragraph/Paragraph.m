//
//  Paragraph.m
//  HwpParser
//
//  Created by WonsangHwang on 7/1/25.
//

#import "Paragraph.h"
#import "Run.h"
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
        NSLog(@"outer Paragraph logic must be modified!!");
        __builtin_trap();
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
        
        if ([self.run count] == 1) {
            Run *targetRun = [self.run firstObject];
            HTMLElement *innerDiv = wrapper.inner;
            NSDictionary *charPr = [head getCharPr:targetRun.charPrIDRef];
            NSDictionary *paraPr = [head getParaPr:self.paraPrIDRef];

            // charPr, paraPr CSS를 innerDiv style에 추가
            NSMutableString *additionalStyle = [NSMutableString string];
            for (NSString *key in paraPr) {
                [additionalStyle appendFormat:@" %@:%@;", key, paraPr[key]];
            }
            for (NSString *key in charPr) {
                [additionalStyle appendFormat:@" %@:%@;", key, charPr[key]];
            }

            NSString *existingStyle = [innerDiv attributes][@"style"];
            NSString *newStyle = [existingStyle stringByAppendingString:additionalStyle];
            [innerDiv setAttributes:[@{@"style": newStyle} mutableCopy]];
            
            NSArray<HTMLElement*> *contents = [targetRun getContentWith:margin lineseg:innerDiv align:alignString];
            if ([contents count] != 0) {
                [innerDiv appendNodes:contents];
            }
        } else {
            NSLog(@"2 run ");
            __builtin_trap();
        }
        [result addObject:wrapper];
    } else {
        NSLog(@"2 lineseg");
        __builtin_trap();
    }
    return result;
}


@end

