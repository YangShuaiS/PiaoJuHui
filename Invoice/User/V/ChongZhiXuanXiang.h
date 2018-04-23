//
//  ChongZhiXuanXiang.h
//  Invoice
//
//  Created by 杨帅 on 2018/3/19.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"

@interface ChongZhiXuanXiang : BaseView<UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic, strong) UICollectionView *collectionView; /**< 集合视图 */
@property (nonatomic, strong) NSMutableArray *discount;

@end
