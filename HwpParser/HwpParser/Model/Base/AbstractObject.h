//
//  AbstractObject.h
//  HwpParser
//
//  Created by Wonsang Hwang on 6/28/25.
//

#import <Foundation/Foundation.h>
#import "../Base/Common/Margin.h"

// AbstractShapeObjectType
@interface AbstractShapeObjectType : NSObject

@property(nonnull,nonatomic, strong) NSNumber *identification;
@property(nonnull,nonatomic, strong) NSNumber *zOrder;
@property(nonnull,nonatomic, strong) NSString *numberingType;
@property(nonnull,nonatomic, strong) NSString *textWrap;
@property(nonnull,nonatomic, strong) NSString *textFlow;
@property(assign) BOOL lock;
@property(nonnull,nonatomic, strong) NSString *dropCapStyle;

@property(nullable,nonatomic, strong) NSString *sz;
@property(nullable,nonatomic, strong) NSString *pos;
@property(nullable,nonatomic, strong) Margin *outMargin;
@property(nullable,nonatomic, strong) NSString *caption;
@property(nullable,nonatomic, strong) NSString *shapeComment;
@property(nullable,nonatomic, strong) NSString *metaTag;
@end
