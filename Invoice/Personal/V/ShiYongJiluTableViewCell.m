//
//  ShiYongJiluTableViewCell.m
//  Invoice
//
//  Created by 杨帅 on 2018/3/14.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "ShiYongJiluTableViewCell.h"

@implementation ShiYongJiluTableViewCell{
    BaseLabel * neirong;
    BaseLabel * fapiaoaima;
    BaseLabel * time;
}

+(instancetype)NewCellWithTableView:(UITableView *)tableView
                         Identifier:(NSString *)Identifier{
    ShiYongJiluTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:Identifier];
    if(cell==nil){
        cell=[[ShiYongJiluTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
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
    
    FLAnimatedImageView * search = [FLAnimatedImageView new];
    search.image = UIIMAGE("查询icon");
    [self addSubview:search];
    
    neirong = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x99, 0x99, 0x99) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentLeft Text:@"你猜我呀写啥"];
    neirong.numberOfLines = 0;
    [self addSubview:neirong];
    
    fapiaoaima = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x99, 0x99, 0x99) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentLeft Text:@"发票代码：000000000"];
    [self addSubview:fapiaoaima];
    
    time = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x99, 0x99, 0x99) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentLeft Text:@"0000_00_00"];
    [self addSubview:time];
    
    [search mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(15);
        make.left.equalTo(ws).with.offset(15);
        make.height.mas_equalTo(20);

    }];
    
    
    [neirong mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(15);
        make.left.equalTo(search.mas_right).with.offset(10);
        make.width.mas_equalTo(WIDTH/2);

    }];
    [fapiaoaima mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(neirong.mas_bottom).with.offset(5);
        make.left.equalTo(search.mas_right).with.offset(10);
        make.bottom.equalTo(ws).with.offset(-15);

    }];
    
    
    [time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(15);
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


- (void)setModel:(SYJLModel *)model{
    _model = model;
    if (model.xfmc) {
        neirong.text = model.xfmc;

    }
    if (model.xfmc) {
        neirong.text = model.xfmc;

    }
    fapiaoaima.text = model.fphm;
    time.text = model.ure_createtime;
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
