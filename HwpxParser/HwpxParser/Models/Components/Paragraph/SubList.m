//
//  SubList.m
//  HwpParser
//
//  Created by WonsangHwang on 7/1/25.
//

#import "SubList.h"
#import "../../../Extensions/NSObject+ParsingHelper.h"
#import "Paragraph.h"
#import "../../../main.h"
#import "../../WrapperP.h"
#import "../../MarginSender.h"
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

-(instancetype) init
{
    self = [super init];
    [self initializeWithMutableArray];
    return self;
}

- (NSMutableArray<HTMLElement *> *)convertToHtml
{
    NSMutableArray* result = [[NSMutableArray alloc] init];
        
    for (int i = 0 ; i < [self.paragraph count] ; i++) {
        Paragraph *p = self.paragraph[i];
        
        NSArray *elements = [p convertParagraphWithHead];
        // add Sublist CSS
        for (WrapperP *element in elements) {
            // atts
//            NSMutableDictionary *atts = [element attributes];
//            NSString *style = atts[@"style"];
//            style = [style stringByAppendingString:lineWrapCSSString];
            // 포인터라서 된건가..?
            [result addObject:element];
        }
//        result = [elements mutableCopy];
    }
    return result;
}

- (NSMutableArray<HTMLElement *> *)convertToHtml:(MarginSender *)margin
{
    NSMutableArray* result = [[NSMutableArray alloc] init];
    for (int i = 0 ; i < [self.paragraph count] ; i++) {
        Paragraph *p = self.paragraph[i];
        NSArray *contents = [p convertParagraphWithHeadFromSubList:margin align:self.vertAlign];
        for (WrapperP *element in contents) {
            [result addObject:element];
        }
    }

    return result;
}


@end
