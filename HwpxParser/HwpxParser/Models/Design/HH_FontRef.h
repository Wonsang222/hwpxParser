//
//  HH_FontRef.h
//  HwpxParser
//
//  Created by WonsangHwang on 11/12/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HH_FontRef : NSObject

@property(strong) NSString *hangul;
@property(strong) NSString *latin;
@property(strong) NSString *hanja;
@property(strong) NSString *japanese;
@property(strong) NSString *other;
@property(strong) NSString *symbol;
@property(strong) NSString *user;

-(NSString*)getFont;

@end

NS_ASSUME_NONNULL_END
