//
//  PagePr.h
//  HwpParser
//
//  Created by WonsangHwang on 7/1/25.
//

#import <Foundation/Foundation.h>
#import "../../../Base/AbstractShape/Margin.h"
#import "HTMLElement.h"
#import "../../../../Extensions/NSObject+ParsingHelper.h"

@interface PagePr : NSObject

@property(nonnull,nonatomic, strong) NSString *landscape;
@property(nonnull,nonatomic, strong) NSString *width;
@property(nonnull,nonatomic, strong) NSString *height;
@property(nonnull,nonatomic, strong) NSString *gutterType;
// nullable
@property(nullable, strong, nonatomic)Margin * margin;

-(NSMutableDictionary*_Nonnull)getPaperAtt;

@end
