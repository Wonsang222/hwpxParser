//
//  Draw.h
//  HwpParser
//
//  Created by 인스웨이브 on 7/17/25.
//

#import <Foundation/Foundation.h>
#import "HTMLElement.h"
#import "HTMLDocument.h"
#import "../Model/Table/Table/Tbl.h"

NS_ASSUME_NONNULL_BEGIN

@interface Draw : NSObject
+(HTMLDocument *) createHtml;
+(HTMLElement *) createTbl: (Tbl*) table;
@end

NS_ASSUME_NONNULL_END
