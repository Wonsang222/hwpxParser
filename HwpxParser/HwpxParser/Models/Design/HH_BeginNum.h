//
//  HH_BeginNum.h
//  HwpxParser
//
//  Created by 인스웨이브 on 11/11/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HH_BeginNum : NSObject
@property(strong, nonatomic) NSString* page;
@property(strong, nonatomic) NSString* footnote;
@property(strong, nonatomic) NSString* endnote;
@property(strong, nonatomic) NSString* pic;
@property(strong, nonatomic) NSString* tbl;
@property(strong, nonatomic) NSString* equation;
@end

NS_ASSUME_NONNULL_END
