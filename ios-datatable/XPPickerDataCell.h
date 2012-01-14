//
//  XPPickerDataCell.h
//  ios-datatable
//
//  Created by Bartłomiej Wilczyński on 1/14/12.
//  Copyright (c) 2012 XPerienced. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XPDataCell.h"

typedef NSString * (^FormatPickerDataCellBlock)(NSObject *item);

@interface XPPickerDataCell : XPDataCell<UIPickerViewDelegate, UIPickerViewDataSource>

@property (strong, nonatomic) NSObject *value;
@property (strong, nonatomic) NSArray *items;
@property (strong, nonatomic) FormatPickerDataCellBlock format;
@property (unsafe_unretained, nonatomic) UITextField *textField;
@property (nonatomic) int selectedRow;

- (id)initWithText:(NSString *)text items:(NSArray *)items value:(NSObject *)value;
- (id)initWithText:(NSString *)text items:(NSArray *)items value:(NSObject *)value format:(FormatPickerDataCellBlock)format;
- (id)initWithText:(NSString *)text 
        dataSource:(NSObject *)dataSource propertyKey:(NSString *)propertyKey 
             items:(NSArray *)items;
- (id)initWithText:(NSString *)text 
        dataSource:(NSObject *)dataSource propertyKey:(NSString *)propertyKey 
             items:(NSArray *)items 
            format:(FormatPickerDataCellBlock)format;

@end
