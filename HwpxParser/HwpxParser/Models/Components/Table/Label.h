//
//  Label.h
//  HwpParser
//
//  Created by 인스웨이브 on 7/11/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Label : NSObject
@property(nonnull, strong) NSString* topmargin;
@property(nonnull, strong) NSString* leftmargin;
@property(nonnull, strong) NSString* boxwidth;
@property(nonnull, strong) NSString* boxlength;
@property(nonnull, strong) NSString* boxmarginhor;
@property(nonnull, strong) NSString* boxmarginver;
@property(nonnull, strong) NSString* labelcols;
@property(nonnull, strong) NSString* labelrows;
@property(nonnull, strong) NSString* landscape;
@property(nonnull, strong) NSString* pagewidth;
@property(nonnull, strong) NSString* pageheight;
@end

NS_ASSUME_NONNULL_END
