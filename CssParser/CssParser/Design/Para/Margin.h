//
//  Margin.h
//  CssParser
//
//  Created by 인스웨이브 on 7/29/25.
//

#import <Foundation/Foundation.h>
#import "Intent.h"
#import "Left.h"
#import "Right.h"
#import "Prev.h"
#import "Next.h"

NS_ASSUME_NONNULL_BEGIN

@interface Margin : NSObject
@property(nonnull, strong) Intent* intent;
@property(nonnull, strong) Left* left;
@property(nonnull, strong) Right* right;
@property(nonnull, strong) Prev* prev;
@property(nonnull, strong) Next* next;

-(NSString*) getCSS;
@end

NS_ASSUME_NONNULL_END
