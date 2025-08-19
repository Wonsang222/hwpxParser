//
//  Paragraph.h
//  HwpParser
//
//  Created by 인스웨이브 on 7/1/25.
//

#import <Foundation/Foundation.h>
#import "../../../Extensions/NSObject+ParsingHelper.h"

@class Run;
@class Linesegarray;
@class HTMLElement;

@interface Paragraph : NSObject

@property(nonnull,nonatomic, strong) NSString *identification;
@property(nonnull,nonatomic, strong) NSString *paraPrIDRef;
@property(nonnull,nonatomic, strong) NSString *styleIDRef;
@property(nonnull,nonatomic, strong) NSString *pageBreak;
@property(nonnull,nonatomic, strong) NSString *columnBreak;
@property(nonnull,nonatomic, strong) NSString *merged;

// nullable
@property(nullable, strong) NSMutableArray<Run*>* run;
@property(nullable, strong) Linesegarray* linesegarray;

-(HTMLElement*_Nonnull)convertToHtml;
-(HTMLElement*_Nonnull)convertToPaper;

@end
