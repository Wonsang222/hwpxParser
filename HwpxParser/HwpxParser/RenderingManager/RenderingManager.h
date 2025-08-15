//
//  RenderingManager.h
//  HwpxParser
//
//  Created by Wonsang Hwang on 8/15/25.
//

#import <Foundation/Foundation.h>
@import HTMLKit;
#import "../Models/Components/Sec/Sec.h"

NS_ASSUME_NONNULL_BEGIN

@interface RenderingManager : NSObject
+(HTMLDocument*)render:(Sec*)sec;
@end

NS_ASSUME_NONNULL_END
