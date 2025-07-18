//
//  NSObject+FilterNotNullProp.h
//  HwpParser
//
//  Created by 인스웨이브 on 7/18/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (FilterNotNullProp)
-(id)filterNotNullProp;
-(NSArray<NSString*>*)nullableProperties;
@end

NS_ASSUME_NONNULL_END
