//
//  Tr.h
//  HwpxParser
//
//  Created by Wonsang Hwang on 8/13/25.
//

#import <Foundation/Foundation.h>
@class Tc;
@class HTMLElement;

@interface Tr : NSObject
@property(strong, nonnull) Tc* tc;
@property(strong)NSMutableArray<Tc*>* contents;

-(HTMLElement*)getHtml;
@end

