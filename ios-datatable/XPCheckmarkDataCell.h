//
//  XPCheckmarkDataCell.h
//  ios-datatable
//
//  Created by Bartłomiej Wilczyński on 1/14/12.
//  Copyright (c) 2012 XPerienced. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XPDataCell.h"


@interface XPCheckmarkDataCell : XPDataCell

@property (nonatomic) BOOL checked;

- (id)initWithText:(NSString *)text checked:(BOOL)checked;

@end
