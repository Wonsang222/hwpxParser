//
//  Draw.m
//  HwpParser
//
//  Created by 인스웨이브 on 7/17/25.
//

#import "Draw.h"
#import "../Model/Table/Base/Common/Paragraph.h"

NS_ASSUME_NONNULL_BEGIN

@implementation Draw

+(NSString*)convertHwpunitToPt:(NSString*)hwpunit
{
    float unit = [hwpunit floatValue];
    float pt = unit / 100.0f;
    NSNumber* nsPt = [NSNumber numberWithFloat:pt];
    return [nsPt stringValue];
}


+(void)parseRun:(Run*)run withHtml:(HTMLDocument*)doc
{
    // 구역정보
    
    
    // draw
}

+(void)parseSecPr:(SecPr*)secPr
{
    // secpr은 한개인가?
    HTMLDocument* html = [self createHtml];
    
    HTMLElement* mainDiv = [self drawMainDiv:secPr.pagePr];
    [html appendNode:mainDiv];
    // container on main
    HTMLElement* containerDiv = [self drawContainerDiv:secPr.pagePr];
    [mainDiv appendNode:containerDiv];
    
    
    
    
}

+(HTMLElement*)drawMainDiv:(PagePr*)pr
{
    // 한글에서 정의하는 용지 사이즈를 그리는 태그
    HTMLElement* div = [[HTMLElement alloc] initWithTagName:@"div"];
    
    NSString* width = pr.width;
    NSString* height = pr.height;
    
    NSMutableDictionary *size = [@{@"width": width,
                                 @"height": height} mutableCopy];
    
    [div setAttributes:size];
        
    return div;
}

// 이 태그에 추가해야함.
+(HTMLElement*)drawContainerDiv:(PagePr*)pr
{
    // 용지 사이즈 위에 마진이 포함된 진짜 컨텐츠가 들어가는 태그
    HTMLElement* div = [[HTMLElement alloc] initWithTagName:@"div"];
    Margin* margin = pr.margin;
    
    NSMutableDictionary *size = [@{@"margin-top": margin.top,
                                 @"margin-right": margin.right,
                                   @"margin-left" : margin.left,
                                   @"margin-bottom" : margin.bottom
                                 } mutableCopy];
    
    [div setAttributes:size];
    return div;
}

//+(HTMLElement*) createPic:(Pic*)picModel
//{
//    HTMLElement* pic = [[HTMLElement alloc] initWithTagName:@"pic"];
//    
//    // attribute 모아서 한방에
//    
//    // size
//    Sz* size = picModel.sz;
//    NSString* cssSize = [size cs];
//    
//    
//    return pic;
//}

+(HTMLDocument *) createHtml
{
    HTMLDocument *doc = [[HTMLDocument alloc] init];
    
    HTMLElement *html = [[HTMLElement alloc] initWithTagName:@"html"];
    HTMLElement *head = [[HTMLElement alloc] initWithTagName:@"head"];
    HTMLElement *title = [[HTMLElement alloc] initWithTagName:@"title"];
    [title setTextContent:@"Testing Attention Plz"];
    HTMLElement *charset = [[HTMLElement alloc] initWithTagName:@"meta" attributes:@{@"charset" : @"utf-8"}];
    HTMLElement *body = [[HTMLElement alloc] initWithTagName:@"body"];
    
    [head appendNode:title];
    [head appendNode:charset];
    [html appendNode:head];
    [html appendNode:body];
    [doc appendNode:html];
    
    return doc;
}

+ (HTMLElement *)createTbl:(Tbl *)table
{
    HTMLElement *tbl = [[HTMLElement alloc] initWithTagName:@"table" attributes:@{@"style" : @"border-collapse: collapse;"}];
    
    for (id tr in table.tr) {
        
    }
    
   
        
    return tbl;
}


//-(HTMLElement *) parseSubList: (SubList*) sub
//{
//    // sublist는 paragraph container it seeems like nothing to raise
//    for (id paragraph in sub.paragraph) {
//       
//    }
//}
//
//-(HTMLElement *) parseSubList: (Paragraph*) paragraph
//{
//    // Run Container
//  // null이 아닌 객체.
//    
//}

@end

NS_ASSUME_NONNULL_END
