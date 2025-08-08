//
//  PagePr.h
//  HwpParser
//
//  Created by 인스웨이브 on 7/1/25.
//

#import <Foundation/Foundation.h>
#import "../../HwpUnit.h"
#import "../../Margin.h"
#import "HTMLElement.h"
#import "../../../../../../Extension/NSObject+HwpUnit.h"

@interface PagePr : NSObject

@property(nonnull,nonatomic, strong) NSString *landscape;
@property(nonnull,nonatomic, strong) NSString *width;
@property(nonnull,nonatomic, strong) NSString *height;
@property(nonnull,nonatomic, strong) NSString *gutterType;
// nullable
@property(nullable, strong, nonatomic)Margin * margin;

-(HTMLElement*_Nonnull)getHtml;

@end
