//
//  TuiChuTableViewCell.m
//  Invoice
//
//  Created by 杨帅 on 2018/3/13.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "TuiChuTableViewCell.h"

@implementation TuiChuTableViewCell{
    BaseLabel * TuiChu ;

}

+(instancetype)NewCellWithTableView:(UITableView *)tableView
                         Identifier:(NSString *)Identifier{
    TuiChuTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:Identifier];
    if(cell==nil){
        cell=[[TuiChuTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
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
    TuiChu = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0xf8, 0x4e, 0x4e) LabelFont:TextFont(16) TextAlignment:NSTextAlignmentCenter Text:@"退出登录"];
    [self addSubview:TuiChu];
    [TuiChu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(17);
        make.bottom.equalTo(ws).with.offset(-17);
        make.center.mas_equalTo(ws);
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

@end
