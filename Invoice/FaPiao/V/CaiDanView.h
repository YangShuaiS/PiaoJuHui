//
//  CaiDanView.h
//  Invoice
//
//  Created by 杨帅 on 2018/3/20.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"
#import "MyInvoiceView.h"
@interface CaiDanView : BaseView
@property (nonatomic, assign) BOOL ZK;
@property (nonatomic, strong) NSString * titletxe;
@property (nonatomic, strong) NSMutableArray * titlearray;
@property (nonatomic, strong) NSString * typefp;
@property (nonatomic, strong) NSMutableArray * subtitlearray;//

@property (nonatomic, strong) FPXQModel *jdcmodel;//机动车model
@property (nonatomic, strong) ZZPTModel *zzptmodel;//增值普通

@property (nonatomic, strong) NSString * jypd;

@property (nonatomic, strong) MyInvoiceView * FaPiao;

@end
