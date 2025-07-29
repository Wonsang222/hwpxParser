//
//  Border.h
//  CssParser
//
//  Created by Wonsang Hwang on 7/29/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Border : NSObject

@property(nonnull, strong) NSString* borderFillIDRef;
@property(nonnull, strong) NSString* offsetLeft;
@property(nonnull, strong) NSString* offsetRight;
@property(nonnull, strong) NSString* offsetTop;
@property(nonnull, strong) NSString* offsetBottom;
@property(nonnull, strong) NSString* connect;
@property(nonnull, strong) NSString* ignoreMargin;

@end

NS_ASSUME_NONNULL_END
