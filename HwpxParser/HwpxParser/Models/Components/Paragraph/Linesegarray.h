//
//  Linesegarray.h
//  HwpParser
//
//  Created by Wonsang Hwang on 7/16/25.
//

#import <Foundation/Foundation.h>
#import "Lineseg.h"
@class MarginSender;

@interface Linesegarray : NSObject

@property(nullable, strong) NSMutableArray<Lineseg*>* lineseg;
-(BOOL)isNewPage;
-(int)count;
-(void)addMarginWith:(MarginSender*_Nonnull)margin;
@end

