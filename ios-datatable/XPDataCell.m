//
//  SettingItem.m
//  ios-datatable
//
//  Created by Bartłomiej Wilczyński on 12/21/11.
//  Copyright (c) 2011 XPerienced. All rights reserved.
//

#import "XPDataCell.h"

@implementation XPDataCell

@synthesize text = _text;
@synthesize dataSource = _dataSource;
@synthesize propertyKey = _propertyKey;
@synthesize cellGroup = _settingGroup;
@synthesize tableView = _tableView;

- (id)initWithText:(NSString *)text {
    if ((self = [super init])) {
        self.text = text;
    }
    
    return self;
}

- (id)initWithText:(NSString *)text dataSource:(NSObject *)dataSource propertyKey:(NSString *)propertyKey {
    if ((self = [self initWithText:text])) {
        self.dataSource = dataSource;
        self.propertyKey = propertyKey;
    }
    
    return self;
}

- (void)configureCell:(UITableViewCell *)cell forTableView:(UITableView *)tableView {
    self.tableView = tableView;
    
    cell.textLabel.text = self.text;
    cell.detailTextLabel.text = nil;
    cell.accessoryView = nil;
}

- (void)tableViewRowSelected:(UITableView *)tableView navigationController:(UINavigationController *)navigationController {
    /* NO-OP */
}

- (BOOL)allowNavigation {
    return NO;
}

@end

