//
//  ShiYongJiLuXQViewController.m
//  Invoice
//
//  Created by 杨帅 on 2018/3/14.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "ShiYongJiLuXQViewController.h"
#import "ShiYongJiluTableViewCell.h"
@interface ShiYongJiLuXQViewController ()<UITableViewDelegate,UITableViewDataSource>{
    NSMutableArray * array;
    NSMutableArray * linshiarray;
    NSNumber * number;
    SYMODEL * fpModel;
    
}
@property (strong, nonatomic) BaseTableView *tableView;

@end

@implementation ShiYongJiLuXQViewController

- (void)chushihua{
    linshiarray = [NSMutableArray array];
    number = @1;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self chushihua];
    WS(ws);
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

- (void)loadRequestData{
    MJExtensionLog(@"%@",number);

    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_FPLB];
    NSDictionary * dic = @{@"token":Me.token,@"type":_type,@"page":number,@"count":@PAGENUMBER};

    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            fpModel = [SYMODEL mj_objectWithKeyValues:responseObject];
            NSArray * modelarray = fpModel.data;
            [linshiarray addObjectsFromArray:modelarray];
            array = linshiarray;
            NSInteger inter = [number integerValue];
            inter ++;
            number = [NSNumber numberWithInteger:inter];
            [_tableView reloadData];
            [_tableView.mj_footer endRefreshing];
            [_tableView.mj_header endRefreshing];
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
    ShiYongJiluTableViewCell * cell = [ShiYongJiluTableViewCell NewCellWithTableView:tableView Identifier:rid];
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
