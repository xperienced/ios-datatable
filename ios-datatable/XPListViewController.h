//
//  TrainerDetailsViewController.h
//  Rhythm Trainer Metronome
//
//  Created by Bartłomiej Wilczyński on 11/20/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol XPListViewDelegate;
@class XPDisclosureDataCell;

@interface XPListViewController : UITableViewController

@property (strong, nonatomic) XPDisclosureDataCell *dataCell;
@property (unsafe_unretained, nonatomic) id<XPListViewDelegate> delegate;

@end

@protocol XPListViewDelegate <NSObject>

- (void)listViewSelectionChanged;

@end

