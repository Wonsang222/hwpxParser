//
//  HH_Style.h
//  HwpxParser
//
//  Created by 인스웨이브 on 11/12/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HH_Style : NSObject

@property(strong) NSString* identification;
@property(strong) NSString* type;
@property(strong) NSString* name;
@property(strong) NSString* engName;
@property(strong) NSString* paraPrIDRef;
@property(strong) NSString* charPrIDRef;
@property(strong) NSString* nextStyleIDRef;
@property(strong) NSString* langID;
@property(strong) NSString* lockForm;

@end

NS_ASSUME_NONNULL_END
