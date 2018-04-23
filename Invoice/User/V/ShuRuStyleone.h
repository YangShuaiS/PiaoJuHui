//
//  ShuRuStyleone.h
//  Invoice
//
//  Created by 杨帅 on 2018/3/20.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"

@interface ShuRuStyleone : BaseView<UITextFieldDelegate>
@property (strong, nonatomic) UITextField *textField;
@property (assign, nonatomic) TextFieldENUM style;
@property (assign, nonatomic) TextFieldBackViewENUM styleback;

@property (copy, nonatomic) NSString * title;
@property (copy, nonatomic) NSString * names;
@end
