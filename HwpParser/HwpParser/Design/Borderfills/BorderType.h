//
//  Bordertype.h
//  HwpParser
//
//  Created by 인스웨이브 on 7/25/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BorderType : NSObject
@property(strong, nonatomic) NSString* type;
@property(strong, nonatomic) NSString* width;
@property(strong, nonatomic) NSString* color;
@end

NS_ASSUME_NONNULL_END
