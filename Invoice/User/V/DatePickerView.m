
//
//  DatePickerView.m
//  自定义导航
//
//  Created by 可可家里 on 2017/4/8.
//  Copyright © 2017年 可可家里. All rights reserved.
//

#import "DatePickerView.h"

@implementation DatePickerView
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
 self.datePickerTitle.text =[NSString stringWithFormat:@"%@",self.Datetitle];

}

- (IBAction)clickCancelButtonAction:(id)sender {
    if (self.cancelBlock) {
        self.cancelBlock();
    }
}
- (IBAction)clickSureButtonAction:(id)sender {
    NSDate *select = self.datePicker.date;
    NSDateFormatter *dateFormmater = [[NSDateFormatter alloc]init];
    [dateFormmater setDateFormat:@"yyyyMMdd"];
    NSString *resultString = [dateFormmater stringFromDate:select];
    if (self.sureBlock) {
        self.sureBlock(resultString);
    }
    
    
}

@end
