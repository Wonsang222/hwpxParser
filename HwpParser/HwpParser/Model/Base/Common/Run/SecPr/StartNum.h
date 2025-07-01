//
//  StartNum.h
//  HwpParser
//
//  Created by 인스웨이브 on 7/1/25.
//

#import <Foundation/Foundation.h>

@interface StartNum : NSObject

@property(nonnull,nonatomic, strong) NSString *pageStartsOn;
@property(assign) NSInteger page;
@property(assign) NSInteger pic;
@property(assign) NSInteger tbl;
@property(assign) NSInteger equation;

@end
