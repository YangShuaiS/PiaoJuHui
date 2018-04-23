//
//  FPXQModel.h
//  Invoice
//
//  Created by 杨帅 on 2018/3/26.
//  Copyright © 2018年 YS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FPXQModel : NSObject
@property (nonatomic, copy) NSString *cd;//城市
@property (nonatomic, copy) NSString *cjfy;//不含税金额
@property (nonatomic, copy) NSString *cjhm;//车辆识别代号
@property (nonatomic, copy) NSString *cllx;//车辆类型
@property (nonatomic, copy) NSString *cpxh;//车牌型号
@property (nonatomic, copy) NSString *cycs;//？？？
@property (nonatomic, copy) NSString *dw;//？？？
@property (nonatomic, copy) NSString *enter_id;//？？？
@property (nonatomic, copy) NSString *fdjhm;//发动机号码
@property (nonatomic, copy) NSString *fpdm;//发票代码
@property (nonatomic, copy) NSString *fphm;//发票号码
@property (nonatomic, copy) NSString *gfsbh;//？？？
@property (nonatomic, copy) NSString *ghdw;//购买人姓名
@property (nonatomic, copy) NSString *hgzh;//合格证号
@property (nonatomic, copy) NSString *in_createtime;//开票时间
@property (nonatomic, copy) NSString *in_de_id;//？？？
@property (nonatomic, copy) NSString *in_id;//？？？
@property (nonatomic, copy) NSString *jkzmsh;//？？？
@property (nonatomic, copy) NSString *jshj;//价税合计
@property (nonatomic, copy) NSString *kprq;//开票日期
@property (nonatomic, copy) NSString *nsrsbh;//纳税人识别号
@property (nonatomic, copy) NSString *re_checkresult;//？？？
@property (nonatomic, copy) NSString *re_id;//？？？
@property (nonatomic, copy) NSString *re_status;//？？？
@property (nonatomic, copy) NSString *re_time;//？？？
@property (nonatomic, copy) NSString *re_type;//发票类型id
@property (nonatomic, copy) NSString *sfzhm;//组织机构代码
@property (nonatomic, copy) NSString *sjdh;//？？？
@property (nonatomic, copy) NSString *skph;//机器编号
@property (nonatomic, copy) NSString *swjg_dm;//税务机关代码
@property (nonatomic, copy) NSString *swjg_mc;//税务机关名称
@property (nonatomic, copy) NSString *user_id;//？？？
@property (nonatomic, copy) NSString *wspzhm;//？？？
@property (nonatomic, copy) NSString *xcrs;//？？？
@property (nonatomic, copy) NSString *xhdwmc;//销方名称
@property (nonatomic, copy) NSString *xm_id;//？？？
@property (nonatomic, copy) NSString *xsf_dzdh;//销方地址
@property (nonatomic, copy) NSString *xsf_yhzh;//销方开户银行
@property (nonatomic, copy) NSString *zfbz;//？？？
@property (nonatomic, copy) NSString *zzsse;//增值税额
@property (nonatomic, copy) NSString *zzssl;//增值税率
@property (nonatomic, strong) NSMutableArray *xmdata;//？？？

@end
