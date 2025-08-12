//
//  Pos.h
//  HwpxParser
//
//  Created by 인스웨이브 on 8/12/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Pos : NSObject
@property(nonnull,nonatomic, strong) NSString * treatAsChar;
@property(nonnull,nonatomic, strong) NSString * affectLSpacing;
@property(nonnull,nonatomic, strong) NSString * flowWithText;
@property(nonnull,nonatomic, strong) NSString * allowOverlap;
@property(nonnull,nonatomic, strong) NSString * holdAnchorAndSO;
@property(nonnull,nonatomic, strong) NSString * vertRelTo;
@property(nonnull,nonatomic, strong) NSString * horzRelTo;
@property(nonnull,nonatomic, strong) NSString * vertAlign;
@property(nonnull,nonatomic, strong) NSString * horzAlign;
@property(nonnull,nonatomic, strong) NSString *vertOffset;
@property(nonnull,nonatomic, strong) NSString *horzOffset;
@end

NS_ASSUME_NONNULL_END
