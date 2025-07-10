//
//  NoteLine.h
//  HwpParser
//
//  Created by 인스웨이브 on 7/10/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NoteLine : NSObject
@property(nonnull,nonatomic, strong) NSString *length;
@property(nonnull,nonatomic, strong) NSString *type;
@property(nonnull,nonatomic, strong) NSString *width;
@property(nonnull,nonatomic, strong) NSString *color;
@end

NS_ASSUME_NONNULL_END
