//
//  XMLParser.m
//  HwpParser
//
//  Created by Wonsang Hwang on 6/28/25.
//

/*
 
 t에는 text 포함 shit
 
 content일때는 string ++
 
 1. 여는 태그 나오면 클래스 찾아서 new
 2. attributes 순회하면서, nonnull 프로퍼티 데이터 생성 -> KVO
 3. 현재 작성중인 클래스로 등록
 4. 닫는태그 나오면 내 자신을 current에서 빼고, current가 비었다면 result로 가고 아니면 해당 클래스에 내 자신을 프로퍼티로
 */

#import "XMLParser.h"
#import "Model/Table/Base/Common/Run/SecPr/PagePr.h"

@interface XMLParser () <NSXMLParserDelegate>
@property (nonatomic, strong) NSMutableArray *current;
@property (nonatomic, strong) NSMutableArray *result;
@property (nonatomic, strong) NSArray *bannedList;
@end

@implementation XMLParser

- (NSMutableArray *)parseXMLFile:(NSString *)filePath {
    self.current = [NSMutableArray array];
    self.result = [NSMutableArray array];
    self.bannedList = @[@"config", @"sec"];

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
    // Start
    
    if ([self.bannedList containsObject: qName]) {
        return;
    }

    NSString* openTag = elementName;
    
    // hp: 네임스페이스 제거
    if ([openTag hasPrefix:@"hp:"]) {
        openTag = [openTag substringFromIndex:3];
    }
    
    if ([openTag isEqualToString:@"p"]) {
        openTag = @"paragraph";
    }
    
    if ([openTag isEqualToString:@"t"]) {
        openTag = @"text";
    }

    
    NSString *clsName = [openTag stringByReplacingCharactersInRange:NSMakeRange(0, 1)
                                                        withString:[[openTag substringToIndex:1] uppercaseString]];
    
    Class elemCls = NSClassFromString(clsName);
    
    if (elemCls) {
        NSLog(@"open tag : %@", clsName);
        id instace = [[elemCls alloc] init];
        [instace setValuesForKeysWithDictionary:attributeDict];
        [self.current addObject:instace];
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    // 해당 태그가 끝났을때, 해당 객체가 프로퍼티인지 확인하는 과정
    
    if ([self.bannedList containsObject: qName]) {
        return;
    }
    
    id current = [self.current lastObject];
    if (current) {
        [self.current removeLastObject];
        id superior = [self.current lastObject];
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
        }
    }
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
    NSLog(@"Parse error: %@", parseError);
    NSLog(@"Error line: %ld, column: %ld", (long)[parser lineNumber], (long)[parser columnNumber]);
}

@end
