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
@synthesize actionSheet = _actionSheet;
@synthesize cell = _cell;

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

- (void)configureCell:(UITableViewCell *)cell forTableView:(UITableView *)tableView {
    [super configureCell:cell forTableView:tableView];
    
    self.cell = cell;
    
    // create action sheet to display picker
    
    self.actionSheet = [[UIActionSheet alloc] initWithTitle:nil 
                                                   delegate:nil
                                          cancelButtonTitle:nil
                                     destructiveButtonTitle:nil
                                          otherButtonTitles:nil];
    
    [self.actionSheet setActionSheetStyle:UIActionSheetStyleBlackTranslucent];
    
     // create picker view
    
    UIPickerView *picker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 40, 0, 0)];
    //picker.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
    
    picker.delegate = self;
    picker.dataSource = self;
    picker.showsSelectionIndicator = YES;
    self.selectedRow = [self.items indexOfObject:self.value];
    [picker selectRow:self.selectedRow inComponent:0 animated:YES];
    
    [self.actionSheet addSubview:picker];
    
    // create done button
    
    UISegmentedControl *closeButton = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObject:@"Done"]];
    closeButton.momentary = YES; 
    closeButton.frame = CGRectMake(260, 7.0f, 50.0f, 30.0f);
    closeButton.segmentedControlStyle = UISegmentedControlStyleBar;
    closeButton.tintColor = [UIColor blackColor];
    [closeButton addTarget:self action:@selector(pickerDone:) forControlEvents:UIControlEventValueChanged];
    [self.actionSheet addSubview:closeButton];
    
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(0,0,80,22)];
    textField.font = [UIFont systemFontOfSize:17];
    textField.textColor = cell.detailTextLabel.textColor;
    

    cell.detailTextLabel.text = self.text;
}

- (void)tableViewRowSelected:(UITableView *)tableView navigationController:(UINavigationController *)navigationController {
    [self.actionSheet showInView:[[UIApplication sharedApplication] keyWindow]];
    [self.actionSheet setBounds:CGRectMake(0, 0, 320, 485)];
}

- (BOOL)allowNavigation {
    return YES;
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
    
    [self.actionSheet dismissWithClickedButtonIndex:0 animated:YES];
    
    self.value = item;
    [self.dataSource setValue:item forKey:self.propertyKey];
    
    // TODO: update detail label
    self.cell.detailTextLabel.text = [self formatPickerItem:self.value];
}


@end
