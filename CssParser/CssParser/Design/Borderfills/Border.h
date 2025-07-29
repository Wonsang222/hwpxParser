//
//  Border.h
//  HwpParser
//
//  Created by 인스웨이브 on 7/25/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Border : NSObject
@property(strong, nonnull) NSString* type;
@property(strong, nonnull) NSString* width;
@property(strong, nonnull) NSString* color;

@end

NS_ASSUME_NONNULL_END
