//
//  HH_Fontfaces.h
//  HwpxParser
//
//  Created by 인스웨이브 on 11/11/25.
//

#import <Foundation/Foundation.h>

@class HH_Fontface;

@interface HH_Fontfaces : NSObject

@property(strong) NSString *itemCnt;
@property(strong) HH_Fontface *fontface;
@property(strong) NSMutableArray<HH_Fontface*>* contents;

@end

