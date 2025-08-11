//
//  Sec.h
//  HwpParser
//
//  Created by 인스웨이브 on 8/1/25.
//

#import <Foundation/Foundation.h>
@class Paragraph;
#import "../Extension/NSObject+HtmlBuilder.h"

NS_ASSUME_NONNULL_BEGIN

@interface Sec : NSObject
@property(nonnull, strong) Paragraph* paragraph;
-(HTMLDocument*)createHtml;
@end

NS_ASSUME_NONNULL_END
