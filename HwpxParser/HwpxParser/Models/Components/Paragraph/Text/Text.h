//
//  Text.h
//  HwpParser
//
//  Created by Wonsang Hwang on 7/15/25.
//

#import <Foundation/Foundation.h>
#import "HTMLElement.h"
@class DesignSender;

@interface Text : NSObject
@property (nullable, strong) NSString* content;
-(HTMLElement*_Nonnull)convertToHtmlWith:(NSString* _Nonnull)margin sender:(DesignSender* _Nonnull)DesignSender;
@end



