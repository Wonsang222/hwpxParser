//
//  Paragraph.h
//  HwpParser
//
//  Created by WonsangHwang on 7/1/25.
//

#import <Foundation/Foundation.h>
#import "../../../Extensions/NSObject+ParsingHelper.h"

@class Run;
@class Linesegarray;
@class Lineseg;
@class WrapperP;
@class HH_Head;

@interface Paragraph : NSObject

@property(nonnull,nonatomic, strong) NSString *identification;
@property(nonnull,nonatomic, strong) NSString *paraPrIDRef;
@property(nonnull,nonatomic, strong) NSString *styleIDRef;
@property(nonnull,nonatomic, strong) NSString *pageBreak;
@property(nonnull,nonatomic, strong) NSString *columnBreak;
@property(nonnull,nonatomic, strong) NSString *merged;

// nullable
@property(nonnull, strong) NSMutableArray<Run*>* run;
@property(nullable, strong) Linesegarray* linesegarray;

//-(NSMutableArray<HTMLElement*>*_Nonnull)convertParagraphWithHead:(HH_Head*_Nonnull)head;
-(NSMutableArray<WrapperP*>*_Nonnull)convertParagraphWithHead;
-(BOOL)isNewPage;
-(BOOL)hasSecPr;
-(NSMutableDictionary*_Nonnull)getP;
@end
