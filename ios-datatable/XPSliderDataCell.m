/*
 * ios-datatable - Easier iOS table views
 *
 * Copyright (c) 2012 XPerienced Bartłomiej Wilczyński
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 */

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
