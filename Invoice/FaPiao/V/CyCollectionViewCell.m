//
//  CyCollectionViewCell.m
//  Invoice
//
//  Created by 杨帅 on 2018/3/21.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "CyCollectionViewCell.h"

@implementation CyCollectionViewCell{
    FLAnimatedImageView* imageView;
    BaseLabel * label;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addview];
    }
    return self;
}
- (void)addview{
    WS(ws);
    imageView = [FLAnimatedImageView new];
//    imageView.image = UIIMAGE("检测通过bg");
    [self addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(0);
        make.left.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(0);
    }];
    
    label = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0xff, 0xff, 0xff) LabelFont:TextFont(16) TextAlignment:NSTextAlignmentCenter Text:@"临时"];
    label.numberOfLines = 0;
    [self addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageView.mas_top).with.offset(11);
        make.right.equalTo(imageView.mas_right).with.offset(-15);
    }];
}
- (void)setString:(NSString *)string{
    _string = string;
    label.text = string;

}
- (void)setTongguo:(NSString *)tongguo{
    _tongguo = tongguo;

    if ([_tongguo isEqualToString:@"1"]) {
        imageView.image = UIIMAGE("检测通过bg");
    }else{
        imageView.image = UIIMAGE("失败bg");
    }
}
@end
