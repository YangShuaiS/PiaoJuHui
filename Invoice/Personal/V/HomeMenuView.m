//
//  HomeMenuView.m
//  ACMfun
//
//  Created by 杨帅 on 2017/12/21.
//  Copyright © 2017年 YS. All rights reserved.
//

#import "HomeMenuView.h"
@interface HomeMenuView () <UIScrollViewDelegate> {
    
    UIButton *_selectButton;
    UIScrollView *_titleScroll;
    UIScrollView *_controllerScroll;
    UIView * xian;
    BaseView * backView;
    
}
@property (nonatomic, strong) NSMutableArray<BaseButton *> *buttonArray;
@property (nonatomic, strong) BaseButton * lastbutton;

@end
@implementation HomeMenuView
#pragma mark - 懒加载
- (NSMutableArray *)buttonArray {
    
    if (_buttonArray == nil) {
        _buttonArray = [NSMutableArray array];
    }
    return _buttonArray;
}


- (instancetype)init{
    self = [super init];
    [self addview];
    return self;
}
- (void)addview{
    WS(ws);
    backView = [[BaseView alloc] init];
    backView.backgroundColor = [UIColor whiteColor];
    [self addSubview:backView];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(0);
        make.top.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(0);
        make.height.mas_equalTo(MENU);
    }];
    UIView * down = [[UIView alloc] init];
    down.backgroundColor = RGB(0xec, 0xec, 0xec);
    [self addSubview:down];
    [down mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(0);
        make.top.equalTo(backView.mas_bottom).with.offset(-1);
        make.height.mas_equalTo(@1);


    }];
    
    
}
- (void)setTitarray:(NSArray *)titarray{
    _titarray = titarray;
    WS(ws);
    for (int i = 0; i < _titarray.count; i++) {
        BaseButton *titleButton = [BaseButton buttonWithType:UIButtonTypeCustom];
        [titleButton setTitleColor:RGBA(0x99, 0x99, 0x99, 1.0) forState:UIControlStateNormal];
        [titleButton setTitle:_titarray[i] forState:UIControlStateNormal];
        titleButton.titleLabel.font = [UIFont systemFontOfSize:14];
        titleButton.tag = 100+i;
        [titleButton addTarget:self action:@selector(scrollViewSelectToIndex:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:titleButton];
        [self.buttonArray addObject:titleButton];
        
        
        
        if (i ==0 ) {
            self.lastbutton = titleButton;
            _selectButton = titleButton;
            [_selectButton setTitleColor:RGBA(0xf9, 0x71, 0x2c, 1.0) forState:UIControlStateNormal];
        }else{
            self.lastbutton = ws.buttonArray[i-1];
        }
        [titleButton mas_makeConstraints:^(MASConstraintMaker *make) {
            if (i==0) {
                make.left.equalTo(ws).with.offset(0);
                
            }else{
                ws.lastbutton = ws.buttonArray[i-1]; make.left.equalTo(ws.lastbutton.mas_right).with.offset(0);
                make.width.equalTo(ws.lastbutton);
            }
            make.top.equalTo(ws).with.offset(0);
            make.height.mas_equalTo(@44);
            
        }];
        
    }
    
    self.lastbutton = ws.buttonArray[_titarray.count-1];
    [self.lastbutton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(ws).offset(0);
    }];
    xian = [[UIView alloc] init];
    [self addSubview:xian];
    UIView * xianup = [[UIView alloc] init];
    xianup.backgroundColor = RGBA(0xf9, 0x71, 0x2c, 1.0);
    [xian addSubview:xianup];
    
    [xian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(0);
        //        make.right.equalTo(ws).with.offset(0);
        make.top.equalTo(backView.mas_bottom).with.offset(-2);
        make.height.mas_equalTo(@2);
        make.width.mas_equalTo(_selectButton.mas_width);
    }];
    [xianup mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(xian).with.offset(0);
        make.centerX.mas_equalTo(xian.mas_centerX);
        make.height.mas_equalTo(@2);
        make.width.mas_equalTo(@50);
        
    }];
}
// 切换到相应的控制器页面
- (void)scrollViewSelectToIndex:(UIButton *)button{
    [self selectButton:button.tag-100];
    // 切换到选中的控制器的view
    [UIView animateWithDuration:0.5 animations:^{
        _controllerScroll.contentOffset = CGPointMake(WIDTH*(button.tag-100), 0);
    }];
    
}
//选择某个按钮
- (void)selectButton:(NSInteger)index
{
    // 如果选中其他的按钮，默认按钮回复原来的字体颜色和大小
    [_selectButton setTitleColor:RGBA(0x99, 0x99, 0x99, 1.0) forState:UIControlStateNormal];
    
    // 设置选中的按钮
    _selectButton = _buttonArray[index];
    [_selectButton setTitleColor:RGBA(0xf9, 0x71, 0x2c, 1.0) forState:UIControlStateNormal];
    WS(ws);
    [xian mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(_selectButton.mas_centerX);
    make.top.equalTo(backView.mas_bottom).with.offset(-2);

        make.height.mas_equalTo(@2);
        make.width.mas_equalTo(_selectButton.mas_width);
        
    }];
