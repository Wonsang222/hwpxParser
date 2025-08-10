//
//  Run.h
//  HwpParser
//
//  Created by 인스웨이브 on 7/1/25.
//

#import <Foundation/Foundation.h>
#import "SecPr/SecPr.h"
#import "Text/Text.h"
#import "../../Shape/Pic/Pic.h"
#import "SecPr/LineNumberShape.h"
#import "SecPr/PagePr.h"
#import "SecPr/Note/FootNotePr.h"
#import "SecPr/Note/EndNotePr.h"


@interface Run : NSObject

@property(strong, nonnull) NSString* charPrIDRef;
@property(strong, nonnull) NSString* charTcId;
@property(nonnull, strong) NSMutableArray* contents;
@property(nullable, strong) SecPr *secPr;
@property(nonnull, strong) Text* text;
@property(nullable, strong) Pic* pic;
@property(nullable, strong) PagePr* pagePr;
@property(nullable, strong) FootNotePr* footNotePr;
@property(nullable, strong) EndNotePr* endNotePr;

@property(nonnull, strong) NSMutableArray<PageBorderFill*>* pageBorderFill;

@end

    
