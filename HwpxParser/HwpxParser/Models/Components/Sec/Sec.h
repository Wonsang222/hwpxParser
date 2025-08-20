//
//  Sec.h
//  HwpxParser
//
//  Created by Wonsang Hwang on 8/15/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class HTMLDocument;
@class HTMLElement;
@class Paragraph;
@interface Sec : NSObject
@property(nonnull, strong)  NSMutableArray<Paragraph*>* paragraph;
-(HTMLDocument*)convertHtml;

@end

NS_ASSUME_NONNULL_END
