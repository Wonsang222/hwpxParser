//
//  PagePr.m
//  HwpParser
//
//  Created by 인스웨이브 on 7/1/25.
//

#import "PagePr.h"

@implementation PagePr

@synthesize landscape;
@synthesize width;
@synthesize height;
@synthesize gutterType;

@synthesize margin;

- (void)setMargin:(Margin *)newMargin {
    margin = newMargin;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"PagePr{landscape=%@, width=%@, height=%@, gutterType=%@, margin=%@}", 
            self.landscape, self.width, self.height, self.gutterType, self.margin];
}

@end
