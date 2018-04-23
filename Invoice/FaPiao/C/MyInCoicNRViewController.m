//
//  MyInCoicNRViewController.m
//  Invoice
//
//  Created by 杨帅 on 2018/3/15.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MyInCoicNRViewController.h"
#import "MyInvoiceTableViewCell.h"
#import "FaPiaoXQViewController.h"
@interface MyInCoicNRViewController ()<UITableViewDelegate,UITableViewDataSource>{
    NSMutableArray * array;
    NSMutableArray * typearray;
    NSNumber * number;
    FPModel * fpModel;
    
    NSMutableArray * linshiarray;


}
@property (strong, nonatomic) BaseTableView *tableView;

@end

@implementation MyInCoicNRViewController
- (void)chushihua{
    linshiarray = [NSMutableArray array];
    number = @1;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    WS(ws);
    [self chushihua];
    typearray = [NSMutableArray array];
    [self.view addSubview:self.tableView];
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        // 进入刷新状态后会自动调用这个 block
        if ([number isEqual:@1]) {
            [ws loadRequestData];
        }else{
            if (fpModel.countpage<number) {
                [ws.tableView.mj_footer endRefreshingWithNoMoreData];
            }else{
                [ws loadRequestData];
            }
        }
    }];
    
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self chushihua];
        [ws loadRequestData];
    }];

    

    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.view).with.offset(0);
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.bottom.equalTo(ws.view).with.offset(0);

    }];
    [self loadRequestData];
    
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[BaseTableView alloc] init];
        _tableView.separatorStyle = UITableViewStyleGrouped;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = RGB(0xf8, 0xf8, 0xf8);
        _tableView.estimatedRowHeight = 150;//估算高度
        _tableView.rowHeight = UITableViewAutomaticDimension;
        //使tableview无数据时候无下划线
        _tableView.tableFooterView = [[UIView alloc]init];
    }else{
        [_tableView reloadData];
    }
    return _tableView;
}

#pragma mark  - tableViewDelegate代理方法

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return array.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * rid = [NSString stringWithFormat:@"cell"];
    WS(ws);
    MyInvoiceTableViewCell * cell = [MyInvoiceTableViewCell NewCellWithTableView:tableView Identifier:rid];
    cell.baoxiao.hidden = NO;
    [cell setLabeStareZHuangTai];

    cell.table = _tableView;
    NSString * type;

    if (typearray.count==0) {
        
    }else{
    type = typearray[indexPath.section];
    }
    if ([type isEqualToString:@"02"]) {
        cell.zzptmodel = array[indexPath.section];
        if ([cell.zzptmodel.re_status isEqualToString:@"2"]) {
            [cell setLabeEndZHuangTai];
        }
        if ([Me.user_type isEqualToString:@"1"]) {
            if (![cell.zzptmodel.re_checkresult isEqualToString:PANDUANSHUZHIGEREN]) {
                cell.baoxiao.hidden = YES;
            }
        }else{
            if (![cell.zzptmodel.re_checkresult isEqualToString:PANDUANSHUZHIQIYE]) {
                cell.baoxiao.hidden = YES;
            }
        }
    }
    if ([type isEqualToString:@"03"]) {
        cell.jdcmodel = array[indexPath.section];
        if ([cell.jdcmodel.re_status isEqualToString:@"2"]) {
            [cell setLabeEndZHuangTai];
        }
        if ([Me.user_type isEqualToString:@"1"]) {
            if (![cell.jdcmodel.re_checkresult isEqualToString:PANDUANSHUZHIGEREN]) {
                cell.baoxiao.hidden = YES;
            }
        }else{
            if (![cell.jdcmodel.re_checkresult isEqualToString:PANDUANSHUZHIQIYE]) {
                cell.baoxiao.hidden = YES;
            }
        }
    }
    if ([type isEqualToString:@"04"]||[type isEqualToString:@"01"]||[type isEqualToString:@"10"]||[type isEqualToString:@"11"]||[type isEqualToString:@"10"]||[type isEqualToString:@"14"]) {
        cell.zzptmodel = array[indexPath.section];
        if ([cell.zzptmodel.re_status isEqualToString:@"2"]) {
            [cell setLabeEndZHuangTai];
        }
        if ([Me.user_type isEqualToString:@"1"]) {
            if (![cell.zzptmodel.re_checkresult isEqualToString:PANDUANSHUZHIGEREN]) {
                cell.baoxiao.hidden = YES;
            }
        }else{
            if (![cell.zzptmodel.re_checkresult isEqualToString:PANDUANSHUZHIQIYE]) {
                cell.baoxiao.hidden = YES;
            }
        }
        
    }

    
    [cell backClickBlock:^(Click block, ALlModel *allModel) {
        [ws NotificBlock:block Model:allModel];
    }];
    if ([_type isEqualToString:@"3"]) {
        cell.baoxiao.hidden = YES;

    }
    return cell;
    
}

