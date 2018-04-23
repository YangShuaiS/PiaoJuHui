//
//  ShuRuStyleone.m
//  Invoice
//
//  Created by 杨帅 on 2018/3/20.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "ShuRuStyleone.h"

@implementation ShuRuStyleone{
    BaseLabel * name;
}
- (instancetype)init{
    self = [super init];
    [self addview];
    return self;
}
- (void)addview{
    WS(ws);
    name = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0xff, 0xff, 0xff) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentLeft Text:@"预留"];
    [self addSubview:name];
    [name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(1);
        make.left.equalTo(ws).with.offset(30);
    }];
    
    self.textField = [UITextField new];
    _textField.delegate = self;
    _textField.borderStyle = UITextBorderStyleNone;
    [_textField addTarget:self action:@selector(phoneNum_tfChange:) forControlEvents:UIControlEventEditingChanged];
    [self addSubview:_textField];
    [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(name.mas_bottom).with.offset(15);
        make.left.equalTo(ws).with.offset(30);
        make.right.equalTo(ws).with.offset(-30);
    }];
    
    
    
    UIView * xianview = [UIView new];
    xianview.backgroundColor = RGB(0xd8, 0xd8, 0xd8);
    xianview.alpha = 0.2;
    [self addSubview:xianview];
    [xianview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(ws).with.offset(-30);
        make.left.equalTo(ws).with.offset(30);
        make.top.equalTo(ws.textField.mas_bottom).with.offset(15);
        make.bottom.equalTo(ws).with.offset(0);
        make.height.mas_equalTo(0.5);
    }];
    
}
- (void)phoneNum_tfChange:(UITextField *)textField
{
    
}
- (void)setTitle:(NSString *)title{
    _title = title;

    
}

-(void)setNames:(NSString *)names{
    _names = names;
    name.text = names;
}
-(void)setStyle:(TextFieldENUM)style{
    _style = style;
    switch (style) {
        case TextFieldPassword:
            [self PaswordSX];
            break;
        case TextFieldTime:
            [self NowTime];
            break;
        case TextFieldShuZi:
            [self ShuZi];
            break;
        default:
            break;
    }
}
- (void)PaswordSX{
    //常用于密码输入
    _textField.keyboardType = UIKeyboardTypeASCIICapable;
    //安文
    _textField.secureTextEntry = YES;
}
- (void)ShuZi{
    //常用于可用于带有小数点的数字输入
    _textField.keyboardType = UIKeyboardTypeDecimalPad;
}
- (void)NowTime{
    
    //    _textField.enabled = NO;
    //    UIView * v = [UIView new];
    //    [self addSubview:v];
    //    [v mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.right.equalTo(v.mas_right).with.offset(0);
    //        make.left.equalTo(v.mas_left).with.offset(0);
    //        make.bottom.equalTo(v.mas_bottom).with.offset(0);
    //        make.top.equalTo(v.mas_top).with.offset(0);
    //
    //    }];
    //    //添加手势
    //    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(time)];
    //    //将手势添加到需要相应的view中去
    //    [v addGestureRecognizer:tapGesture];
    
    
}
- (void)time{
    [self.delegate ClickModel:nil Style:ClickancTime
     ];
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    //写你要实现的：页面跳转的相关代码
    switch (_style) {
        case TextFieldTime:
            [self time];
            return NO;
            break;
            
        default:
            break;
    }
    return YES;
}

- (void)setStyleback:(TextFieldBackViewENUM)styleback{
    _styleback = styleback;
    switch (styleback) {
        case TextFieldBackViewWhit:
            [self whit];
            break;
        case TextFieldBackViewBack:
            [self back];
            break;
        default:
            break;
    }
}
- (void)whit{
    UIColor * color = RGBA(0xff, 0xff, 0xff, 0.2);
    _textField.textColor = RGBA(0xff, 0xff, 0xff, 1);
    _textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:_title attributes:@{NSForegroundColorAttributeName: color}];
    name.textColor = RGB(0xff, 0xff, 0xff);
}
- (void)back{
    UIColor * color = RGBA(0xcc, 0xcc, 0xcc, 1);
    _textField.textColor = RGBA(0x33, 0x33, 0x33, 1);
    _textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:_title attributes:@{NSForegroundColorAttributeName: color}];
    name.textColor = RGB(0x33, 0x33, 0x33);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
