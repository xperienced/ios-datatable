//
//  XPSliderDataCell.h
//  ios-datatable
//
//  Created by Bartłomiej Wilczyński on 1/14/12.
//  Copyright (c) 2012 XPerienced. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XPDataCell.h"

@interface XPSliderDataCell : XPDataCell

@property (nonatomic) float value;
@property (nonatomic) CGRect sliderFrame;
@property (nonatomic) float minimumValue;
@property (nonatomic) float maximumValue;

- (id)initWithText:(NSString *)text value:(float)value;
- (id)initWithText:(NSString *)text value:(float)value sliderFrame:(CGRect)frame;
- (id)initWithText:(NSString *)text dataSource:(NSObject *)dataSource propertyKey:(NSString *)propertyKey sliderFrame:(CGRect)frame;

@end
