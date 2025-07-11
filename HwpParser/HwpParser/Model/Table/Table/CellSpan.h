//
//  CellSpan.h
//  HwpParser
//
//  Created by 인스웨이브 on 7/11/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CellSpan : NSObject
@property (strong, nonnull) NSString* colSpan;
@property (strong, nonnull) NSString* rowSpan;
@end

NS_ASSUME_NONNULL_END
