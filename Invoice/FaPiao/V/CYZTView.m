
//
//  CYZTView.m
//  Invoice
//
//  Created by 杨帅 on 2018/3/21.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "CYZTView.h"
#import "CyCollectionViewCell.h"
@implementation CYZTView

- (instancetype)init{
    self = [super init];
    if (self) {
        [self buju];
    }
    return self;
}
- (void)setTitlearray:(NSMutableArray *)titlearray{
    _titlearray = titlearray;
//    [self addSubview:self.collectionView];

}
-(void)buju{
    WS(ws);
    [self addSubview:self.collectionView];
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(0);
        make.left.equalTo(ws).with.offset(0);
//        make.height.mas_equalTo(0);

        make.bottom.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(0);

    }];
}
#pragma mark *** UICollectionViewDataSource ***
// 设置组数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

// 设置行数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _titlearray.count;
}

// 设置单元格
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    // item重用机制
    NSString * rid = [NSString stringWithFormat:@"cell%ld",indexPath.row];
    
    CyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:rid forIndexPath:indexPath];
    cell.string = _titlearray[indexPath.row];
    NSString * subString = [_check substringWithRange:NSMakeRange(indexPath.row, 1)];
        cell.tongguo = subString;


    return cell;
}

- (UICollectionView *)collectionView {
    if (_collectionView == nil) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake((WIDTH-60)/3,60);
        //定义每个UICollectionView 横向的间距
        flowLayout.minimumLineSpacing = 15;
        //定义每个UICollectionView 纵向的间距
        flowLayout.minimumInteritemSpacing = 15;
        //定义每个UICollectionView 的边距距
        flowLayout.sectionInset = UIEdgeInsetsMake(15, 15, 0, 15);//上左下右
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 0,0) collectionViewLayout:flowLayout];
        
        //注册cell和ReusableView（相当于头部）
        [_collectionView registerClass:[CyCollectionViewCell class] forCellWithReuseIdentifier:@"cell0"];
        [_collectionView registerClass:[CyCollectionViewCell class] forCellWithReuseIdentifier:@"cell1"];
        [_collectionView registerClass:[CyCollectionViewCell class] forCellWithReuseIdentifier:@"cell2"];
        [_collectionView registerClass:[CyCollectionViewCell class] forCellWithReuseIdentifier:@"cell3"];
        [_collectionView registerClass:[CyCollectionViewCell class] forCellWithReuseIdentifier:@"cell4"];
        [_collectionView registerClass:[CyCollectionViewCell class] forCellWithReuseIdentifier:@"cell5"];
        [_collectionView registerClass:[CyCollectionViewCell class] forCellWithReuseIdentifier:@"cell6"];


        //设置代理
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        // 设置是否允许滚动
        _collectionView.scrollEnabled = NO;
        //背景颜色
        _collectionView.backgroundColor = [UIColor whiteColor];
        //自适应大小
        _collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
    }else{
        WS(ws);
 
        [_collectionView reloadData];
//        [_collectionView mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(ws).with.offset(0);
//            make.left.equalTo(ws).with.offset(0);
//            make.bottom.equalTo(ws).with.offset(0);
//            make.right.equalTo(ws).with.offset(0);
////            make.height.mas_equalTo(150);
//
//        }];
    }
    return _collectionView;
}
- (void)setCheck:(NSString *)check{
    _check = check;
    [_collectionView reloadData];
}
@end
