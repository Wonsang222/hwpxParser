//
//  Margin.h
//  HwpxParser
//
//  Created by 인스웨이브 on 8/12/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Margin : NSObject
@property(nonnull,strong) NSString* top;
@property(nonnull,strong) NSString* left;
@property(nonnull,strong) NSString* right;
@property(nonnull,strong) NSString* bottom;
@property(nonnull, strong)NSString* header;
@property(nonnull, strong)NSString* footer;
@property(nonnull, strong)NSString* gutter;
@end

NS_ASSUME_NONNULL_END
