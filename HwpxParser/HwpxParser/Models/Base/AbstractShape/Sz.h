//
//  Sz.h
//  HwpxParser
//
//  Created by WonsangHwang on 8/12/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Sz : NSObject
@property(strong) NSString *width;
@property(strong) NSString *widthRelTo;
@property(strong) NSString *height;
@property(strong) NSString *heightRelTo;
@property(strong) NSString *protect;

-(NSString*)getWidth;
-(NSString*)getHeight;

-(NSMutableDictionary*)getAtt;

@end

NS_ASSUME_NONNULL_END
