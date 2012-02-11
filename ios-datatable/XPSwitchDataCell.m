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

- (void)configureCell:(UITableViewCell *)cell forTableView:(UITableView *)tableView {
    [super configureCell:cell forTableView:tableView];
    
    // create and configure UISwitch
    UISwitch *onOffSwitch = [[UISwitch alloc] initWithFrame:CGRectZero];
    onOffSwitch.on = self.on;
    [onOffSwitch addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    
    cell.accessoryView = onOffSwitch;
}

@end
