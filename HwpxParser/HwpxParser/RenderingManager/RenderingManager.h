//
//  RenderingManager.h
//  HwpxParser
//
//  Created by Wonsang Hwang on 8/15/25.
//

#import <Foundation/Foundation.h>
@class HTMLDocument;

NS_ASSUME_NONNULL_BEGIN

@interface RenderingManager : NSObject
+(HTMLDocument*)buildHTMLDocument;
@end

NS_ASSUME_NONNULL_END
