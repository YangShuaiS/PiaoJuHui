//
//  BaseTableView.m
//  ZYlive
//
//  Created by 杨帅 on 2017/5/26.
//  Copyright © 2017年 杨帅. All rights reserved.
//

#import "BaseTableView.h"

@implementation BaseTableView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)drawRect:(CGRect)rect {
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
//    self.tableFooterView = nil;
//    self.backgroundColor = RGB(0xf0, 0xf0, 0xf0);
}
@end
