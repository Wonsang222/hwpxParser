//
//  RenderingManager.m
//  HwpxParser
//
//  Created by Wonsang Hwang on 8/15/25.
//

#import "RenderingManager.h"

NS_ASSUME_NONNULL_BEGIN

@implementation RenderingManager
+(HTMLDocument*)render:(Sec*)sec
{
    HTMLDocument* doc = [sec convertHtml];
    return doc;
}

@end

NS_ASSUME_NONNULL_END
