//
//  HH_Margin.h
//  HwpxParser
//
//  Created by 인스웨이브 on 11/12/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HH_Margin : NSObject

@property(strong, nullable) NSString *intent;
@property(strong, nullable) NSString *left;
@property(strong, nullable) NSString *right;
@property(strong, nullable) NSString *prev;
@property(strong, nullable) NSString *next;

@end

NS_ASSUME_NONNULL_END
