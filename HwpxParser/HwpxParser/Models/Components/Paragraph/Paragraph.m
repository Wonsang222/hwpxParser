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

-(NSMutableArray<HTMLElement*>*)convertParagraph {
    NSMutableArray<HTMLElement*>* result = [[NSMutableArray alloc]init];
    // lineseg1개 content 1개 일때, content가 1개일때
    
    if ([linesegarray.lineseg count] == 1) {
        // 1개면 여기에 content 담아서 리턴
        HTMLElement* paragraph = [[linesegarray.lineseg firstObject]convertToHtml];
        // content
        for (Run *r in self.run) {
            [paragraph appendNode:[r getContent]];
        }
        [result addObject:paragraph];
    } else {
        
    }
    return result;
}
@end

