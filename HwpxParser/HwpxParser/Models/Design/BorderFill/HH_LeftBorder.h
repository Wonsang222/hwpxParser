//
//  HH_LeftBorder.h
//  HwpxParser
//
//  Created by WonsangHwang on 11/11/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HH_LeftBorder : NSObject

@property(strong) NSString *type;
@property(strong) NSString *width;
@property(strong) NSString *color;

-(NSDictionary*)getCSS;
-(NSString*)location;

@end

NS_ASSUME_NONNULL_END
