//
//  Pic.h
//  HwpParser
//
//  Created by Wonsang Hwang on 7/12/25.
//

#import <Foundation/Foundation.h>
#import "../../Base/AbstractShapeComponent/AbstractShapeComponentType.h"

@class HTMLElement;

@class LineShape;
@class ImgRect;
@class ImgClip;
@class InMargin;
@class ImgDim;
@class Img;

NS_ASSUME_NONNULL_BEGIN

@interface Pic : AbstractShapeComponentType
@property(nonnull,nonatomic, strong) NSString *reverse;

// nullable
@property(nullable,nonatomic,strong) LineShape* lineShape;
@property(nonnull,nonatomic,strong) ImgRect* imgRect;
@property(nonnull,nonatomic,strong) ImgClip* imgClip;
@property(nonnull,nonatomic,strong) InMargin* inMargin;
@property(nonnull,nonatomic,strong) ImgDim* imgDim;
@property(nonnull,nonatomic,strong) Img* img;

-(HTMLElement*)convertToHtml;

@end
    
NS_ASSUME_NONNULL_END
