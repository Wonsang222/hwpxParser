//
//  Lineseg.h
//  HwpParser
//
//  Created by Wonsang Hwang on 7/16/25.
//

#import <Foundation/Foundation.h>
#import "../../../Extensions/NSObject+ParsingHelper.h"
#import "HTMLElement.h"

NS_ASSUME_NONNULL_BEGIN

@interface Lineseg : NSObject
@property(nonnull,strong) NSString* textpos;
@property(nonnull,strong) NSString* vertpos;
@property(nonnull,strong) NSString* vertsize;
@property(nonnull,strong) NSString* textheight;
@property(nonnull,strong) NSString* baseline;
@property(nonnull,strong) NSString* spacing;
@property(nonnull,strong) NSString* horzpos;
@property(nonnull,strong) NSString* horzsize;
@property(nonnull,strong) NSString* flags;

-(HTMLElement *)convertToHtml;
-(BOOL)isNewPage;
@end

NS_ASSUME_NONNULL_END
