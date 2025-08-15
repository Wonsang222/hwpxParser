//
//  Sec.h
//  HwpxParser
//
//  Created by Wonsang Hwang on 8/15/25.
//

#import <Foundation/Foundation.h>
@import HTMLKit;
NS_ASSUME_NONNULL_BEGIN
@class Paragraph;
@interface Sec : NSObject
@property(nonnull, strong) Paragraph* paragraph;
-(HTMLDocument*)convertHtml;
@end

NS_ASSUME_NONNULL_END
