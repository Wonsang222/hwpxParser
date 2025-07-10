//
//  NoteSpacing.h
//  HwpParser
//
//  Created by 인스웨이브 on 7/10/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NoteSpacing : NSObject
@property(nonnull,nonatomic, strong) NSString *betweenNotes;
@property(nonnull,nonatomic, strong) NSString *belowLine;
@property(nonnull,nonatomic, strong) NSString *aboveLine;
@end

NS_ASSUME_NONNULL_END
