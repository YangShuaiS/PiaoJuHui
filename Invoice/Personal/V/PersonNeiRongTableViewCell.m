//
//  PersonNeiRongTableViewCell.m
//  Invoice
//
//  Created by 杨帅 on 2018/3/13.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "PersonNeiRongTableViewCell.h"

@implementation PersonNeiRongTableViewCell{
    FLAnimatedImageView * imageview;
    BaseLabel * name ;

}

+(instancetype)NewCellWithTableView:(UITableView *)tableView
                         Identifier:(NSString *)Identifier{
    PersonNeiRongTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:Identifier];
    if(cell==nil){
        cell=[[PersonNeiRongTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
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
    [self addSubview:imageview];
    [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(13);
        make.left.equalTo(ws).with.offset(15);
        make.bottom.equalTo(ws).with.offset(-13);
        make.width.mas_equalTo(24);
        make.height.mas_equalTo(24);
    }];
    
    name = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x33, 0x33, 0x33) LabelFont:TextFont(17) TextAlignment:NSTextAlignmentLeft Text:@"1111"];
    [self addSubview:name];
    [name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(17);
        make.left.equalTo(imageview.mas_right).with.offset(10);
    }];
    
    
    FLAnimatedImageView* backimageview = [FLAnimatedImageView new];
    backimageview.image = UIIMAGE("右箭头");
    [self addSubview:backimageview];
    [backimageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(18);
        make.right.equalTo(ws).with.offset(-15);
        make.bottom.equalTo(ws).with.offset(-18);
        make.width.mas_equalTo(14);
        make.height.mas_equalTo(14);
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



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setDic:(NSDictionary *)dic{
    _dic = dic;
    imageview.image = [UIImage imageNamed:dic[@"image"]];
    name.text = dic[@"title"];
}
@end
