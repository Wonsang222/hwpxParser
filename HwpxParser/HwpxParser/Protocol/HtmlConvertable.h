//
//  HtmlConvertable.h
//  HwpxParser
//
//  Created by 인스웨이브 on 8/12/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class HTMLElement;
@protocol HtmlConvertable <NSObject>
-(HTMLElement*)getHtml;
@end

NS_ASSUME_NONNULL_END
