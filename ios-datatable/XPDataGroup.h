//
//  XPSettingGroup.h
//  ios-datatable
//
//  Created by Bartłomiej Wilczyński on 12/21/11.
//  Copyright (c) 2011 XPerienced. All rights reserved.
//

@interface XPDataGroup : NSObject

@property (strong, nonatomic) NSString *text;
@property (strong, nonatomic) NSArray *cells;

- (id)initWithText:(NSString *)text;

@end