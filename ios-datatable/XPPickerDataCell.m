//
//  XPPickerDataCell.m
//  ios-datatable
//
//  Created by Bartłomiej Wilczyński on 1/14/12.
//  Copyright (c) 2012 XPerienced. All rights reserved.
//

#import "XPPickerDataCell.h"

@interface XPPickerDataCell(PrivateMethods)

- (NSString *)formatPickerItem:(NSObject *)item;
- (void)pickerDone:(id)sender;

@end

@implementation XPPickerDataCell

@synthesize items = _items;
@synthesize value = _value;
@synthesize format = _format;
@synthesize selectedRow = _selectedRow;
@synthesize textField = _textField;

- (id)initWithText:(NSString *)text items:(NSArray *)items value:(NSString *)value {
    if ((self = [self initWithText:text 
                             items:items 
                             value:value 
                            format:^(NSObject *item) { return [NSString stringWithFormat:@"%@", item]; } ])) {
    }
    
    return self;
}

- (id)initWithText:(NSString *)text items:(NSArray *)items value:(NSString *)value format:(FormatPickerDataCellBlock)format {
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

- (id)initWithText:(NSString *)text dataSource:(NSObject *)dataSource propertyKey:(NSString *)propertyKey items:(NSArray *)items format:(FormatPickerDataCellBlock)format {
    if ((self = [super initWithText:text dataSource:dataSource propertyKey:propertyKey])) {
        self.items = items;
        self.format = format;
        self.value = [dataSource valueForKey:propertyKey];
    }
    
    return self;
}

- (void)configureCell:(UITableViewCell *)cell {
    [super configureCell:cell];
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(0,0,80,22)];
    textField.font = [UIFont systemFontOfSize:17];
    textField.textColor = cell.detailTextLabel.textColor;
    
    // create picker view
    
    UIPickerView *picker = [[UIPickerView alloc] init];
    [picker sizeToFit];
    picker.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
    
    picker.delegate = self;
    picker.dataSource = self;
    picker.showsSelectionIndicator = YES;
    self.selectedRow = [self.items indexOfObject:self.value];
    [picker selectRow:self.selectedRow inComponent:0 animated:YES];
    
    // create done button
    UIToolbar* doneButtonToolbar = [[UIToolbar alloc] init];
    doneButtonToolbar.barStyle = UIBarStyleBlack;
    doneButtonToolbar.translucent = YES;
    doneButtonToolbar.tintColor = nil;
    [doneButtonToolbar sizeToFit];
    
    // TODO: localize Done button
    UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                   style:UIBarButtonItemStyleBordered 
                                                                  target:self
                                                                  action:@selector(pickerDone:)];
    
    [doneButtonToolbar setItems:[NSArray arrayWithObjects:doneButton, nil]];
    
    // attach toolbar to textfield accessory view
    textField.inputAccessoryView = doneButtonToolbar;
    
    textField.placeholder = self.text;
    textField.text = [self formatPickerItem:self.value];
    textField.textAlignment = UITextAlignmentRight;
    
    textField.inputView = picker;
    
    cell.accessoryView = textField;
    self.textField = textField;
}

#pragma UIPicker delegate

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [self.items count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSObject *item = [self.items objectAtIndex:row];
    return [self formatPickerItem:item];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    self.selectedRow = row;
}

#pragma mark - PrivateMethods

- (NSString *)formatPickerItem:(NSObject *)item {
    return self.format(item);
}

- (void)pickerDone:(id)sender {
    NSObject *item = [self.items objectAtIndex:self.selectedRow];
    
    self.value = item;
    [self.dataSource setValue:item forKey:self.propertyKey];
    
    // update text field
    self.textField.text = [self formatPickerItem:item];
    
    [self.textField resignFirstResponder];
}


@end
