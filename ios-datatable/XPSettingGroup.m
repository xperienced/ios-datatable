//
//  XPSettingGroup.m
//  ios-datatable
//
//  Created by Bartłomiej Wilczyński on 12/21/11.
//  Copyright (c) 2011 XPerienced. All rights reserved.
//

#import "XPSettingItem.h"
#import "XPSettingGroup.h"

@implementation XPSettingGroup

@synthesize text = _text;
@synthesize items = _items;

- (id)initWithText:(NSString *)text {
    if ((self = [super init])) {
        self.text = text;
    }
    
    return self;
}

- (void)setItems:(NSArray *)items {
    _items = items;
    
    for (XPSettingItem *item in items) {
        item.settingGroup = self;
    }
}

@end

