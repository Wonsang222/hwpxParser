//
//  NSObject+ParsingHelper.h
//  HwpxParser
//
//  Created by Wonsang Hwang on 8/13/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (ParsingHelper)
-(void)initializeWithMutableArray;
-(NSString*)convertUnsignedIntToPt:(NSString*)val;
-(NSMutableDictionary*)createAttribute:(NSMutableDictionary*)dic;
-(void)addKVO:(NSObject*)target withMember:(NSString*)name;
-(void)removeKVO:(NSObject*)target withMember:(NSString*)name;
-(void)addContents:(NSMutableArray*)contents withContent:(NSObject*)content;
-(NSMutableString*)buildCssString:(NSMutableString*)start withKey:(NSString*)key withValue:(NSString*)value;
@end

NS_ASSUME_NONNULL_END
