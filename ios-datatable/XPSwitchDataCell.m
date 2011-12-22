//
//  XPSwitchDataCell.m
//  ios-datatable
//
//  Created by Bartłomiej Wilczyński on 12/22/11.
//  Copyright (c) 2011 XPerienced. All rights reserved.
//

#import "XPSwitchDataCell.h"

@implementation XPSwitchDataCell

@synthesize on = _on;

- (id)initWithText:(NSString *)text on:(BOOL)on {
    if ((self = [super initWithText:text])) {
        self.on = on;
    }
    
    return self;
}

- (id)initWithText:(NSString *)text dataSource:(NSObject *)dataSource propertyKey:(NSString *)propertyKey {
    if ((self = [super initWithText:text dataSource:dataSource propertyKey:propertyKey])) {
        self.on = [[dataSource valueForKey:propertyKey] boolValue];
    }
    
    return self;
}

- (void)valueChanged:(id)sender {
    UISwitch *onOffSwitch = sender;
    self.on = onOffSwitch.on;
    
    [self.dataSource setValue:[NSNumber numberWithBool:self.on] forKey:self.propertyKey];
}

- (void)configureCell:(UITableViewCell *)cell {
    [super configureCell:cell];
    
    // create and configure UISwitch
    UISwitch *onOffSwitch = [[UISwitch alloc] initWithFrame:CGRectZero];
    onOffSwitch.on = self.on;
    [onOffSwitch addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    
    cell.accessoryView = onOffSwitch;
}

@end
