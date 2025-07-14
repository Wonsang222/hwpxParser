//
//  Pic.h
//  HwpParser
//
//  Created by Wonsang Hwang on 7/12/25.
//

#import <Foundation/Foundation.h>
#import "../../../../AbstractShapeComponentType.h"
#import "LineShape.h"
#import "ImgRect.h"
#import "ImgClip.h"
#import "../../Common/InMargin.h"
#import "ImgDim.h"

NS_ASSUME_NONNULL_BEGIN

@interface Pic : AbstractShapeComponentType
@property(nonnull,nonatomic, strong) NSString *reverse;

// nullable
@property(nullable,nonatomic,strong) LineShape* lineShape;
@property(nonnull,nonatomic,strong) ImgRect* imgRect;
@property(nonnull,nonatomic,strong) ImgClip* imgClip;
@property(nonnull,nonatomic,strong) InMargin* inMargin;
@property(nonnull,nonatomic,strong) ImgDim* imgDim;

@end

NS_ASSUME_NONNULL_END
