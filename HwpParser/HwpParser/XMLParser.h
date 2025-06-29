//
//  XMLParser.h
//  HwpParser
//
//  Created by Wonsang Hwang on 6/28/25.
//

#import <Foundation/Foundation.h>

@interface XMLParser : NSObject

- (NSDictionary *)parseXMLFile:(NSString *)filePath;

@end
