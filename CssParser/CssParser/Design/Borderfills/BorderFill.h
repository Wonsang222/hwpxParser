//
//  Borderfill.h
//  HwpParser
//
//  Created by 인스웨이브 on 7/25/25.
//

#import <Foundation/Foundation.h>

#import "LeftBorder.h"
#import "RightBorder.h"
#import "BottomBorder.h"
#import "TopBorder.h"
#import "Digonal.h"
#import "Fillbrush.h"

@interface BorderFill : NSObject

@property(strong, nonatomic, nonnull) NSString *identification;
@property(strong, nonatomic, nonnull) NSString *threeD;
@property(strong, nonatomic, nonnull) NSString *shadow;
@property(strong, nonatomic, nonnull) NSString *centerLine;
@property(strong, nonatomic, nonnull) NSString *breakCellSEparateLine;

@property (nullable, strong) LeftBorder* leftBorder;
@property (nullable, strong) RightBorder* rightBorder;
@property (nullable, strong) TopBorder* topBorder;
@property (nullable, strong) BottomBorder* bottomBorder;
@property (nullable, strong) Digonal* digonal;
@property (nullable, strong) FillBrush* fillBrush;

@end

