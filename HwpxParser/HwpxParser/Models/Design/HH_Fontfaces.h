//
//  HH_Fontfaces.h
//  HwpxParser
//
//  Created by WonsangHwang on 11/11/25.
//

#import <Foundation/Foundation.h>

@class HH_Fontface;
@class HH_Font;

@interface HH_Fontfaces : NSObject

@property(strong) NSString *itemCnt;
@property(strong) HH_Fontface *fontface;
@property(strong) NSMutableArray<HH_Fontface*>* contents;

-(NSString*)getFontWithNum:(NSString*)num;

@end

