//
//  HH_Head.h
//  HwpxParser
//
//  Created by 인스웨이브 on 11/11/25.
//

#import <Foundation/Foundation.h>
@class HH_BeginNum;
@class HH_RefList;
@class HH_CompatibleDocument;
@class HH_DocOption;
@class HH_TrackchageConfig;

@interface HH_Head : NSObject
@property(strong, nonnull) NSString *version;
@property(strong, nonnull) NSString *secCnt;
@property(strong, nonnull) HH_BeginNum * beginNum;
@property(strong, nonnull) HH_RefList * refList;
@property(strong, nullable) HH_CompatibleDocument * compatibleDocument;
@property(strong, nullable) HH_DocOption * docOption;
@property(strong, nullable) HH_TrackchageConfig * trackchageConfig;

-(NSDictionary*_Nonnull)getParaPr:(NSString*_Nonnull)num;

@end


