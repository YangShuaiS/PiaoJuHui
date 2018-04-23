//
//  TongjiViewController.m
//  Invoice
//
//  Created by 杨帅 on 2018/3/19.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "TongjiViewController.h"
#import "BingTuView.h"
#import "ZhanBiXQView.h"
@interface TongjiViewController ()<UIScrollViewDelegate>{
    BingTuView * bingtu;
    TongJiModel * model;
}
@property (nonatomic, strong) UIScrollView *contentView;

@end

@implementation TongjiViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self loadRequestData];
    // Do any additional setup after loading the view.
}

- (void)addview{
    WS(ws);
    [self.view addSubview:self.contentView];
    
    bingtu = [BingTuView new];
    bingtu.model = model;
    [_contentView addSubview:bingtu];
    
    BaseLabel * fapiao = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x99, 0x99, 0x99) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentLeft Text:@"发票"];
    [self.view addSubview:fapiao];
 
    BaseLabel * shuliang = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x99, 0x99, 0x99) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentCenter Text:@"数量"];
    [self.view addSubview:shuliang];
    
    BaseLabel * zhanbi = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x99, 0x99, 0x99) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentRight Text:@"占比"];
    [self.view addSubview:zhanbi];
    
//    ZhanBiXQView * nozhanbi = [ZhanBiXQView new];
//    nozhanbi.style = BingTuDownWeiheyan;
//    [self.view addSubview:nozhanbi];
    
    ZhanBiXQView * yeszhanbi = [ZhanBiXQView new];
    yeszhanbi.model = model;
    yeszhanbi.style = BingTuDownYiHeYan;
    [self.view addSubview:yeszhanbi];
    
    ZhanBiXQView * yibaoxiao = [ZhanBiXQView new];
    yibaoxiao.model = model;
    yibaoxiao.style = BingTuDownYiBaoXio;
    [self.view addSubview:yibaoxiao];
    
    ZhanBiXQView * tjiaoweibaoxiao = [ZhanBiXQView new];
    tjiaoweibaoxiao.model = model;
    tjiaoweibaoxiao.style = BingTuDownWeiheyan;
    [self.view addSubview:tjiaoweibaoxiao];
    
    [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.view).with.offset(0);
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.bottom.equalTo(ws.view).with.offset(0);
        
    }];
    [bingtu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_contentView.mas_top).with.offset(10);
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);        
    }];
    
    [fapiao mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bingtu.mas_bottom).with.offset(13);
        make.left.equalTo(ws.view).with.offset(15);
    }];
    
    [shuliang mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bingtu.mas_bottom).with.offset(13);
        make.centerX.equalTo(ws.view);
    }];
    
    [zhanbi mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bingtu.mas_bottom).with.offset(13);
        make.right.equalTo(ws.view).with.offset(-15);
    }];
    

    
    [yeszhanbi mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(zhanbi.mas_bottom).with.offset(13);
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
    }];
    
    [yibaoxiao mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(yeszhanbi.mas_bottom).with.offset(1);
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
    }];
    [tjiaoweibaoxiao mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(yibaoxiao.mas_bottom).with.offset(1);
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
    }];
//    [_pieView mas_makeConstraints:^(MASConstraintMaker *make) {
//
////        make.centerX.mas_equalTo(ws.view);
//
//
//        make.top.equalTo(ws.view).with.offset(100);
//        make.left.equalTo(ws.view).with.offset(0);
//        make.right.equalTo(ws.view).with.offset(0);
//        make.height.mas_equalTo(150);
//        make.width.mas_equalTo(WIDTH);
//
//    }];

}

- (UIScrollView *)contentView {
    if (!_contentView) {
        _contentView = [UIScrollView new];
        _contentView.backgroundColor = RGB(0xf8, 0xf8, 0xf8);
        _contentView.delegate = self;
    }
    return _contentView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)loadRequestData{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_TJ];
    NSDictionary * dic = @{@"token":Me.token,@"type":_type};
    //
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            model = [TongJiModel mj_objectWithKeyValues:responseObject];
            [self addview];
        }else{
            
        }
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
