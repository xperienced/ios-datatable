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
 
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class XPDataGroup;

@interface XPDataCell : NSObject

@property (strong, nonatomic) NSString *text;
@property (nonatomic, readonly) BOOL allowNavigation;
@property (strong, nonatomic) NSObject *dataSource;
@property (strong, nonatomic) NSString *propertyKey;

@property (unsafe_unretained, nonatomic) XPDataGroup *cellGroup;
@property (unsafe_unretained, nonatomic) UITableView *tableView;

- (id)initWithText:(NSString *)text;
- (id)initWithText:(NSString *)text dataSource:(NSObject *)dataSource propertyKey:(NSString *)propertyKey;
- (void)configureCell:(UITableViewCell *)cell forTableView:(UITableView *)tableView;
- (void)tableViewRowSelected:(UITableView *)tableView navigationController:(UINavigationController *)navigationController;

@end
