//
//  XPSliderDataCell.m
//  ios-datatable
//
//  Created by Bartłomiej Wilczyński on 1/14/12.
//  Copyright (c) 2012 XPerienced. All rights reserved.
//

#import "XPSliderDataCell.h"

@implementation XPSliderDataCell

@synthesize value = _value;
@synthesize sliderFrame = _sliderFrame;
@synthesize minimumValue, maximumValue;

- (id)initWithText:(NSString *)text value:(float)value {
    if ((self = [self initWithText:text value:value sliderFrame:CGRectMake(174, 12, 120, 23)])) {
        self.maximumValue = 1.0f;
    }
    
    return self;
}

- (id)initWithText:(NSString *)text value:(float)value sliderFrame:(CGRect)frame {
    if ((self = [super initWithText:text])) {
        self.maximumValue = 1.0f;
        self.value = value;
        self.sliderFrame = frame;
    }
    
    return self;
}

- (id)initWithText:(NSString *)text dataSource:(NSObject *)dataSource propertyKey:(NSString *)propertyKey sliderFrame:(CGRect)frame {
    if ((self = [super initWithText:text dataSource:dataSource propertyKey:propertyKey])) {
        self.maximumValue = 1.0f;
        self.value = [[dataSource valueForKey:propertyKey] floatValue];
        self.sliderFrame = frame;
    }
    
    return self;
}

- (void)valueChanged:(id)sender {
    UISlider *slider = sender;
    self.value = slider.value;
    
    [self.dataSource setValue:[NSNumber numberWithFloat:self.value] forKey:self.propertyKey];
}

- (void)configureCell:(UITableViewCell *)cell forTableView:(UITableView *)tableView {
    [super configureCell:cell forTableView:tableView];
    
    // create and configure UISwitch
    UISlider *slider = [[UISlider alloc] initWithFrame:self.sliderFrame];
    slider.value = self.value;
    slider.minimumValue = self.minimumValue;
    slider.maximumValue = self.maximumValue;
    [slider addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    
    cell.accessoryView = slider;
}


@end
