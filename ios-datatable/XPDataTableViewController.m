//
//  SettingGroupViewController.m
//  
//
//  Created by Bartłomiej Wilczyński on 11/25/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "XPDataTableViewController.h"
#import "XPDataCell.h"
#import "XPDataGroup.h"

@implementation XPDataTableViewController

@synthesize dataGroups;

#pragma mark - Table view delegate

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    XPDataCell *cell = [[[self.dataGroups objectAtIndex:indexPath.section] cells] objectAtIndex:indexPath.row];
    return cell.allowNavigation ? indexPath : nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    XPDataCell *cell = [[[self.dataGroups objectAtIndex:indexPath.section] cells] objectAtIndex:indexPath.row];
    [cell tableViewRowSelected:tableView navigationController:self.navigationController];
}

#pragma mark - Table view data source

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    XPDataGroup *group = [self.dataGroups objectAtIndex:indexPath.section];
    XPDataCell *dataCell = [group.cells objectAtIndex:indexPath.row];
    [dataCell configureCell:cell forTableView:tableView];
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [self.dataGroups count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [[[self.dataGroups objectAtIndex:section] cells] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [[self.dataGroups objectAtIndex:section] text];
}

@end
