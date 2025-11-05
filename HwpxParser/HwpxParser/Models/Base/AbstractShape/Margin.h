//
//  Margin.h
//  HwpxParser
//
//  Created by 인스웨이브 on 8/12/25.
//

#import <Foundation/Foundation.h>

@interface Margin : NSObject
@property(nullable,strong) NSString* top;
@property(nullable,strong) NSString* left;
@property(nullable,strong) NSString* right;
@property(nullable,strong) NSString* bottom;
@property(nullable, strong)NSString* header;
@property(nullable, strong)NSString* footer;
@property(nullable, strong)NSString* gutter;

-(NSMutableDictionary*_Nonnull)getMarginPt;
@end