//    if (index == 0) {
//        [xian mas_remakeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(ws).with.offset(0);
//            make.top.equalTo(backView.mas_bottom).with.offset(-2);
//            make.height.mas_equalTo(@2);
//            make.width.mas_equalTo(_selectButton.mas_width);
//
//        }];
//    }else{
//        [xian mas_remakeConstraints:^(MASConstraintMaker *make) {
//            make.right.equalTo(ws).with.offset(0);
//            make.top.equalTo(backView.mas_bottom).with.offset(-2);
//            make.height.mas_equalTo(@2);
//            make.width.mas_equalTo(_selectButton.mas_width);
//
//        }];
//    }

    
}
- (void)setControllerArray:(NSArray *)controllerArray {
    
    _controllerArray = controllerArray;
    [self setupViewControllerScroll];
}
- (void)setupViewControllerScroll
{
    WS(ws);
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.delegate = self;
    scrollView.scrollEnabled = YES;
    scrollView.pagingEnabled = YES;
    scrollView.bounces = NO;
    scrollView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    scrollView.showsHorizontalScrollIndicator = NO;
    [self addSubview:scrollView];
    
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(ws).with.insets(UIEdgeInsetsMake(44, 0, 0, 0));
        scrollView.contentSize = CGSizeMake(scrollView.frame.size.width*_controllerArray.count, scrollView.frame.size.height-44);
        
    }];
    _controllerScroll = scrollView;
    // 设置scrollView的子视图，即过渡视图contentSize，并设置其约束
    UIView *horizontalContainerView = [[UIView alloc]init];
    [_controllerScroll addSubview:horizontalContainerView];
    [horizontalContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(_controllerScroll);
        make.height.equalTo(_controllerScroll);
    }];
    //过渡视图添加子视图
    UIView *previousView =nil;
    for (int i = 0; i < _controllerArray.count; i++) {
//        UIView *viewcon = [[UIView alloc] initWithFrame:CGRectMake(WIDTH*i, 0, WIDTH, HEIGHT)];
        UIViewController *viewcontroller = _controllerArray[i];
        UIView * viewcon = viewcontroller.view;
        viewcon.frame = CGRectMake(WIDTH*i, 0, WIDTH, HEIGHT);
//        viewcon.backgroundColor = RGB(0xf6, 0xf6, 0xf6);
        [scrollView addSubview:viewcon];
        
        [viewcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(horizontalContainerView);
            make.bottom.equalTo(horizontalContainerView.mas_bottom).with.offset(-TabBarHeight);
            
            make.width.equalTo(scrollView);
            
            if (previousView)
            {
                make.left.mas_equalTo(previousView.mas_right);
            }
            else
            {
                make.left.mas_equalTo(0);
            }
        }];
        
        previousView = viewcon;
    }
    // 设置过渡视图的右距（此设置将影响到scrollView的contentSize）
    [horizontalContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(previousView.mas_right);
    }];
}
//监听滚动事件判断当前拖动到哪一个控制器
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    //    if (scrollView == _titleScroll) {
    NSInteger index = scrollView.contentOffset.x / WIDTH;
    [self selectButton:index];
    //    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
