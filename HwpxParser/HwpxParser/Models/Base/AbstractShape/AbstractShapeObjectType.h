//
//  AbstractShapeObjectType.h
//  HwpxParser
//
//  Created by WonsangHwang on 8/12/25.
//

#import <Foundation/Foundation.h>

@class Sz;
@class Pos;
@class OutMargin;
@class HTMLElement;

@interface AbstractShapeObjectType : NSObject

@property(nonnull,nonatomic, strong) NSString *identification;
@property(nonnull,nonatomic, strong) NSString *zOrder;
@property(nonnull,nonatomic, strong) NSString *numberingType;
@property(nonnull,nonatomic, strong) NSString *textWrap;
@property(nonnull,nonatomic, strong) NSString *textFlow;
@property(nonnull,nonatomic, strong) NSString *lock;
@property(nonnull,nonatomic, strong) NSString *dropcapstyle;

@property(nullable,nonatomic, strong) Sz *sz;
@property(nullable,nonatomic, strong) Pos *pos;
@property(nullable,nonatomic, strong) OutMargin *outMargin;
//@property(nullable,nonatomic, strong) NSString *caption;
//@property(nullable,nonatomic, strong) NSString *shapeComment;

-(NSString *_Nonnull)getSize;
-(NSMutableDictionary *_Nonnull)getOMargin;
-(NSMutableDictionary*_Nonnull)getAtt;

-(NSMutableDictionary*_Nonnull)getCSS;
-(HTMLElement*_Nonnull)getWrapperDiv;

@end

