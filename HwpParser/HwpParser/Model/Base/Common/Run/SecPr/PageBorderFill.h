//
//  PageBorderFill.h
//  HwpParser
//
//  Created by 인스웨이브 on 7/1/25.
//

#import <Foundation/Foundation.h>
#import "OffSet.h"

@interface PageBorderFill : NSObject

@property(nonnull,nonatomic, strong) NSString *type;
@property(assign) NSInteger borderFillIDRef;
@property(nonnull,nonatomic, strong) NSString *textBorder;
@property(assign) BOOL headerInside;
@property(assign) BOOL footerInside;
@property(nonnull,nonatomic, strong) NSString *fillArea;

@property(nullable, nonatomic, strong) OffSet* offset;

@end
