//
//  ChongzhiViewController.m
//  Invoice
//
//  Created by 杨帅 on 2018/3/19.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "ChongzhiViewController.h"
#import "ChongZhiXuanXiang.h"
#import <StoreKit/StoreKit.h>

@interface ChongzhiViewController ()<UIScrollViewDelegate,SKRequestDelegate,SKProductsRequestDelegate,SKPaymentTransactionObserver>{
    UIView * nav;
    UIScrollView * scrollView;
    ChongZhiXuanXiang * chongzhixuanxiang;
    ChongZhiTCModel * model;
    ChongZhiModel * chzmodel;
    
    MBProgressHUD * mb;
    
    NSTimer * time;
}

@end

@implementation ChongzhiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addnav];
    [self addscrollView];
    // 监听购买结果
    [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
}
- (void)addnav{
    nav = [UIView new];
    nav.backgroundColor = RGB(0xff, 0xff, 0xff);
    [self.view addSubview:nav];
    WS(ws);
    [nav mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(ws.view).with.offset(0);
        make.height.mas_equalTo(44+StatusBar);
    }];
    
    BaseButton * left = [BaseButton buttonWithType:UIButtonTypeCustom];
    [left addTarget:self action:@selector(leftBarButtonItenAction) forControlEvents:UIControlEventTouchUpInside];
    [left setImage:UIIMAGE("返回icon") forState:UIControlStateNormal];
    [self.view addSubview:left];
    [left mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.view).with.offset(StatusBar+4);
        make.left.equalTo(nav.mas_left).with.offset(12);
        make.height.mas_equalTo(@35);
    }];
    
    BaseLabel * name = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x33, 0x33, 0x33) LabelFont:TextFont(17) TextAlignment:NSTextAlignmentCenter Text:@"充值中心"];
    [self.view addSubview:name];
    [name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(nav.mas_bottom).with.offset(-10);
        make.centerX.mas_equalTo(nav.mas_centerX);
        
    }];
}
- (void)leftBarButtonItenAction{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)addscrollView{
    WS(ws);
    static NSString * linshi = @"暂无数据";
    scrollView = [UIScrollView new];
    scrollView.backgroundColor = RGB(0xf8, 0xf8, 0xf8);
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(nav.mas_bottom).with.offset(0);
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.bottom.equalTo(ws.view).with.offset(0);
        
    }];
    
    chongzhixuanxiang = [ChongZhiXuanXiang new];
    chongzhixuanxiang.delegate = self;
    [scrollView addSubview:chongzhixuanxiang];
    [chongzhixuanxiang mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(scrollView.mas_top).with.offset(10);
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
    }];
    
    BaseLabel * ChongZhi = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0xff, 0xff, 0xff) LabelFont:TextFont(16) TextAlignment:NSTextAlignmentCenter Text:@"确认支付"];
    ChongZhi.backgroundColor = RGB(0xf9, 0x71, 0x2c);
    ChongZhi.layer.masksToBounds = YES;
    ChongZhi.layer.cornerRadius = 2;
    ChongZhi.userInteractionEnabled = YES;
    [scrollView addSubview:ChongZhi];
    [ChongZhi mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(chongzhixuanxiang.mas_bottom).with.offset(10);
        make.left.equalTo(ws.view).with.offset(15);
        make.right.equalTo(ws.view).with.offset(-15);
        make.bottom.equalTo(scrollView.mas_bottom).with.offset(-5);

        make.height.mas_equalTo(@44);
        
    }];
    
    //添加手势
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Chongzhi)];
    //将手势添加到需要相应的view中去
    [ChongZhi addGestureRecognizer:tapGesture];
    [self loadRequestData];

}

- (void)loadRequestData{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_CZJG];
    NSDictionary * dic = @{@"token":Me.token,@"type":@"ios"};
    
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            model = [ChongZhiTCModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                if (model.discount.count == 0) {
                    
                }else{
                    chongzhixuanxiang.discount = model.discount;
                    chzmodel = model.discount[0];

                }
            }

        }else{
            dispatch_async(dispatch_get_global_queue(0, 0), ^{
              time = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(repeat) userInfo:nil repeats:true];
                [[NSRunLoop currentRunLoop] run];
            });

        }
    }];
    
}

- (void)repeat{
    [self loadRequestData];
}
- (void)ClickModel:(ALlModel *)model Style:(Click)style{
    switch (style) {
        case ClickancZFXX:
            [self loadZZXX:model];
            break;
            
        default:
            break;
    }
}
- (void)loadZZXX:(ALlModel*)models{
    NSMutableArray * array = model.discount;
    chzmodel = array[models.inter];
    
}
- (void)Chongzhi{
    
    WS(ws);
    mb = [MBProgressHUD new];
    mb.mode = MBProgressHUDModeIndeterminate;
    mb.label.text = @"正在获取苹果商店...";
    [mb showAnimated:YES];
    mb.removeFromSuperViewOnHide = YES;
    [self.view.window addSubview:mb];
    [mb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(ws.view.window);
    }];
    
    if ([SKPaymentQueue canMakePayments]) {
        // 执行下面提到的第5步：
        NSArray* transactions = [SKPaymentQueue defaultQueue].transactions;
        
        [self requestProductData];
        MJExtensionLog(@"允许程序内付费购买");
    }
    else
    {
        MJExtensionLog(@"不允许程序内付费购买");
        UIAlertView *alerView =  [[UIAlertView alloc] initWithTitle:@"提示"
                                                            message:@"您的手机没有打开程序内付费购买"
                                                           delegate:nil cancelButtonTitle:NSLocalizedString(@"关闭",nil) otherButtonTitles:nil];
        
        [alerView show];
        

}
    
}

