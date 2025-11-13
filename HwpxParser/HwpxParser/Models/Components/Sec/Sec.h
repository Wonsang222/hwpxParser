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
@class HH_Head;

@interface Sec : NSObject
@property(nonnull, strong) NSMutableArray<Paragraph*>* paragraph;
@property(nullable, strong) HH_Head* head;
-(NSMutableArray<HTMLElement*>*) converToHtml;
@end

NS_ASSUME_NONNULL_END
