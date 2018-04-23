//
//  ChongZhiJiLuViewController.m
//  Invoice
//
//  Created by 杨帅 on 2018/3/14.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "ChongZhiJiLuViewController.h"
#import "ChongZhiJiLuTableViewCell.h"
@interface ChongZhiJiLuViewController ()<UITableViewDelegate,UITableViewDataSource>{
    UIView * nav;
    NSMutableArray * array;
}
@property (strong, nonatomic) BaseTableView *tableView;

@end

@implementation ChongZhiJiLuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    WS(ws);
    self.view.backgroundColor = RGB(0xf8, 0xf8, 0xf8);
    [self addnav];
    array = [NSMutableArray array];
    [self.view addSubview:self.tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(nav.mas_bottom).with.offset(0);
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.bottom.equalTo(ws.view).with.offset(0);
        
    }];
    
    [self loadRequestData];
}
- (void)loadRequestData{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_CZLB];
    NSDictionary * dic = @{@"token":Me.token};
    
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            ChongZhiTCModel * model = [ChongZhiTCModel mj_objectWithKeyValues:responseObject];
            array = model.rechargerecord;
            [_tableView reloadData];
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
        //使tableview无数据时候无下划线
        _tableView.tableFooterView = [[UIView alloc]init];
        _tableView.estimatedRowHeight = 150;//估算高度
        _tableView.rowHeight = UITableViewAutomaticDimension;
    }else{
        [_tableView reloadData];
    }
    return _tableView;
}

#pragma mark  - tableViewDelegate代理方法

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return array.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * rid = @"";
        rid = @"topcell";
        ChongZhiJiLuTableViewCell * cell = [ChongZhiJiLuTableViewCell NewCellWithTableView:tableView Identifier:rid];
    cell.model = array[indexPath.row];
        return cell;
  
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
    
    BaseLabel * name = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x33, 0x33, 0x33) LabelFont:TextFont(17) TextAlignment:NSTextAlignmentCenter Text:@"充值记录"];
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
    // Dispose of any resources that can be recreated.
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
