//
//  HH_SubstFont.h
//  HwpxParser
//
//  Created by WonsangHwang on 11/11/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HH_SubstFont : NSObject

@property(strong) NSString *face;
@property(strong) NSString *type;
@property(strong) NSString *isEmbedded;
@property(strong) NSString *binaryItemIDRef;


@end

NS_ASSUME_NONNULL_END
