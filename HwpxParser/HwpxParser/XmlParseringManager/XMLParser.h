//
//  XMLParser.h
//  HwpParser
//
//  Created by Wonsang Hwang on 6/28/25.
//

#import <Foundation/Foundation.h>

@interface XMLParser : NSObject

@property(nullable, strong) NSString* part;
-(NSMutableArray*_Nonnull)parseXMLFile:(NSString *_Nonnull)filePath;
-(instancetype _Nonnull)initWithPart:(NSString* _Nonnull)part;
@end
