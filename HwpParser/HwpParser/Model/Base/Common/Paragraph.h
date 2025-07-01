//
//  Paragraph.h
//  HwpParser
//
//  Created by 인스웨이브 on 7/1/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Paragraph : NSObject

@property(nonnull,nonatomic, strong) NSNumber *identification;
@property(nonnull,nonatomic, strong) NSNumber *paraPrlDRef;
@property(nonnull,nonatomic, strong) NSNumber *styleIDRef;
@property(assign) BOOL pageBreak;
@property(assign) BOOL columnBreak;
@property(assign) BOOL merged;

// nullable

@end

NS_ASSUME_NONNULL_END
