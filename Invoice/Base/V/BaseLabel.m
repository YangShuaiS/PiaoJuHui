//
//  BaseLabel.m
//  ZYlive
//
//  Created by 杨帅 on 2017/6/6.
//  Copyright © 2017年 杨帅. All rights reserved.
//

#import "BaseLabel.h"

@implementation BaseLabel

- (instancetype)initWithFrame:(CGRect)frame LabelTxteColor:(UIColor *)textcolor LabelFont:(UIFont *)font TextAlignment:(NSTextAlignment)textAlignment Text:(NSString *)text{
    self = [super initWithFrame:frame];
    if (self) {
        self.textColor = textcolor;
        self.font = font;
        self.textAlignment = textAlignment;
        self.text = text;
        self.minimumScaleFactor=4;
        self.adjustsFontSizeToFitWidth=YES;
    }
    return self;
}

@end
