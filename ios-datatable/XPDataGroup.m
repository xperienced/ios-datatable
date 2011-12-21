//
//  XPSettingGroup.m
//  ios-datatable
//
//  Created by Bartłomiej Wilczyński on 12/21/11.
//  Copyright (c) 2011 XPerienced. All rights reserved.
//

#import "XPDataCell.h"
#import "XPDataGroup.h"

@implementation XPDataGroup

@synthesize text = _text;
@synthesize cells = _cells;

- (id)initWithText:(NSString *)text {
    if ((self = [super init])) {
        self.text = text;
    }
    
    return self;
}

- (void)setCells:(NSArray *)cells {
    _cells = cells;
    
    for (XPDataCell *cell in cells) {
        cell.cellGroup = self;
    }
}

@end

