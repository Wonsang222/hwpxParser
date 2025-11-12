//
//  HH_TypeInfo.h
//  HwpxParser
//
//  Created by 인스웨이브 on 11/11/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HH_TypeInfo : NSObject

@property(strong) NSString* familyType;
@property(strong) NSString* weight;
@property(strong) NSString* proportion;
@property(strong) NSString* contrast;
@property(strong) NSString* strokeVariation;
@property(strong) NSString* armStyle;
@property(strong) NSString* letterform;
@property(strong) NSString* midline;
@property(strong) NSString* xHeight;

@end

NS_ASSUME_NONNULL_END
