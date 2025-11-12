//
//  HH_BorderFills.h
//  HwpxParser
//
//  Created by 인스웨이브 on 11/11/25.
//

#import <Foundation/Foundation.h>

@class HH_BorderFill;

@interface HH_BorderFills : NSObject

@property(strong, nonnull) NSMutableArray<HH_BorderFill*>* contents;
@property(strong, nonnull) HH_BorderFill * borderFill;

@end

