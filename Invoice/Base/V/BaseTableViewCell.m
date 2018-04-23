//
//  BaseTableViewCell.m
//  ZYlive
//
//  Created by 杨帅 on 2017/6/15.
//  Copyright © 2017年 杨帅. All rights reserved.
//

#import "BaseTableViewCell.h"

@implementation BaseTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)layoutSubviews
{
    [super layoutSubviews];
//    [self CheckStateChange];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
//    [self CheckStateChange];
//    [self RemoveBackground];
}
- (void)setEditing:(BOOL)editing animated:(BOOL)animated{
    [super setEditing:editing animated:animated];
    
        if (editing) {
//            [self RemoveBackground];
            
    }

}
//取出背景渲染色
- (void)RemoveBackground{
    // 编辑状态去掉渲染
    self.contentView.backgroundColor = [UIColor whiteColor];
    self.backgroundView.backgroundColor = [UIColor whiteColor];
    // 左边选择按钮去掉渲染背景
    UIView *view = [[UIView alloc] initWithFrame:self.multipleSelectionBackgroundView.bounds];
    view.backgroundColor = [UIColor whiteColor];
    self.selectedBackgroundView = view;
}
- (void)CheckStateChange{
    for (UIControl *control in self.subviews) {
        if (![control isMemberOfClass:NSClassFromString(@"UITableViewCellEditControl")]){
            continue;
        }
        
        for (UIView *subView in control.subviews) {
            if (![subView isKindOfClass: [UIImageView class]]) {
                continue;
            }
            
            UIImageView *imageView = (UIImageView *)subView;
            if (self.selected) {
                imageView.image = [UIImage imageNamed:@"message_icon_radio_sel"]; // 选中时的图片
            } else {
                
                imageView.image = [UIImage imageNamed:@"message_icon_radio_default"];   // 未选中时的图片
            }
        }
    }

}

- (void)AddressNew{
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;//kCLLocationAccuracyBest;
    //使用期间
    [self.locationManager requestWhenInUseAuthorization];
    
    if ([self.locationManager respondsToSelector:@selector(requestAlwaysAuthorization)]) {
        [self.locationManager requestAlwaysAuthorization];
        self.locationManager.desiredAccuracy=kCLLocationAccuracyBestForNavigation;
        
    }
    
    //开始定位，不断调用其代理方法
    [self.locationManager startUpdatingLocation];
}
- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations
{
    self.locationManager.delegate = nil;
    
    // 1.获取用户位置的对象
    CLLocation *location = [locations lastObject];
    // 2.停止定位
//    Me.coordinate = location.coordinate;
    CLGeocoder *clGeoCoder = [[CLGeocoder alloc] init];
    
    [clGeoCoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        for (CLPlacemark *placeMark in placemarks) {
            NSDictionary *addressDic = placeMark.addressDictionary;
            
            NSString *city=[addressDic objectForKey:@"City"];
            NSString *SubLocality=[addressDic objectForKey:@"SubLocality"];
            NSString *Thoroughfare=[addressDic objectForKey:@"Thoroughfare"];
            NSString * address = [NSString stringWithFormat:@"%@%@%@",city,SubLocality,Thoroughfare];
            self.RoleButtonBlock(address);
        }
        
    }];
    
    [manager stopUpdatingLocation];
}


- (void)backClickBlock:(void (^)(Click, ALlModel *))block{
    self.ClickBlocks = block;
}
@end
