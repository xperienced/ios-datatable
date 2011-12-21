//
//  SettingItem.h
//  ios-datatable
//
//  Created by Bartłomiej Wilczyński on 12/21/11.
//  Copyright (c) 2011 XPerienced. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class XPSettingGroup;

@interface XPSettingItem : NSObject

@property (strong, nonatomic) NSString *text;
@property (nonatomic, readonly) BOOL allowNavigation;
@property (strong, nonatomic) NSObject *dataSource;
@property (strong, nonatomic) NSString *propertyKey;

@property (unsafe_unretained, nonatomic) XPSettingGroup *settingGroup;


- (id)initWithText:(NSString *)text;
- (id)initWithText:(NSString *)text dataSource:(NSObject *)dataSource propertyKey:(NSString *)propertyKey;
- (void)configureCell:(UITableViewCell *)cell;
- (void)tableViewRowSelected:(UITableView *)tableView navigationController:(UINavigationController *)navigationController;

@end
