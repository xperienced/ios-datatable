//
//  XPDetailDataCell.h
//  ios-datatable
//
//  Created by Bartłomiej Wilczyński on 1/29/12.
//  Copyright (c) 2012 XPerienced. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XPDataCell.h"
#import "XPListViewController.h"

typedef NSString * (^FormatDisclosureDataCellBlock)(NSObject *item);

@interface XPDisclosureDataCell : XPDataCell<XPListViewDelegate>

@property (strong, nonatomic) NSArray *items;
@property (strong, nonatomic) NSObject *value;
@property (strong, nonatomic) FormatDisclosureDataCellBlock format;

- (id)initWithText:(NSString *)text items:(NSArray *)items value:(NSObject *)value;
- (id)initWithText:(NSString *)text items:(NSArray *)items value:(NSObject *)value format:(FormatDisclosureDataCellBlock)format;
- (id)initWithText:(NSString *)text 
        dataSource:(NSObject *)dataSource propertyKey:(NSString *)propertyKey 
             items:(NSArray *)items;
- (id)initWithText:(NSString *)text 
        dataSource:(NSObject *)dataSource propertyKey:(NSString *)propertyKey 
             items:(NSArray *)items 
            format:(FormatDisclosureDataCellBlock)format;

@end
