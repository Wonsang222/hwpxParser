//
//  Sz.h
//  HwpxParser
//
//  Created by 인스웨이브 on 8/12/25.
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

@end

NS_ASSUME_NONNULL_END
