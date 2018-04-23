//
//  DatePickerView.h
//  自定义导航
//
//  Created by 可可家里 on 2017/4/8.
//  Copyright © 2017年 可可家里. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^cancelButtonBlock)();
typedef void(^sureButtonBlock)(NSString * selectDateStr);
@interface DatePickerView : UIView
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (nonatomic,strong) cancelButtonBlock cancelBlock;
@property (nonatomic,strong) sureButtonBlock sureBlock;
@property (weak, nonatomic) IBOutlet UILabel *datePickerTitle;
@property (nonatomic,strong) NSString*Datetitle;

@end
