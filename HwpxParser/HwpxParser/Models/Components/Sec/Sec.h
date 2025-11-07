//
//  Sec.h
//  HwpxParser
//
//  Created by Wonsang Hwang on 8/15/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class HTMLElement;
@class Paragraph;
@class Tbl;

@interface Sec : NSObject
@property(nonnull, strong)  NSMutableArray<Paragraph*>* paragraph;
-(NSMutableArray<HTMLElement*>*) converToHtml;

@end

NS_ASSUME_NONNULL_END
