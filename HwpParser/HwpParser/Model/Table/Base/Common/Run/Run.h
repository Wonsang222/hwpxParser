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

@interface Run : NSObject

@property(strong, nonnull) NSString* charPrIDRef;
@property(strong, nonnull) NSString* charTcId;

@property(nonnull, strong) NSMutableArray* contents;

@property(nullable, strong) SecPr *secPr;

@property(nonnull, strong) Text* text;
@property(nullable, strong) Pic* pic;

@end

    
