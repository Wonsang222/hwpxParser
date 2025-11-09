//
//  Tr.h
//  HwpxParser
//
//  Created by Wonsang Hwang on 8/13/25.
//

#import <Foundation/Foundation.h>
@class Tc;
@class HTMLElement;

NS_ASSUME_NONNULL_BEGIN

@interface Tr : NSObject
@property(strong, nonnull) Tc* tc;
@property(strong)NSMutableArray<Tc*>* contents;

-(HTMLElement*)getHtml;
@end

NS_ASSUME_NONNULL_END
