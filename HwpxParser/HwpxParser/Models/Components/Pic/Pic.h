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

@interface Pic : AbstractShapeComponentType
@property(nonnull,nonatomic, strong) NSString *reverse;

// nullable
@property(nullable,nonatomic,strong) LineShape* lineShape;
@property(nonnull,nonatomic,strong) ImgRect* imgRect;
@property(nonnull,nonatomic,strong) ImgClip* imgClip;
@property(nonnull,nonatomic,strong) InMargin* inMargin;
@property(nonnull,nonatomic,strong) ImgDim* imgDim;
@property(nonnull,nonatomic,strong) Img* img;
@property(nullable, nonatomic, strong) NSMutableArray<NSMutableDictionary*> *stackSizes;

-(HTMLElement*_Nonnull)convertToHtml;
-(HTMLElement*_Nonnull)convertToHtmlWith:(NSString* _Nonnull)margin;

@end
