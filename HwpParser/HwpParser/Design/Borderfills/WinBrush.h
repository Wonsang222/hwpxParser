//
//  WinBrush.h
//  HwpParser
//
//  Created by 인스웨이브 on 7/25/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WinBrush : NSObject
@property(strong) NSString* faceColor;
@property(strong) NSString* hatchColor;
@property(strong) NSString* hatchStyle;
@property(strong) NSString* alpha;
@end

NS_ASSUME_NONNULL_END
