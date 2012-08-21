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

#import "XPTextFieldDataCell.h"

@interface XPTextFieldDataCell (PrivateMethods)

- (void)textChanged:(id)sender;

@end

@implementation XPTextFieldDataCell

@synthesize textField = _textField;
@synthesize textFieldFrame = _textFieldFrame;
@synthesize value = _value;
@synthesize placeholder = _placeholder;
@synthesize keyboardType = _keyboardType;

static inline CGRect defaultTextFieldRect() {
    return CGRectMake(174, 12, 120, 23);
}

- (id)initWithText:(NSString *)text {
    if ((self = [super initWithText:text])) {
        self.textFieldFrame = defaultTextFieldRect();
    }
    
    return self;
}

- (id)initWithText:(NSString *)text value:(NSString *)value textFieldFrame:(CGRect)frame {
    if ((self = [super initWithText:text])) {
        self.value = value;
        self.textFieldFrame = frame;
    }
    
    return self;
}

- (id)initWithText:(NSString *)text value:(NSString *)value {
    if ((self = [self initWithText:text value:value textFieldFrame:defaultTextFieldRect()])) {
    }
    
    return self;
}

- (id)initWithText:(NSString *)text dataSource:(NSObject *)dataSource propertyKey:(NSString *)propertyKey textFieldFrame:(CGRect)frame {
    if ((self = [super initWithText:text dataSource:dataSource propertyKey:propertyKey])) {
        self.value = [dataSource valueForKey:propertyKey];
        self.textFieldFrame = frame;
    }
    
    return self;
}

- (id)initWithText:(NSString *)text dataSource:(NSObject *)dataSource propertyKey:(NSString *)propertyKey {
    if ((self = [self initWithText:text dataSource:dataSource propertyKey:propertyKey textFieldFrame:defaultTextFieldRect()])) {
    }
    
    return self;
}

- (void)configureCell:(UITableViewCell *)cell forTableView:(UITableView *)tableView {
    [super configureCell:cell forTableView:tableView];
    
    _textField = [[UITextField alloc] initWithFrame:self.textFieldFrame];
    _textField.adjustsFontSizeToFitWidth = NO;
    _textField.backgroundColor = [UIColor clearColor];
    _textField.autocorrectionType = UITextAutocorrectionTypeNo;
    _textField.autocapitalizationType = UITextAutocapitalizationTypeWords;
    _textField.textAlignment = UITextAlignmentRight;
    _textField.keyboardType = self.keyboardType;
    _textField.returnKeyType = UIReturnKeyDone;
    _textField.clearButtonMode = UITextFieldViewModeNever;
    _textField.delegate = self;
    
    _textField.text = self.value;
    _textField.placeholder = self.placeholder;
    
    [_textField addTarget:self action:@selector(textChanged:) forControlEvents:UIControlEventEditingChanged];
    
    cell.accessoryView = _textField;
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.textField resignFirstResponder];
    return NO;
}

#pragma mark - Private Methods

- (void)textChanged:(id)sender {
    self.value = [sender text];
    [self.dataSource setValue:self.value forKey:self.propertyKey];
}

@end
