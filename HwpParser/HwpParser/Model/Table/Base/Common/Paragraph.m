//
//  Paragraph.m
//  HwpParser
//
//  Created by 인스웨이브 on 7/1/25.
//

#import "Paragraph.h"


@implementation Paragraph

@synthesize identification;
@synthesize paraPrIDRef;
@synthesize styleIDRef;
@synthesize pageBreak;
@synthesize columnBreak;
@synthesize merged;
@synthesize run;
@synthesize linesegarray;

- (HTMLElement *)convertToHtml
{
    if (self.run.secPr) {
        // 용지
        return run.secPr.pagePr.getHtml;
    } else {
        // 아닐때
        // line 배치 및 컨텐츠
        // line에 내가 배치할 글자수에 대한 정의가 있음.
        // 그림은 treataschar 가 1 일때만 글자로 치고,
        
        if ([linesegarray.lineseg count] > 1) {
            // 그룹핑을해서
            // 배치를 하고
            // 리턴 wrapper로?
            
            // 그룹은 lineseg [[]] 이런식으로 index 넘버에 맞춰서
            // text는 그대로, pic은 1개로 가정..
            
            HTMLElement* wrapper = [[HTMLElement alloc] initWithTagName:@"div"];
            
            int wordStack = 0;
            int startP = 0;
            
            for (int i = 0; i < [linesegarray.lineseg count]; i++) {
                HTMLElement* currentLine = [linesegarray.lineseg[i] convertToHtml];
                
                if (i+1 > [linesegarray.lineseg count]) {
                    // 마지막
                    while (startP <= [self.run.contents count] - 1) {
                        id content = self.run.contents[startP];
                        if ([content isKindOfClass:[Pic class]]) {
                            Pic* p = (Pic*) content;
                            HTMLElement* picHtml = [p convertToHtml];
                            [currentLine appendNode:picHtml];
                            wordStack++;
                        } else {
                            Text* t = (Text*) content;
                            int wordCount = (int)[t.content length];
                            wordStack = wordStack + wordCount;
                        }
                        startP++;
                    }
                    break;
                }
                int nextLineStartPoint = [linesegarray.lineseg[i+1].textpos intValue];
                
                while (wordStack < nextLineStartPoint) {
                    id content = self.run.contents[startP];
                    if ([content isKindOfClass:[Pic class]]) {
                        Pic* p = (Pic*) content;
                        HTMLElement* picHtml = [p convertToHtml];
                        [currentLine appendNode:picHtml];
                        wordStack++;
                    } else {
                        Text* t = (Text*) content;
                        int wordCount = (int)[t.content length];
                        wordStack = wordStack + wordCount;
                    }
                    startP++;
                }
                continue;
            }
            return wrapper;
        } else {
            // 문단이 하나일때
            Lineseg* liner = [linesegarray.lineseg firstObject];
            HTMLElement* line = [liner convertToHtml];
            
            for (id content in self.run.contents) {
                
                if ([content respondsToSelector:@selector(convertToHtml)]) {
                    HTMLElement* elem = [content convertToHtml];
                    [line appendNode:elem];
                }
            }
            return line;
        }
    }
}
@end

