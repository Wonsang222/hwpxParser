//
//  CharPr.h
//  HwpParser
//
//  Created by 인스웨이브 on 7/25/25.
//

#import <Foundation/Foundation.h>
#import "Bold.h"
#import "Italic.h"

@interface CharPr : NSObject

@property (nonnull, strong) NSString* identification;
@property (nonnull, strong) NSString* height;
@property (nonnull, strong) NSString* textColor;
@property (nonnull, strong) NSString* shadeColor;
@property (nonnull, strong) NSString* useFontSpace;
@property (nonnull, strong) NSString* useKeming;
@property (nonnull, strong) NSString* symMark;
@property (nonnull, strong) NSString* borderFillIDRef;

@property (nullable, strong) Bold* bold;
@property (nullable, strong) Italic* italic;

@end