// 下面的ProductId应该是事先在itunesConnect中添加好的，已存在的付费项目。否则查询会失败。
- (void)requestProductData {
    MJExtensionLog(@"---------请求对应的产品信息------------");
    NSArray *product = nil;
    NSString * str = chzmodel.tag;

    product = [NSArray arrayWithObject:str];

    NSSet *nsset = [NSSet setWithArray:product];
    SKProductsRequest *request=[[SKProductsRequest alloc] initWithProductIdentifiers: nsset];
    request.delegate=self;
    [request start];
}

#pragma mark - SKProductsRequestDelegate
// 收到的产品信息回调
- (void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response{
    
    MJExtensionLog(@"-----------收到产品反馈信息--------------");
    NSArray *myProduct = response.products;
    if (myProduct.count == 0) {
        MJExtensionLog(@"无法获取产品信息，购买失败。");
        return;
    }
    MJExtensionLog(@"产品Product ID:%@",response.invalidProductIdentifiers);
    MJExtensionLog(@"产品付费数量: %d", (int)[myProduct count]);
    // populate UI
    for(SKProduct *product in myProduct){
        MJExtensionLog(@"product info");
        MJExtensionLog(@"SKProduct 描述信息%@", [product description]);
        MJExtensionLog(@"产品标题 %@" , product.localizedTitle);
        MJExtensionLog(@"产品描述信息: %@" , product.localizedDescription);
        MJExtensionLog(@"价格: %@" , product.price);
        MJExtensionLog(@"Product id: %@" , product.productIdentifier);
    }
    SKPayment * payment = [SKPayment paymentWithProduct:myProduct[0]];
    MJExtensionLog(@"---------发送购买请求------------");
    [[SKPaymentQueue defaultQueue] addPayment:payment];

}

//弹出错误信息
- (void)request:(SKRequest *)request didFailWithError:(NSError *)error{
    MJExtensionLog(@"-------弹出错误信息----------");
  
    UIAlertView *alerView =  [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Alert",NULL) message:[error localizedDescription]
                                                       delegate:nil cancelButtonTitle:NSLocalizedString(@"Close",nil) otherButtonTitles:nil];
    [alerView show];
    mb.label.text = @"连接失败 ...";
    [mb hideAnimated:NO afterDelay:1];
    
}

-(void) requestDidFinish:(SKRequest *)request
{
    MJExtensionLog(@"----------反馈信息结束--------------");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)dealloc
{
    [[SKPaymentQueue defaultQueue] removeTransactionObserver:self];
    [time invalidate];
    time = nil;
}
#pragma mark - SKPaymentTransactionObserver
// 处理交易结果
- (void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray *)transactions {
    for (SKPaymentTransaction *transaction in transactions)
    {
        switch (transaction.transactionState)
        {
            case SKPaymentTransactionStatePurchased://交易完成
                MJExtensionLog(@"transactionIdentifier = %@", transaction.transactionIdentifier);
                [self completeTransaction:transaction];
                break;
            case SKPaymentTransactionStateFailed://交易失败
                [self failedTransaction:transaction];
                break;
            case SKPaymentTransactionStateRestored://已经购买过该商品
                [self restoreTransaction:transaction];
                break;
            case SKPaymentTransactionStatePurchasing:      //商品添加进列表
                MJExtensionLog(@"商品添加进列表");
                break;
            default:
                break;
        }
    }
    
}

// 交易完成
- (void)completeTransaction:(SKPaymentTransaction *)transaction {
    NSString * productIdentifier = transaction.payment.productIdentifier;
    //    NSString * receipt = [transaction.transactionReceipt base64EncodedString];
    if ([productIdentifier length] > 0) {
        // 向自己的服务器验证购买凭证
        [self buyGoods];
    }
    
    // Remove the transaction from the payment queue.
    [[SKPaymentQueue defaultQueue] finishTransaction: transaction];
    mb.label.text = @"连接成功...";
    [mb hideAnimated:NO afterDelay:1];
    
}

// 交易失败
- (void)failedTransaction:(SKPaymentTransaction *)transaction {
    if(transaction.error.code != SKErrorPaymentCancelled) {
        mb.label.text = @"获取失败，请稍后再试...";
        [mb hideAnimated:NO afterDelay:1];
    } else {
        mb.label.text = @"取消交易...";
        [mb hideAnimated:NO afterDelay:1];
    }
    
    [[SKPaymentQueue defaultQueue] finishTransaction: transaction];
}
- (void)buyGoods{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_ZZJKrecharge];
    NSDictionary * dic = @{@"token":Me.token,@"dis_id":chzmodel.dis_id,@"rec_money":chzmodel.recharge,@"rec_payway":@"purchase",@"rec_rctualnumber":chzmodel.dis_votes};
    //
    [[BaseAppRequestManager manager] PostNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            MJExtensionLog(@"%@",responseObject);
        }else{
            
        }
    }];
}

// 已购商品
- (void)restoreTransaction:(SKPaymentTransaction *)transaction {
    // 对于已购商品，处理恢复购买的逻辑
    [[SKPaymentQueue defaultQueue] finishTransaction: transaction];
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
