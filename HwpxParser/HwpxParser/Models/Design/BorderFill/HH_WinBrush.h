//
//  HH_WinBrush.h
//  HwpxParser
//
//  Created by Wonsang Hwang on 11/15/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HH_WinBrush : NSObject
@property(strong, readonly) NSString *faceColor;
@property(strong, readonly) NSString *hatchColor;
@property(strong, readonly) NSString *alpha;

-(NSDictionary*)getCSS;

@end

NS_ASSUME_NONNULL_END
