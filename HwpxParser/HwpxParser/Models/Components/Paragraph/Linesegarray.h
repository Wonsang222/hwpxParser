//
//  Linesegarray.h
//  HwpParser
//
//  Created by Wonsang Hwang on 7/16/25.
//

#import <Foundation/Foundation.h>
#import "Lineseg.h"

@interface Linesegarray : NSObject

@property(nullable, strong) NSMutableArray<Lineseg*>* lineseg;
-(BOOL)isNewPage;

@end

