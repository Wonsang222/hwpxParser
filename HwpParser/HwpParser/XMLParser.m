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
    // Reset current text buffer
    [self.currentText setString:@""];

    // Create a new dictionary for the current element
    NSMutableDictionary *elementDict = [NSMutableDictionary dictionary];
    if (attributeDict.count > 0) {
        elementDict[@"attributes"] = [attributeDict copy];
    }
    elementDict[@"children"] = [NSMutableArray array]; // Initialize children array

    // Add the element to the current dictionary's children
    NSMutableArray *currentChildren = self.currentDictionary[@"children"];
    if (!currentChildren) {
        currentChildren = [NSMutableArray array];
        self.currentDictionary[@"children"] = currentChildren;
    }
    [currentChildren addObject:elementDict];

    // Push current dictionary to stack and set new current dictionary
    [self.elementStack addObject:self.currentDictionary];
    self.currentDictionary = elementDict;
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    // Trim and store text content if present
    NSString *trimmedText = [self.currentText stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if (trimmedText.length > 0) {
        self.currentDictionary[@"text"] = trimmedText;
    }

    // Pop the stack and restore the parent dictionary
    self.currentDictionary = [self.elementStack lastObject];
    [self.elementStack removeLastObject];
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    // Append found characters to current text buffer
    [self.currentText appendString:string];
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
    NSLog(@"Parse error: %@", parseError);
}

@end
