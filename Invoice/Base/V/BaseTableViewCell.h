//
//  BaseTableViewCell.h
//  ZYlive
//
//  Created by 杨帅 on 2017/6/15.
//  Copyright © 2017年 杨帅. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
typedef void(^ClickBlocks)(Click * block,ALlModel * allModel);

@interface BaseTableViewCell : UITableViewCell<CLLocationManagerDelegate>
@property (nonatomic, strong) CLLocationManager* locationManager;

@property (nonatomic,copy) void(^ ClickBlocks)(Click block,ALlModel * allModel);
- (void)backClickBlock:(void(^)(Click block,ALlModel * allModel))block;

//取出背景渲染色
- (void)RemoveBackground;

/**返回按钮回调*/
@property (nonatomic,copy) void(^RoleButtonBlock) (NSString *name);

//创建cell
+(instancetype)NewCellWithTableView:(UITableView *)tableView
                         Identifier:(NSString *)Identifier;
//cell定位
- (void)AddressNew;
@end
