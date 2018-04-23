//
//  ChongZhiJiLuTableViewCell.m
//  Invoice
//
//  Created by 杨帅 on 2018/3/14.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "ChongZhiJiLuTableViewCell.h"

@implementation ChongZhiJiLuTableViewCell{
    BaseLabel * leixing;
    BaseLabel * time;
    BaseLabel * money;
    FLAnimatedImageView * imageview;
}

+(instancetype)NewCellWithTableView:(UITableView *)tableView
                         Identifier:(NSString *)Identifier{
    ChongZhiJiLuTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:Identifier];
    if(cell==nil){
        cell=[[ChongZhiJiLuTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self buju];
    }
    return self;
}
-(void)buju{
    WS(ws);
    
    imageview = [FLAnimatedImageView new];
    imageview.image = UIIMAGE("微信 支付");
    [self addSubview:imageview];
    
    [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(24);
        make.left.equalTo(ws).with.offset(24);
        make.height.mas_equalTo(20);
        make.height.mas_equalTo(20);
        
    }];
    
    
    leixing = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x33, 0x33, 0x33) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentCenter Text:@"未知"];
    [self addSubview:leixing];
    [leixing mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(15);
        make.left.equalTo(imageview.mas_right).with.offset(10);
    }];
    
    time = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x99, 0x99, 0x99) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentCenter Text:@"0000_00_00"];
    [self addSubview:time];
    [time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(leixing.mas_bottom).with.offset(8);
        make.left.equalTo(imageview.mas_right).with.offset(10);

        make.bottom.equalTo(ws).with.offset(-15);

    }];
    
    money = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0xf9, 0x71, 0x2c) LabelFont:TextFont(20) TextAlignment:NSTextAlignmentLeft Text:@"¥00"];
    [self addSubview:money];
    [money mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(ws);
        make.right.equalTo(ws).with.offset(-15);

    }];
    
    
    UIView * xianview = [UIView new];
    xianview.backgroundColor = RGB(0xee, 0xee, 0xee);
    [self addSubview:xianview];
    [xianview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(ws).with.offset(0);
        make.left.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(0);
        make.height.mas_equalTo(0.5);
    }];
}
- (void)setModel:(ChongZhiJLXQModel *)model{
    _model = model;
    if ([model.rec_payway isEqualToString:@"wechat"]) {
        leixing.text = @"微信";
        imageview.image = UIIMAGE("微信 支付");

    }else if ([model.rec_payway isEqualToString:@"alipay"]){
        leixing.text = @"支付宝";
        imageview.image = UIIMAGE("支付宝");

    }else if ([model.rec_payway isEqualToString:@"purchase"]){
        
        imageview.image = UIIMAGE("apple");

        leixing.text = @"Apple内购";
    }else{
        leixing.text = @"其他";
        imageview.image = UIIMAGE("0");
    }
    time.text = [BaseObject TiemArray:model.rec_createtime String:@" "][0];
    money.text = model.rec_money;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
