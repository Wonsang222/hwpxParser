//
//  Paragraph.h
//  HwpParser
//
//  Created by 인스웨이브 on 7/1/25.
//

#import <Foundation/Foundation.h>

@interface Paragraph : NSObject

@property(nonnull,nonatomic, strong) NSString *identification;
@property(nonnull,nonatomic, strong) NSString *paraPrlDRef;
@property(nonnull,nonatomic, strong) NSString *styleIDRef;
@property(nonnull,nonatomic, strong) NSString * pageBreak;
@property(nonnull,nonatomic, strong) NSString * columnBreak;
@property(nonnull,nonatomic, strong) NSString * merged;

// nullable



@end
