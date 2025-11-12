//
//  HH_Border.h
//  HwpxParser
//
//  Created by 인스웨이브 on 11/12/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HH_Border : NSObject

@property(strong) NSString *borderFillIDRef;
@property(strong) NSString *offsetLeft;
@property(strong) NSString *offsetRight;
@property(strong) NSString *offsetTop;
@property(strong) NSString *offsetBottom;
@property(strong) NSString *connect;
@property(strong) NSString *ignoreMargin;

@end

NS_ASSUME_NONNULL_END
