//
//  Paragraph.m
//  HwpParser
//
//  Created by 인스웨이브 on 7/1/25.
//

#import "Paragraph.h"
#import "Run.h"
#import "Linesegarray.h"
#import "../Pic/Pic.h"
#import "../../Design/HH_Head.h"
#import "Lineseg.h"

@import HTMLKit;

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

- (NSMutableArray<HTMLElement *> *)convertParagraphWithHead
{
    NSMutableArray<HTMLElement*>* result = [[NSMutableArray alloc]init];
    if ([linesegarray.lineseg count] == 1 && [self.run count] == 1) {
        Lineseg *lineSeg = [linesegarray.lineseg firstObject];
//        HTMLElement *lineSegHtml = [lineSeg getOuterP:head WithID:z]
//        HTMLElement *lineSegHtml = [lineSeg getou]
    } else {
        
    }
    return result;
}

//-(NSMutableArray<HTMLElement*>*)convertParagraphWithHead:(HH_Head *)head {
//    NSMutableArray<HTMLElement*>* result = [[NSMutableArray alloc]init];
//    // lineseg1개 content 1개 일때, content가 1개일때
//    if ([linesegarray.lineseg count] == 1 && [self.run count] == 1) {
//        
//        Lineseg *lineSeg = [linesegarray.lineseg firstObject];
//        HTMLElement *lineSegHtml = [lineSeg getOuterP:head WithID:z]
//        
//        // run charpr 계산
//        Run *r = [self.run firstObject];
//        NSMutableDictionary *charPr = [[head getCharPr:r.charPrIDRef]mutableCopy];
//        NSDictionary *linesegCSS = [[linesegarray.lineseg firstObject] getOuterP:head WithID:self.paraPrIDRef];
//        [charPr addEntriesFromDictionary:linesegCSS];
//        NSString *linesegCSSString = [self convertDic:charPr];
//        // content
//        HTMLElement* content = [r getContent];
//        NSMutableDictionary* atts = [content attributes];
//        NSMutableString *originCSS = [atts[@"style"] mutableCopy];
//        NSString* final = [originCSS stringByAppendingString:linesegCSSString];
//        
//        [content setAttributes:[@{
//            @"style" : @""
//        }mutableCopy]];
//        [result addObject:content];
//    } else {
//        
//    }
//    return result;
//}
@end

