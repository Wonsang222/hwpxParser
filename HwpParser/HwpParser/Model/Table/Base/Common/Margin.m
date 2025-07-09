//
//  OutMargin.m
//  HwpParser
//
//  Created by 인스웨이브 on 7/1/25.
//

#import "Margin.h"

@implementation Margin
@synthesize top;
@synthesize bottom;
@synthesize left;
@synthesize right;

@synthesize header;
@synthesize footer;

- (NSString *)description {
    return [NSString stringWithFormat:@"Margin{top=%@, bottom=%@, left=%@, right=%@, header=%@, footer=%@}", 
            self.top, self.bottom, self.left, self.right, self.header, self.footer];
}

@end

