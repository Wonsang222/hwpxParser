//
//  Tr.h
//  HwpParser
//
//  Created by 인스웨이브 on 7/11/25.
//

#import <Foundation/Foundation.h>
@class Tc;

NS_ASSUME_NONNULL_BEGIN

@interface Tr : NSObject
@property(nonnull, strong) NSMutableArray<Tc*>* tc;
@end

NS_ASSUME_NONNULL_END
