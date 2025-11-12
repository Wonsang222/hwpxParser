//
//  HH_Default.h
//  HwpxParser
//
//  Created by 인스웨이브 on 11/12/25.
//

#import <Foundation/Foundation.h>
@class HH_TabItem;
@class HH_Margin;
@class HH_LineSpacing;

@interface HH_Default : NSObject

@property(strong, nullable) HH_TabItem *tabItem;
@property(strong, nullable) HH_Margin *margin;
@property(strong, nullable) HH_LineSpacing *lineSpacing;

@end

