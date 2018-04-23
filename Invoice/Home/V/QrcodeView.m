//
//  QrcodeView.m
//  Invoice
//
//  Created by 杨帅 on 2018/3/9.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "QrcodeView.h"

@implementation QrcodeView

- (instancetype)init{
    self = [super init];
    if (self) {
        [self buju];
    }
    return self;
}

-(void)buju{
    WS(ws);
    self.userInteractionEnabled = YES;
    FLAnimatedImageView * imageview = [FLAnimatedImageView new];
    imageview.image = UIIMAGE("扫一扫-大");
    [self addSubview:imageview];
    [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(0);
        make.top.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(0);

    }];
    //添加手势
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(event:)];
    //将手势添加到需要相应的view中去
    [self addGestureRecognizer:tapGesture];
    //选择触发事件的方式（默认单机触发）
    [tapGesture setNumberOfTapsRequired:1];
}
- (void)event:(UITapGestureRecognizer *)gesture{
    ALlModel * model = [ALlModel new];
    [self.delegate ClickModel:model Style:ClickPushQrcode];
}
@end
