//
//  CYZTView.h
//  Invoice
//
//  Created by 杨帅 on 2018/3/21.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"

@interface CYZTView : BaseView<UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic, strong) NSMutableArray * titlearray;
@property (nonatomic, strong) NSMutableArray * namearray;

@property (nonatomic, strong) UICollectionView *collectionView; /**< 集合视图 */
@property (nonatomic, strong) NSString * check;

@end
