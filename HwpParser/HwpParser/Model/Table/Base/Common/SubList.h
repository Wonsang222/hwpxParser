//
//  SubList.h
//  HwpParser
//
//  Created by 인스웨이브 on 7/1/25.
//

#import <Foundation/Foundation.h>

@interface SubList : NSObject

@property(nonnull,nonatomic, strong) NSString* identification;
@property(nonnull,nonatomic, strong) NSString* textDirection;
@property(nonnull,nonatomic, strong) NSString* lineWrap;
@property(nonnull,nonatomic, strong) NSString* vertAlign;
@property(nonatomic, assign) NSInteger linkListDRef;
@property(nonatomic, assign) NSInteger linkListNextIDRef;
@property(nonatomic, assign) NSInteger textWidth;
@property(nonatomic, assign) NSInteger textHeight;

//paragraph 배열로

@end

