//
//  Tr.h
//  HwpxParser
//
//  Created by Wonsang Hwang on 8/13/25.
//

#import <Foundation/Foundation.h>
#import "Tc.h"

NS_ASSUME_NONNULL_BEGIN

@interface Tr : NSObject
@property(strong)NSMutableArray<Tc*>* tc;
@end

NS_ASSUME_NONNULL_END
