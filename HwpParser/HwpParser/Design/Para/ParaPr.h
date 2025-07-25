//
//  ParaPr.h
//  HwpParser
//
//  Created by 인스웨이브 on 7/25/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ParaPr : NSObject
@property(nonnull, strong) NSString* identification;
@property(nonnull, strong) NSString* tabPrIDRef;
@property(nonnull, strong) NSString* condense;

@property(nonnull, strong) NSString* fontLineHeight;
@property(nonnull, strong) NSString* snapToGrid;
@property(nonnull, strong) NSString* suppressLineNumbers;
@property(nonnull, strong) NSString* checked;
@property(nonnull, strong) NSString* textDir;



@end

NS_ASSUME_NONNULL_END
