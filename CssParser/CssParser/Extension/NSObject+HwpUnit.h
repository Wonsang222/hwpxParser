//
//  NSObject+HwpUnit.h
//  HwpParser
//
//  Created by 인스웨이브 on 7/28/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (HwpUnit)
-(float)convertHwpunitToPt:(NSString*) hwpUnit;
@end

NS_ASSUME_NONNULL_END
