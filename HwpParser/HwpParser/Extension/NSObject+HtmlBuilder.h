//
//  NSObject+HtmlBuilder.h
//  HwpParser
//
//  Created by 인스웨이브 on 8/11/25.
//

#import <Foundation/Foundation.h>
#import "HTMLDocument.h"
#import "HTMLElement.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (HtmlBuilder)
-(HTMLDocument*)buildHtml;
@end

NS_ASSUME_NONNULL_END
