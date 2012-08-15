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

#import "XPDataCell.h"
#import "XPDataCell+Configuration.h"

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
    
    XPDataCellConfiguration *configuration = [XPDataCell configuration];
    [[configuration delegateForClass:[self class]] dataCell:self configureTableViewCell:cell forTableView:tableView];
}

- (void)tableViewRowSelected:(UITableView *)tableView navigationController:(UINavigationController *)navigationController {
    /* NO-OP */
}

- (BOOL)allowNavigation {
    return NO;
}

#pragma mark - XPDataCell Configuration

+ (XPDataCellConfiguration *)configuration {
    static dispatch_once_t onceToken;
    static XPDataCellConfiguration *_configuration;
    dispatch_once(&onceToken, ^{
        _configuration = [[XPDataCellConfiguration alloc] init];
    });
    
    return _configuration;
}

@end

