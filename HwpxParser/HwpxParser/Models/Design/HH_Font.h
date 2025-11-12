//
//  HH_Font.h
//  HwpxParser
//
//  Created by 인스웨이브 on 11/11/25.
//

#import <Foundation/Foundation.h>

@class HH_TypeInfo;
@class HH_SubstFont;

@interface HH_Font : NSObject

@property(strong, nonnull) NSString* identification;
@property(strong, nonnull) NSString* face;
@property(strong, nonnull) NSString* type;
@property(strong, nonnull) NSString* isEmbedded;

@property(strong, nullable) HH_TypeInfo *typeInfo;
@property(strong, nullable) HH_SubstFont *substFont;

@end


