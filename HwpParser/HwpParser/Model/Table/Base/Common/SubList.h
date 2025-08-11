//
//  SubList.h
//  HwpParser
//
//  Created by 인스웨이브 on 7/1/25.
//

#import <Foundation/Foundation.h>
@class Paragraph;

@interface SubList : NSObject

@property(nonnull,nonatomic, strong) NSString* identification;
@property(nonnull,nonatomic, strong) NSString* textDirection;
@property(nonnull,nonatomic, strong) NSString* lineWrap;
@property(nonnull,nonatomic, strong) NSString* vertAlign;
@property(nonnull,nonatomic, strong) NSString* linkListIDRef;
@property(nonnull,nonatomic, strong) NSString* linkListNextIDRef;
@property(nonnull,nonatomic, strong) NSString* textWidth;
@property(nonnull,nonatomic, strong) NSString* textHeight;
@property(nonnull,nonatomic, strong) NSString* hasTextRef;
@property(nonnull,nonatomic, strong) NSString* hasNumRef;
@property(nonnull,nonatomic, strong) NSString* metatag;

//paragraph 배열로
@property(nonnull,nonatomic, strong) NSMutableArray<Paragraph*>* paragraph;

@end

