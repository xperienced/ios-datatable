//
//  XPCheckmarkDataCell.m
//  ios-datatable
//
//  Created by Bartłomiej Wilczyński on 1/14/12.
//  Copyright (c) 2012 XPerienced. All rights reserved.
//

#import "XPCheckmarkDataCell.h"
#import "XPDataGroup.h"

@implementation XPCheckmarkDataCell

@synthesize checked = _checked;

- (BOOL)allowNavigation {
    return YES;
}

- (id)initWithText:(NSString *)text checked:(BOOL)checked {
    if ((self = [super initWithText:text])) {
        self.checked = checked;
    }
    
    return self;
}

- (void)configureCell:(UITableViewCell *)cell {
    [super configureCell:cell];
    
    cell.accessoryType = self.checked ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
}

- (void)tableViewRowSelected:(UITableView *)tableView navigationController:(UINavigationController *)navigationController {
    for (XPCheckmarkDataCell *item in self.cellGroup.cells) {
        item.checked = NO;
    }
    self.checked = YES;
    
    [tableView reloadData];
}


@end
