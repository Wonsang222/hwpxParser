//
//  EndNotePr.h
//  HwpParser
//
//  Created by 인스웨이브 on 7/1/25.
//

#import <Foundation/Foundation.h>

@class AutoNumFormat;
@class NoteLine;
@class NoteSpacing;
@class Numbering;
@class Placement;

@interface EndNotePr : NSObject
@property(nonnull, strong) AutoNumFormat *autoNumFormat;
@property(nonnull, strong) NoteLine *noteLine;
@property(nonnull, strong) NoteSpacing *noteSpacing;
@property(nonnull, strong) Numbering *numbering;
@property(nonnull, strong) Placement *placement;
@end
