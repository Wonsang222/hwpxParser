//
//  HH_Head.m
//  HwpxParser
//
//  Created by 인스웨이브 on 11/11/25.
//

#import "HH_Head.h"
#import "HH_RefList.h"

NS_ASSUME_NONNULL_BEGIN

@implementation HH_Head
@synthesize version;
@synthesize secCnt;
@synthesize beginNum;
@synthesize refList;
@synthesize compatibleDocument;
@synthesize docOption;
@synthesize trackchageConfig;
@synthesize flag;

- (NSDictionary *)getParaPr:(NSString *)num
{
    return [self.refList getParaPr:num];
}

- (NSDictionary *)getBorderFill:(NSString *)num
{
    return [self.refList getBorderFill:num];
}


@end

NS_ASSUME_NONNULL_END
