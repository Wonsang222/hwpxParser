//
//  HH_Switch.h
//  HwpxParser
//
//  Created by 인스웨이브 on 11/14/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class HH_Cases;
@class HH_Defaults;
@interface HH_Switches : NSObject

@property(strong) HH_Cases *cases;
@property(strong) HH_Defaults *defaults;

-(NSDictionary*)getCssData;

@end

NS_ASSUME_NONNULL_END
