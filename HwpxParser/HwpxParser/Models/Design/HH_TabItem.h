//
//  HH_TabItem.h
//  HwpxParser
//
//  Created by 인스웨이브 on 11/12/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HH_TabItem : NSObject

@property(strong) NSString *pos;
@property(strong) NSString *type;
@property(strong) NSString *leader;
@property(strong, nullable) NSString *unit;

@end

NS_ASSUME_NONNULL_END
