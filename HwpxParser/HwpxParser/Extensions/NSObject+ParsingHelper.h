//
//  NSObject+ParsingHelper.h
//  HwpxParser
//
//  Created by Wonsang Hwang on 8/13/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (ParsingHelper)
-(void)initializeWithMutableArray;
-(NSString*)convertUnsignedIntToPt:(NSString*)val;
-(NSString*)createAttribute:(NSMutableDictionary*)dic;
@end

NS_ASSUME_NONNULL_END
