//
//  HH_LineSpacing.h
//  HwpxParser
//
//  Created by 인스웨이브 on 11/12/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HH_LineSpacing : NSObject

@property(strong) NSString *type;
@property(strong) NSString *value;
@property(strong, nullable) NSString *unit;

-(NSDictionary*) getCssData;

@end

NS_ASSUME_NONNULL_END
