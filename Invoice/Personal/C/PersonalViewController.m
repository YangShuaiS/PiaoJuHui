//
//  PersonalViewController.m
//  Invoice
//
//  Created by 杨帅 on 2018/3/13.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "PersonalViewController.h"
#import "PersonXinxiTableViewCell.h"
#import "PersonNeiRongTableViewCell.h"
#import "TuiChuTableViewCell.h"

#import "PersonZhanhuViewController.h"
#import "XiuGaiMiMaViewController.h"
#import "TongJiSViewController.h"
@interface PersonalViewController ()<UITableViewDelegate,UITableViewDataSource>{
    UIView * nav;
    NSArray * array;
    UserModel * model;
}
@property (strong, nonatomic) BaseTableView *tableView;

@end

@implementation PersonalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    WS(ws);
    self.view.backgroundColor = RGB(0xf8, 0xf8, 0xf8);
    [self addnav];
    array = [NSArray array];
    NSArray * onearray = [NSArray array];
    onearray = @[@"1"];
    
    NSArray * twoarray = [NSArray array];
    NSDictionary * dic1 = @{@"image":@"我的账户icon",@"title":@"我的账户"};
    NSDictionary * dic2 = @{@"image":@"发票统计icon",@"title":@"发票统计"};
    NSDictionary * dic3 = @{@"image":@"修改密码icon",@"title":@"修改密码"};
//    NSDictionary * dic4 = @{@"image":@"关于我们",@"title":@"关于我们"};
//    NSDictionary * dic5 = @{@"image":@"检测版本",@"title":@"检测版本"};
    if ([Me.user_type isEqualToString:@"3"]) {
        twoarray = @[dic2,dic3];

    }else{
        twoarray = @[dic1,dic2,dic3];

    }
    
    NSArray * threearray = [NSArray array];
    threearray = @[@"退出登录"];
    
    array = @[onearray,twoarray,threearray];
    
    
    [self.view addSubview:self.tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(ws);

    make.top.equalTo(nav.mas_bottom).with.offset(0);
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.bottom.equalTo(ws.view).with.offset(0);

    }];
    
    [self loadRequestData];
}
- (void)loadRequestData{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_GRZX];
    NSDictionary * dic = @{@"token":Me.token};

//    NSString * str = @"http://192.168.1.200:9000/checkticket?token=ba106bec3d2926eaaed90cde3e67bcafacca8fc0&num=1&data=01,01,1100153130,51785479,75.68,20170112,,13CF";
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            MJExtensionLog(@"%@",responseObject[@"message"]);
            model = [UserModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqualToString:@"200"]) {
//                NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
                [self.tableView reloadData];
//                [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationAutomatic];
                
//                NSIndexSet *indexSet = [[NSIndexSet alloc] initWithIndex:0];
//
//                [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationFade];
            }else{
            }
        }else{

        }
    }];
   
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
    NSArray * arr = array[section];
    return arr.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return array.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * rid = @"";
    if (indexPath.section == 0) {
        rid = @"topcell";
        PersonXinxiTableViewCell * cell = [PersonXinxiTableViewCell NewCellWithTableView:tableView Identifier:rid];
        cell.model = model;
        return cell;
    }else if (indexPath.section == 1){
        rid = @"cell";
        PersonNeiRongTableViewCell * cell = [PersonNeiRongTableViewCell NewCellWithTableView:tableView Identifier:rid];
        cell.dic = array[indexPath.section][indexPath.row];
        return cell;
    }else{
        rid = @"downcell";
        TuiChuTableViewCell * cell = [TuiChuTableViewCell NewCellWithTableView:tableView Identifier:rid];
        return cell;
    }
}


//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (indexPath.section == 0) {
//        return 100;
//
//    }else if (indexPath.section == 1){
//        
//    }else{
//        
//    }
//}
- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
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
    if (indexPath.section == 0) {
        
    }else if (indexPath.section == 1){
        [self CellClick:indexPath.row];
    }else{
        [self tuichu];
    }
}
#pragma mark  - 退出

- (void)tuichu{
    WS(ws);
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@""
                                                                   message:@"您确定要退出登录吗？"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                          }];
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * action) {
                                                             [ws QRTC];
                                                         }];
    
    [alert addAction:defaultAction];
    [alert addAction:cancelAction];
    [self presentViewController:alert animated:YES completion:nil];
    
}
- (void)QRTC{
//    dispatch_async(self.RequestDataQueue, ^{
        //        NSDictionary * dic=@{@"access_token":dics[@"access_token"],@"openid":dics[@"openid"]};
//        NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,TCDL];
//        NSDictionary * dic = @{@"token":Me.token};
//        [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
//            if (responseObject) {
                [self QINGCHU];
//            }else{
//            }
//        }];
//    });
}
- (void)QINGCHU{
    NSString *filePatch = [BaseObject AddPathName:UserMe];
    NSMutableDictionary *WXDic = [NSMutableDictionary dictionary];
    NSDictionary * dic = [NSDictionary dictionary];
    [WXDic setObject:dic forKey:UserMe];
    [WXDic writeToFile:filePatch atomically:YES];
    [self tuichudenglu];
//    Me = [[MeModel SharedModel] ADDvalue];
    //        Me = nil;
    //    Me.token = @"";
}

- (void)tuichudenglu{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_TCDL];
    NSDictionary * dic = @{@"token":Me.token};
    //
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            HomeModel * model = [HomeModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                NSNotification *notification =[NSNotification notificationWithName:kNotificationTuiChuDenglu object:nil userInfo:nil];
                [[NSNotificationCenter defaultCenter] postNotification:notification];
            }
        }else{
            
        }
    }];
}



- (void)CellClick:(NSInteger)inter{
    if ([Me.user_type isEqualToString:@"1"]||[Me.user_type isEqualToString:@"2"]) {
        if (inter == 0) {
            PersonZhanhuViewController * vc = [PersonZhanhuViewController new];
            [self.navigationController pushViewController:vc animated:YES];
        }else if (inter == 1){
            TongJiSViewController * vc = [TongJiSViewController new];
            [self.navigationController pushViewController:vc animated:YES];
        }else if (inter == 2){
            XiuGaiMiMaViewController * vc = [XiuGaiMiMaViewController new];
            [self.navigationController pushViewController:vc animated:YES];
        }else if (inter == 3){
            
        }else{
            MJExtensionLog(@"版本检测");
        }
    }else{
        if (inter == 0){
            TongJiSViewController * vc = [TongJiSViewController new];
            [self.navigationController pushViewController:vc animated:YES];
        }else if (inter == 1){
            XiuGaiMiMaViewController * vc = [XiuGaiMiMaViewController new];
            [self.navigationController pushViewController:vc animated:YES];
        }else if (inter == 2){
            
        }else{
            MJExtensionLog(@"版本检测");
        }
    }

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
    
    BaseLabel * name = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x33, 0x33, 0x33) LabelFont:TextFont(17) TextAlignment:NSTextAlignmentCenter Text:@"个人信息"];
    [self.view addSubview:name];
    [name mas_makeConstraints:^(MASConstraintMaker *make) {
    make.bottom.equalTo(nav.mas_bottom).with.offset(-10);
        make.centerX.mas_equalTo(nav.mas_centerX);

    }];
}
- (void)leftBarButtonItenAction{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
