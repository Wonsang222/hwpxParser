//
//  HH_Align.h
//  HwpxParser
//
//  Created by 인스웨이브 on 11/12/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HH_Align : NSObject

@property(strong) NSString *horizontal;
@property(strong) NSString *vertical;

-(NSDictionary*)getCssData;

@end

NS_ASSUME_NONNULL_END
