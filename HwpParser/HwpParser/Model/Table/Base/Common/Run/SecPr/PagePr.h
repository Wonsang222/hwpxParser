//
//  PagePr.h
//  HwpParser
//
//  Created by 인스웨이브 on 7/1/25.
//

#import <Foundation/Foundation.h>
#import "../../HwpUnit.h"
#import "../../Margin.h"

@interface PagePr : NSObject

@property(nonnull,nonatomic, strong) NSString *landscape;
@property(nonnull,nonatomic, strong) HwpUnit *width;
@property(nonnull,nonatomic, strong) HwpUnit *height;
// nullable
@property(nullable, strong, nonatomic) Margin* margin;

@end
