//
//  AbstractObject.h
//  HwpParser
//
//  Created by Wonsang Hwang on 6/28/25.
//

#import <Foundation/Foundation.h>
#import "Common/Sz.h"
#import "Common/Pos.h"
#import "../Base/Common/OutMargin.h"

// AbstractShapeObjectType
@interface AbstractShapeObjectType : NSObject

@property(nonnull,nonatomic, strong) NSString *identification;
@property(nonnull,nonatomic, strong) NSString *zOrder;
@property(nonnull,nonatomic, strong) NSString *numberingType;
@property(nonnull,nonatomic, strong) NSString *textWrap;
@property(nonnull,nonatomic, strong) NSString *textFlow;
@property(nonnull,nonatomic, strong) NSString *lock;
@property(nonnull,nonatomic, strong) NSString *dropCapStyle;

@property(nullable,nonatomic, strong) Sz *sz;
@property(nullable,nonatomic, strong) Pos *pos;
@property(nullable,nonatomic, strong) OutMargin *outMargin;
//@property(nullable,nonatomic, strong) NSString *caption;
//@property(nullable,nonatomic, strong) NSString *shapeComment;
@end
