//
//  HH_CharProperties.h
//  HwpxParser
//
//  Created by 인스웨이브 on 11/12/25.
//

#import <Foundation/Foundation.h>
#import "../../Delegate/ContentDelegate.h"

@class HH_CharPr;
@class HH_RefList;

NS_ASSUME_NONNULL_BEGIN

@interface HH_CharProperties : NSObject <ContentDelegate>

@property(strong) NSString *itemCnt;
@property(strong) HH_CharPr *charPr;
@property(strong) NSMutableArray<HH_CharPr*> *contents;
@property(weak) id<ContentDelegate> parent;

-(NSDictionary*_Nonnull)getCharPr:(NSString*_Nonnull)num;
-(NSString*)getFontWithNum:(NSString*)num;


@end

NS_ASSUME_NONNULL_END
