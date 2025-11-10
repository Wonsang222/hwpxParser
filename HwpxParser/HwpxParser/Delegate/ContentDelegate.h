//
//  ContentDelegate.h
//  HwpxParser
//
//  Created by 인스웨이브 on 11/10/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ContentDelegate <NSObject>
@required
-(NSMutableDictionary*)getPaddings;
@end

NS_ASSUME_NONNULL_END
