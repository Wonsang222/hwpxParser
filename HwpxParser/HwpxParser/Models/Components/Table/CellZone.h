//
//  CellZone.h
//  HwpParser
//
//  Created by 인스웨이브 on 7/11/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CellZone : NSObject
@property(strong, nonatomic, nonnull) NSString* startRowAddr;
@property(strong, nonatomic, nonnull) NSString* startColAddr;
@property(strong, nonatomic, nonnull) NSString* endRowAddr;
@property(strong, nonatomic, nonnull) NSString* endColAddr;
@property(strong, nonatomic, nonnull) NSString* borderFillIDRef;
@end

NS_ASSUME_NONNULL_END
