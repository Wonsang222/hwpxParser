//
//  Sec.m
//  HwpParser
//
//  Created by 인스웨이브 on 8/1/25.
//

#import "Sec.h"
#import "Table/Base/Common/Paragraph.h"

NS_ASSUME_NONNULL_BEGIN

@implementation Sec

@synthesize paragraph;

-(HTMLDocument*)createHtml
{
    HTMLDocument* doc = [self buildHtml];
    
    
//    [[doc body] appendNode:elem];
    
    return doc;
}
@end

NS_ASSUME_NONNULL_END
