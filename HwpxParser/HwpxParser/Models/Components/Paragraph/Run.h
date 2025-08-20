//
//  Run.h
//  HwpParser
//
//  Created by 인스웨이브 on 7/1/25.
//

#import <Foundation/Foundation.h>
#import "Text/Text.h"
@import HTMLKit;

@class SecPr;
@class Pic;
@class LineNumberShape;
@class PagePr;
@class FootNotePr;
@class EndNotePr;
@class Tbl;
@class PageBorderFill;

@interface Run : NSObject

@property(strong, nonnull) NSString* charPrIDRef;
@property(strong, nonnull) NSString* charTcId;
@property(nonnull, strong) NSMutableArray* contents;
@property(nullable, strong) SecPr *secPr;
@property(nonnull, strong) Text* text;
@property(nullable, strong) Pic* pic;
@property(nullable, strong) Tbl* tbl;
@property(nullable, strong) FootNotePr* footNotePr;
@property(nullable, strong) EndNotePr* endNotePr;

@property(nonnull, strong) NSMutableArray<PageBorderFill*>* pageBorderFill;

-(HTMLElement*_Nonnull)convertToPaper;
@end

    
