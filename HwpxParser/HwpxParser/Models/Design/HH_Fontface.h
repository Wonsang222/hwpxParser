//
//  HH_Fontface.h
//  HwpxParser
//
//  Created by 인스웨이브 on 11/11/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class HH_Font;

@interface HH_Fontface : NSObject

@property(strong) NSString* fontCnt;
@property(strong) NSString* lang;
@property(strong) HH_Font * font;
@property(strong) NSMutableArray<HH_Font*>* contents;

-(NSString*)getFontWithNum:(NSString*)num;

@end

NS_ASSUME_NONNULL_END
