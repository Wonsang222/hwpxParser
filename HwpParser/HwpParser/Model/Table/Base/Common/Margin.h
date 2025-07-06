//
//  OutMargin.h
//  HwpParser
//
//  Created by 인스웨이브 on 7/1/25.
//

#import <Foundation/Foundation.h>
#import "HwpUnit.h"

NS_ASSUME_NONNULL_BEGIN

@interface Margin : NSObject
@property(strong) NSString* top;
@property(strong) NSString* left;
@property(strong) NSString* right;
@property(strong) NSString* bottom;

// nullable

@property(nullable, strong) HwpUnit* header;
@property(nullable, strong) HwpUnit* footer;
@end

NS_ASSUME_NONNULL_END
