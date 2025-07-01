//
//  XMLParser.m
//  HwpParser
//
//  Created by Wonsang Hwang on 6/28/25.
//

#import "XMLParser.h"

@interface XMLParser () <NSXMLParserDelegate>
@property (nonatomic, strong) NSMutableArray *elementStack; // Stack to track current element hierarchy
@property (nonatomic, strong) NSMutableDictionary *rootDictionary; // Root dictionary for parsed data
@property (nonatomic, strong) NSMutableString *currentText; // Buffer for text content
@property (nonatomic, strong) NSMutableDictionary *currentDictionary; // Current element being parsed
@end

@implementation XMLParser

- (NSDictionary *)parseXMLFile:(NSString *)filePath {
    // Initialize parser and data structures
    self.elementStack = [NSMutableArray array];
    self.rootDictionary = [NSMutableDictionary dictionary];
    self.currentText = [NSMutableString string];
    self.currentDictionary = self.rootDictionary;

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

    return [self.rootDictionary copy];
}

#pragma mark - NSXMLParserDelegate

- (void)parserDidStartDocument:(NSXMLParser *)parser {
    NSLog(@"Started parsing document");
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
    NSLog(@"Finished parsing document");
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict {
    

}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
    NSLog(@"Parse error: %@", parseError);
    NSLog(@"Error line: %ld, column: %ld", (long)[parser lineNumber], (long)[parser columnNumber]);
}

@end