- (void)NotificBlock:(Click)block
               Model:(ALlModel *)model
{
    switch (block) {
        case ClickancCehng:
            [self load:model];
            break;
            
        default:
            break;
    }
}
-(void)load:(ALlModel *)model{
    WS(ws);
    MBProgressHUD * mb = [MBProgressHUD new];
    mb.mode = MBProgressHUDModeIndeterminate;
    mb.label.text = @"正在报销...";
    [mb showAnimated:YES];
    mb.removeFromSuperViewOnHide = YES;
    [self.view.window addSubview:mb];
    [mb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(ws.view.window);
    }];
    
    NSString * type = typearray[model.inter];
    NSString * invoiceid ;
    if ([type isEqualToString:@"03"]) {
        FPXQModel * models = array[model.inter];
        invoiceid = models.re_id;
    }
    if ([type isEqualToString:@"04"]||[type isEqualToString:@"01"]||[type isEqualToString:@"10"]||[type isEqualToString:@"11"]||[type isEqualToString:@"10"]||[type isEqualToString:@"14"]) {
        ZZPTModel * models = array[model.inter];
        invoiceid = models.re_id;
    }
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_FPBX];
    NSDictionary * dic = @{@"token":Me.token,@"invoiceid":invoiceid};
    //
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            HomeModel * model = [HomeModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
            }
            mb.mode = MBProgressHUDModeCustomView;

            mb.label.text = model.message;
            [mb hideAnimated:YES afterDelay:2];
        }else{
            mb.mode = MBProgressHUDModeCustomView;

            mb.label.text = @"网络请求失败";
            [mb hideAnimated:YES afterDelay:2];

        }
    }];
    
    
}
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 100;
//}
- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 5;
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * v = [UIView new];
    v.backgroundColor = RGB(0xf8, 0xf8, 0xf8);
    return v;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    FaPiaoXQViewController * vc = [FaPiaoXQViewController new];
    NSString * type = typearray[indexPath.section];

    if ([type isEqualToString:@"02"]) {
        
    }
    if ([type isEqualToString:@"03"]) {
        FPXQModel * model = array[indexPath.section];
        vc.fptype = type;
        vc.jdcmodel = model;
    }
    if ([type isEqualToString:@"04"]||[type isEqualToString:@"01"]||[type isEqualToString:@"10"]||[type isEqualToString:@"11"]||[type isEqualToString:@"10"]||[type isEqualToString:@"14"]) {
        ZZPTModel * model = array[indexPath.section];
        vc.fptype = type;
        vc.zzptmodel = model;
        
    }
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)loadRequestData{
    MJExtensionLog(@"%@",number);
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_FPLB];
    NSDictionary * dic = @{@"token":Me.token,@"type":_type,@"page":number,@"count":@PAGENUMBER};
    //
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            fpModel = [FPModel mj_objectWithKeyValues:responseObject];
            if ([fpModel.code isEqualToString:@"200"]) {
                NSArray * allarray = responseObject[@"data"];
                for (NSDictionary * docs in allarray) {
                    [typearray addObject:docs[@"re_type"]];
                    if ([docs[@"re_type"] isEqualToString:@"02"]) {
                        ZZPTModel * fpxqmodel = [ZZPTModel mj_objectWithKeyValues:docs];
                        [linshiarray addObject:fpxqmodel];
                    }
                    if ([docs[@"re_type"] isEqualToString:@"03"]) {
                        FPXQModel * fpxqmodel = [FPXQModel mj_objectWithKeyValues:docs];
                        [linshiarray addObject:fpxqmodel];

                    }
                    if ([docs[@"re_type"] isEqualToString:@"04"]||[docs[@"re_type"] isEqualToString:@"01"]||[docs[@"re_type"] isEqualToString:@"10"]||[docs[@"re_type"] isEqualToString:@"11"]||[docs[@"re_type"] isEqualToString:@"14"]) {
                        ZZPTModel * fpxqmodel = [ZZPTModel mj_objectWithKeyValues:docs];
                        [linshiarray addObject:fpxqmodel];
                    }
                }
                array = linshiarray;
                NSInteger inter = [number integerValue];
                inter ++;
                number = [NSNumber numberWithInteger:inter];
            }else{
                
            }
            
            [_tableView reloadData];
            [_tableView.mj_footer endRefreshing];
            [_tableView.mj_header endRefreshing];

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
