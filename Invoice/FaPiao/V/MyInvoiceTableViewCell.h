//
//  MyInvoiceTableViewCell.h
//  Invoice
//
//  Created by 杨帅 on 2018/3/15.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseTableViewCell.h"

@interface MyInvoiceTableViewCell : BaseTableViewCell
@property (nonatomic, strong) UITableView *table;//增值普通
@property (nonatomic, strong) BaseLabel * baoxiao;;//报销

@property (nonatomic, strong) FPXQModel *jdcmodel;//机动车model
@property (nonatomic, strong) ZZPTModel *zzptmodel;//增值普通

- (void)setLabeStareZHuangTai;
- (void)setLabeEndZHuangTai;
@end
