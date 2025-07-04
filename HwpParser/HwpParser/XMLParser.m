//
//  XMLParser.m
//  HwpParser
//
//  Created by Wonsang Hwang on 6/28/25.
//

#import "XMLParser.h"

@interface XMLParser () <NSXMLParserDelegate>
@property (nonatomic, strong) NSMutableArray *current; // Stack to track current element hierarchy
@property (nonatomic, strong) NSMutableArray *result;
@end

@implementation XMLParser

- (NSMutableArray *)parseXMLFile:(NSString *)filePath {
    // Initialize parser and data structures
    self.current = [NSMutableArray array];
    self.result = [NSMutableArray array];

    // Load XML file
    NSData *xmlData = [NSData dataWithContentsOfFile:filePath];
    if (!xmlData) {
        NSLog(@"Error: Could not load XML file at path: %@", filePath);
        return nil;
    }

    // Initialize NSXMLParser
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:xmlData];
    parser.delegate = self;
    [parser setShouldProcessNamespaces:YES]; // Handle namespaces like 'hp:'
    
    // Start parsing
    BOOL success = [parser parse];
    if (!success) {
        NSLog(@"Error: XML parsing failed.");
        return nil;
    }

    return [self.result copy];
}

#pragma mark - NSXMLParserDelegate

- (void)parserDidStartDocument:(NSXMLParser *)parser {
    NSLog(@"Started parsing document");
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
    NSLog(@"Finished parsing document");
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict {
    
    if ([elementName isEqualToString:@"hp:sec"]) {
        return;
    }
    
    NSString* openTag = qName;
    
    if ([openTag isEqualToString:@"p"]) {
        openTag = @"paragraph";
    }
    
    NSString *clsName = [openTag stringByReplacingCharactersInRange:NSMakeRange(0, 1)
                                                        withString:[[openTag substringToIndex:1] uppercaseString]];
    
    Class elemCls = NSClassFromString(clsName);
    
    if (elemCls) {
        id instace = [[elemCls alloc] init];
        [instace setValuesForKeysWithDictionary:attributeDict];
        
        // 테스트 필요
        
    } else {
        return;
    }
    
    
    /*
     
     t에는 text 포함 shit
     
     1. 여는 태그 나오면 클래스 찾아서 new
     2. attributes 순회하면서, nonnull 프로퍼티 데이터 생성 -> KVO
     3. 현재 작성중인 클래스로 등록
     4. 닫는태그 나오면 내 자신을 current에서 빼고, current가 비었다면 result로 가고 아니면 해당 클래스에 내 자신을 프로퍼티로
     */

}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    if ([elementName isEqualToString:@"hp:sec"]) {
        return;
    }
    
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
    NSLog(@"Parse error: %@", parseError);
    NSLog(@"Error line: %ld, column: %ld", (long)[parser lineNumber], (long)[parser columnNumber]);
}

@end
