//
//  SubList.m
//  HwpParser
//
//  Created by 인스웨이브 on 7/1/25.
//

#import "SubList.h"
#import "../../../Extensions/NSObject+ParsingHelper.h"
#import "Paragraph.h"
@import HTMLKit;

@implementation SubList
@synthesize identification;
@synthesize textDirection;
@synthesize lineWrap;
@synthesize vertAlign;
@synthesize linkListIDRef;
@synthesize linkListNextIDRef;
@synthesize textWidth;
@synthesize textHeight;
@synthesize hasTextRef;
@synthesize hasNumRef;
@synthesize metatag;
@synthesize paragraph;
@synthesize parent;

-(instancetype) init
{
    self = [super init];
    [self initializeWithMutableArray];
    return self;
}

- (NSMutableArray<HTMLElement *> *)convertToHtml
{
    NSMutableArray* result = [[NSMutableArray alloc] init];
    NSString* location = @"first";
    NSMutableDictionary* parentAtt;
    
    parentAtt = [self.parent getPaddings];
    
    for (int i = 0 ; i < [self.paragraph count] ; i++) {
        if (i != 0) {
            location = @"second";
        }
        
//        Paragraph* targetP = self.paragraph[i];
//        NSMutableArray *innerContents = [targetP convertParagraphWithHead:<#(HH_Head * _Nonnull)#>];
//        
//        for (HTMLElement* e in innerContents) {
//            [result addObject:e];
//        }
    }
    return result;
}

@end
