//
//  MyInvoiceTableViewCell.m
//  Invoice
//
//  Created by 杨帅 on 2018/3/15.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MyInvoiceTableViewCell.h"
#import "MyInvoiceView.h"
@implementation MyInvoiceTableViewCell{
    BaseLabel * title;
    BaseLabel * money;
    MyInvoiceView * myInvoice;

}

+(instancetype)NewCellWithTableView:(UITableView *)tableView
                         Identifier:(NSString *)Identifier{
    MyInvoiceTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:Identifier];
    if(cell==nil){
        cell=[[MyInvoiceTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
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
    title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x33, 0x33, 0x3) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentLeft Text:@"公司名"];
    [self addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(15);
        make.left.equalTo(ws).with.offset(15);
        
    }];
    
    money = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0xf9, 0x71, 0x2c) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentLeft Text:@"0.0"];
    [self addSubview:money];
    [money mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(title.mas_bottom).with.offset(10);
        make.left.equalTo(ws).with.offset(15);
//        make.bottom.equalTo(ws).with.offset(-19);
    }];
    
    _baoxiao = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0xff, 0xff, 0xff) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentCenter Text:@"报销"];
    _baoxiao.backgroundColor = RGB(0xf9, 0x71, 0x2c);
    _baoxiao.layer.masksToBounds = YES;
    _baoxiao.layer.cornerRadius = 2;
    _baoxiao.userInteractionEnabled = YES;
    [self addSubview:_baoxiao];
    [_baoxiao mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(17);
        make.right.equalTo(ws).with.offset(-10);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(28);

    }];
    //添加手势
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(baoxiao:)];
    //将手势添加到需要相应的view中去
    [_baoxiao addGestureRecognizer:tapGesture];
    
    UIView * xianview = [UIView new];
    xianview.backgroundColor = RGB(0xee, 0xee, 0xee);
    [self addSubview:xianview];
    [xianview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(ws).with.offset(0);
        make.left.equalTo(ws).with.offset(0);
        make.top.equalTo(money.mas_bottom).with.offset(5);
        make.height.mas_equalTo(0.5);
    }];
    myInvoice = [MyInvoiceView new];
    [self addSubview:myInvoice];
    [myInvoice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(ws).with.offset(0);
        make.left.equalTo(ws).with.offset(0);
    make.top.equalTo(xianview.mas_bottom).with.offset(1);
        make.bottom.equalTo(ws).with.offset(0);

    }];
}

- (void)baoxiao:(UITapGestureRecognizer *)gesture{
    ALlModel * model = [ALlModel new];
    CGPoint point = [gesture locationInView:self.table];
    NSIndexPath *indexPath = [self.table indexPathForRowAtPoint:point];
    model.inter = indexPath.section;
    self.ClickBlocks(ClickancCehng, model);
}
- (void)setJdcmodel:(FPXQModel *)jdcmodel{
    _jdcmodel = jdcmodel;
    title.text = jdcmodel.ghdw;
    money.text = jdcmodel.jshj;
    if ([jdcmodel.re_type isEqualToString:@"02"]) {
        myInvoice.jdcmodel = _jdcmodel;

    }
    if ([jdcmodel.re_type isEqualToString:@"03"]) {
        myInvoice.jdcmodel = _jdcmodel;
    }
    if ([jdcmodel.re_type isEqualToString:@"04"]||[jdcmodel.re_type isEqualToString:@"01"]||[jdcmodel.re_type isEqualToString:@"10"]||[jdcmodel.re_type isEqualToString:@"11"]||[jdcmodel.re_type isEqualToString:@"14"]) {
        myInvoice.pdfp = _zzptmodel;
        
    }
}
- (void)setZzptmodel:(ZZPTModel *)zzptmodel{
    _zzptmodel = zzptmodel;
    title.text = zzptmodel.gfmc;
    money.text = zzptmodel.jshj;
    if ([zzptmodel.re_type isEqualToString:@"02"]) {
        myInvoice.pdfp = _zzptmodel;

    }
    if ([zzptmodel.re_type isEqualToString:@"03"]) {
        myInvoice.jdcmodel = _jdcmodel;
    }
    if ([zzptmodel.re_type isEqualToString:@"04"]||[zzptmodel.re_type isEqualToString:@"01"]||[zzptmodel.re_type isEqualToString:@"10"]
        ||[zzptmodel.re_type isEqualToString:@"11"]||[zzptmodel.re_type isEqualToString:@"14"]) {
        myInvoice.pdfp = _zzptmodel;
        
    }

}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setLabeStareZHuangTai{
    _baoxiao.backgroundColor = RGB(0xf9, 0x71, 0x2c);
    _baoxiao.layer.masksToBounds = YES;
    _baoxiao.layer.cornerRadius = 2;
    _baoxiao.userInteractionEnabled = YES;
    _baoxiao.text = @"报销";
}
- (void)setLabeEndZHuangTai{
    _baoxiao.backgroundColor = RGB(0xf9, 0x71, 0x2c);
    _baoxiao.layer.masksToBounds = YES;
    _baoxiao.layer.cornerRadius = 2;
    _baoxiao.userInteractionEnabled = NO;
    _baoxiao.text = @"报销中";

}
@end
