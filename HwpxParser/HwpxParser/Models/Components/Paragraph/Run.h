//
//  Run.h
//  HwpParser
//
//  Created by WonsangHwang on 7/1/25.
//

#import <Foundation/Foundation.h>
#import "Text/Text.h"

@class SecPr;
@class Pic;
@class LineNumberShape;
@class PagePr;
@class FootNotePr;
@class EndNotePr;
@class Tbl;
@class PageBorderFill;
@class HTMLElement;
@class WrapperP;

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

-(NSMutableDictionary*_Nonnull)getPaper;
-(BOOL)hasSecPr;
-(WrapperP*_Nonnull)getContent;
-(NSArray*_Nonnull)getContentWith:(NSString*_Nullable)margin;
@end

    
