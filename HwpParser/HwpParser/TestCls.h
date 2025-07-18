//
//  TestCls.h
//  HwpParser
//
//  Created by 인스웨이브 on 7/18/25.
//

#import <Foundation/Foundation.h>

@interface TestCls : NSObject
@property (nullable, strong) NSString* check;
@property (nonnull, strong) NSMutableArray* arr;

- (id _Nullable )filterNotNull;
@end

