//
//  NSObject+AttributeSetter.h
//  HwpParser
//
//  Created by Wonsang Hwang on 8/10/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (AttributeSetter)
-(NSString*)createAttribute:(NSMutableDictionary*)dic;
@end

NS_ASSUME_NONNULL_END
