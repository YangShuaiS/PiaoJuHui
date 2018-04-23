//
//  PersonXinxiTableViewCell.m
//  Invoice
//
//  Created by 杨帅 on 2018/3/13.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "PersonXinxiTableViewCell.h"

@implementation PersonXinxiTableViewCell{
    BaseLabel * name ;
    BaseLabel * BuMen;
}
+(instancetype)NewCellWithTableView:(UITableView *)tableView
                         Identifier:(NSString *)Identifier{
    PersonXinxiTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:Identifier];
    if(cell==nil){
        cell=[[PersonXinxiTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
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
    FLAnimatedImageView * imageview = [FLAnimatedImageView new];
    imageview.image = UIIMAGE("默认头像");
    imageview.backgroundColor = [UIColor redColor];
    [self addSubview:imageview];
    [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(15);
        make.left.equalTo(ws).with.offset(15);
        make.width.mas_equalTo(58);
        make.height.mas_equalTo(58);
        make.bottom.equalTo(ws).with.offset(-5);

    }];
    
    name = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x33, 0x33, 0x33) LabelFont:TextFont(17) TextAlignment:NSTextAlignmentLeft Text:@""];
    [self addSubview:name];
    [name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(24);
    make.left.equalTo(imageview.mas_right).with.offset(15);
    }];

    BuMen = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x99, 0x99, 0x99) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentLeft Text:@""];
    [self addSubview:BuMen];
    [BuMen mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(name.mas_bottom).with.offset(10);
        make.left.equalTo(imageview.mas_right).with.offset(15);
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
- (void)setModel:(UserModel *)model{
    name.text = model.user_name;
    BuMen.text = model.user_department;
}
@end
