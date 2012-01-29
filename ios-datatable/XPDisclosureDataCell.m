//
//  XPDetailDataCell.m
//  ios-datatable
//
//  Created by Bartłomiej Wilczyński on 1/29/12.
//  Copyright (c) 2012 XPerienced. All rights reserved.
//

#import "XPDisclosureDataCell.h"
#import "XPListViewController.h"

@interface XPDisclosureDataCell(PrivateMethods)

- (NSString *)formatDisclosureDataCell:(NSObject *)item;

@end

@implementation XPDisclosureDataCell

@synthesize items = _items;
@synthesize value = _value;
@synthesize format = _format;

- (id)initWithText:(NSString *)text items:(NSArray *)items value:(NSString *)value {
    if ((self = [self initWithText:text 
                             items:items 
                             value:value 
                            format:^(NSObject *item) { return [NSString stringWithFormat:@"%@", item]; } ])) {
    }
    
    return self;
}

- (id)initWithText:(NSString *)text items:(NSArray *)items value:(NSString *)value format:(FormatDisclosureDataCellBlock)format {
    if ((self = [super initWithText:text])) {
        self.items = items;
        self.value = value;
        self.format = format;
    }
    
    return self;
}

- (id)initWithText:(NSString *)text dataSource:(NSObject *)dataSource propertyKey:(NSString *)propertyKey items:(NSArray *)items {
    if ((self = [self initWithText:text dataSource:dataSource propertyKey:propertyKey items:items format:^(NSObject *item) { return [NSString stringWithFormat:@"%@", item]; }])) {
        
    }
    
    return self;
}

- (id)initWithText:(NSString *)text dataSource:(NSObject *)dataSource propertyKey:(NSString *)propertyKey items:(NSArray *)items format:(FormatDisclosureDataCellBlock)format {
    if ((self = [super initWithText:text dataSource:dataSource propertyKey:propertyKey])) {
        self.items = items;
        self.format = format;
        self.value = [dataSource valueForKey:propertyKey];
    }
    
    return self;
}

- (BOOL)allowNavigation {
    return YES;
}

- (void)configureCell:(UITableViewCell *)cell forTableView:(UITableView *)tableView {
    [super configureCell:cell forTableView:tableView];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.detailTextLabel.text = self.format(self.value);
}

- (void)tableViewRowSelected:(UITableView *)tableView 
        navigationController:(UINavigationController *)navigationController {
    
    XPListViewController *detailViewController = [[XPListViewController alloc] initWithStyle:UITableViewStyleGrouped];
    detailViewController.dataCell = self;
    detailViewController.delegate = self;
    
    [navigationController pushViewController:detailViewController animated:YES];
}

#pragma mark XPListViewDelegate

- (void)listViewSelectionChanged {
    [self.tableView reloadData];
}

@end
