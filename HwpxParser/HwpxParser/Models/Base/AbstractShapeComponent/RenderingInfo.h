//
//  RenderingInfo.h
//  HwpParser
//
//  Created by Wonsang Hwang on 7/12/25.
//

#import <Foundation/Foundation.h>
#import "MatrixType/TransMatrix.h"
#import "MatrixType/RotMatrix.h"
#import "MatrixType/ScaMatrix.h"

NS_ASSUME_NONNULL_BEGIN

@interface RenderingInfo : NSObject
@property(nonnull, strong) TransMatrix *transMatrix;
@property(nonnull, strong) RotMatrix *rotMatrix;
@property(nonnull, strong) ScaMatrix *scaMatrix;


@end

NS_ASSUME_NONNULL_END
