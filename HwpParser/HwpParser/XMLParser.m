//
//  XMLParser.m
//  HwpParser
//
//  Created by Wonsang Hwang on 6/28/25.
//

#import "XMLParser.h"
#import "Model/Table/Base/Common/Run/SecPr/PagePr.h"

@interface XMLParser () <NSXMLParserDelegate>
@property (nonatomic, strong) NSMutableArray *current;
@property (nonatomic, strong) NSMutableArray *result;
@property (nonatomic, strong) NSArray *bannedList;
@property (nonatomic, strong) NSDictionary *standFor;
@end

@implementation XMLParser

- (NSMutableArray *)parseXMLFile:(NSString *)filePath {
    self.current = [NSMutableArray array];
    self.result = [NSMutableArray array];
    self.bannedList = @[
        @"config",
        @"sec",
        @"effects",
        @"shapeComment"
    ];
    self.standFor = @{
        @"p" : @"paragraph",
        @"t" : @"text"
    };

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
    
    if ([self.bannedList containsObject: elementName]) {
        return;
    }

    NSString* openTag = elementName;
    
    // hp: 네임스페이스 제거
    if ([openTag hasPrefix:@"hp:"]) {
        openTag = [openTag substringFromIndex:3];
    }
    
    if ([self.standFor objectForKey:openTag]) {
        openTag = [self.standFor objectForKey:openTag];
    }
        
    NSString *clsName = [openTag stringByReplacingCharactersInRange:NSMakeRange(0, 1)
                                                        withString:[[openTag substringToIndex:1] uppercaseString]];
    Class elemCls = NSClassFromString(clsName);
    
    if (elemCls) {
        NSLog(@"open tag : %@", clsName);
        id instace = [[elemCls alloc] init];
        
        // attributeDict key 값 수정해야함 id 같은 문자열은 프로퍼티 이름으로 사용이 불가능함

        NSMutableDictionary *revisedDict = [attributeDict mutableCopy];
        NSArray *keys = [revisedDict allKeys];
        for (id i in keys) {
            if ([i isEqualToString:@"id"]) {
                NSString *identification = @"identification";
                NSString *value = [revisedDict valueForKey:i];
                [revisedDict setValue:value forKey:identification];
                [revisedDict removeObjectForKey:i];
            }
        }
        
        [instace setValuesForKeysWithDictionary:revisedDict];
        [self.current addObject:instace];
    } else {
        NSLog(@"No class : %@", elementName);
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    // 해당 태그가 끝났을때, 해당 객체가 프로퍼티인지 확인하는 과정
    
    if ([self.bannedList containsObject: elementName]) {
        return;
    }
    
    id current = [self.current lastObject];
    if (current) {
        [self.current removeLastObject];
        id superior = [self.current lastObject];
        NSLog(@"close - qname : %@", qName );
        NSLog(@"close : %@", current );
        NSLog(@"close - sup : %@", superior );

        // current 객체는 superior의 프로퍼티임
        // 상위 객체가 있을때 프로퍼티로 ..
        if (superior) {
            NSString *currentName = NSStringFromClass([current class]);
            // 앞글자 소문자로
            NSString *smallLetteredProperty = [[[currentName substringToIndex:1] lowercaseString ] stringByAppendingString:[currentName substringFromIndex:1]];
            [superior setValue:current forKey:smallLetteredProperty];
        } else {
            // 상위 객체가 없을때, 즉 하나의 최상위 태그
            [self.result addObject:current];
            NSLog(@"close - final");
        }
    }
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
    NSLog(@"Parse error: %@", parseError);
    NSLog(@"Error line: %ld, column: %ld", (long)[parser lineNumber], (long)[parser columnNumber]);
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
    // Text
    id current = [self.current lastObject];
    if (current) {
        NSString* clsName = NSStringFromClass([current class]);
        
        if ([clsName isEqualToString:@"Text"]) {
            [current setValue:string forKey:@"content"];
        }
    }
}
@end
