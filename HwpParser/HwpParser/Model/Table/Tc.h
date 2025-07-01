//
//  Tc.h
//  HwpParser
//
//  Created by 인스웨이브 on 7/1/25.
//

#import <Foundation/Foundation.h>

@interface Tc : NSObject
@property(strong, nonnull) NSString* name;
@property(assign) BOOL header;
@property(assign) BOOL hasMargin;
@property(strong, nonnull) NSString* borderFillDRef;

// nullable



@end

