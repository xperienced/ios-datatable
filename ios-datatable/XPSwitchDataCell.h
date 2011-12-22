//
//  XPSwitchDataCell.h
//  ios-datatable
//
//  Created by Bartłomiej Wilczyński on 12/22/11.
//  Copyright (c) 2011 XPerienced. All rights reserved.
//

#import "XPDataCell.h"

@interface XPSwitchDataCell : XPDataCell

@property (nonatomic) BOOL on;

- (id)initWithText:(NSString *)text on:(BOOL)on;

@end
