//
//  Text.h
//  HwpParser
//
//  Created by Wonsang Hwang on 7/15/25.
//

#import <Foundation/Foundation.h>
#import "HTMLElement.h"

@interface Text : NSObject
@property (nullable, strong) NSString* content;
-(HTMLElement*_Nonnull)convertToHtmlWith:(NSString* _Nonnull)margin;
-(HTMLElement*_Nonnull)getContentHtml;
-(HTMLElement*_Nonnull)convertToHtml;
- (BOOL)isTreatAsChar;
-(NSMutableArray *_Nonnull)splitTextAt:(NSUInteger)index css:(NSString*_Nonnull)cssString;
-(void)removeSpacing;
-(void)addSpacing;
-(BOOL)hasSuffixSpacing;
@end



