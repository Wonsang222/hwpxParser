//
//  HH_Styles.h
//  HwpxParser
//
//  Created by 인스웨이브 on 11/12/25.
//

#import <Foundation/Foundation.h>


@class HH_Style;

@interface HH_Styles : NSObject

@property(strong) HH_Style *style;
@property(strong) NSMutableArray<HH_Style*> *contents;

@end

