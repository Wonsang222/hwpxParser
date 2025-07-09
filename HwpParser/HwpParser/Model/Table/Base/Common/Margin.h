//
//  OutMargin.h
//  HwpParser
//
//  Created by 인스웨이브 on 7/1/25.
//

#import <Foundation/Foundation.h>
#import "HwpUnit.h"

@interface Margin : NSObject
@property(nonnull,strong) NSString* top;
@property(nonnull,strong) NSString* left;
@property(nonnull,strong) NSString* right;
@property(nonnull,strong) NSString* bottom;
@property(nonnull, strong)NSString* header;
@property(nonnull, strong)NSString* footer;
@property(nonnull, strong)NSString* gutter;
@end

