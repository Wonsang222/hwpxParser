//
//  Pos.h
//  HwpParser
//
//  Created by 인스웨이브 on 6/30/25.
//

#import <Foundation/Foundation.h>
#import "HwpUnit.h"

NS_ASSUME_NONNULL_BEGIN

@interface Pos : NSObject
@property BOOL treatAsChar;
@property BOOL affectLSpacing;
@property BOOL flowWithText;
@property BOOL holdAnchorAndSO;
@property(strong) NSString* vertRelTo;
@property(strong) NSString* horzRelTo;
@property(assign) NSInteger vertAlign;
@property(assign) NSInteger horzAlign;
@property(strong) HwpUnit* vertOffset;
@property(strong) HwpUnit* horzOffset;
@end

NS_ASSUME_NONNULL_END
