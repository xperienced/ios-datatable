/*
 * ios-datatable - Easier iOS table views
 *
 * Copyright (c) 2012 XPerienced Bartłomiej Wilczyński
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 */

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
