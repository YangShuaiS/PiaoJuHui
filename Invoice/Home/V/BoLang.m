//
//  BoLang.m
//  Invoice
//
//  Created by 杨帅 on 2018/3/14.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BoLang.h"

@implementation BoLang{
    FLAnimatedImageView * one;
    FLAnimatedImageView * two;
    
    FLAnimatedImageView * three;
    FLAnimatedImageView * four;

    NSTimer * onetime;
    NSTimer * twotime;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        [self buju];
    }
    return self;
}

-(void)buju{
    UIImage * backimage = UIIMAGE("波浪1");
    UIImage * oneimage = UIIMAGE("波浪2");
//    twoimage = [twoimage blurImageWithRadius:50 tintColor:nil saturationDeltaFactor:10 maskImage:twoimage];
//    FLAnimatedImageView * back = [[FLAnimatedImageView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 100)];
//    back.image = twoimage;
//    back.alpha = 1;
//    [self addSubview:back];
    
    one = [[FLAnimatedImageView alloc] initWithFrame:CGRectMake(WIDTH, 0, backimage.size.width, backimage.size.height)];
    one.image = backimage;

    [self addSubview:one];

//    two = [[FLAnimatedImageView alloc] initWithFrame:CGRectMake(WIDTH*2, 0, WIDTH*2, backimage.size.height)];
//    two.image = backimage;
//    two.alpha = 0.8;
//
//    [self addSubview:two];
//
    three = [[FLAnimatedImageView alloc] initWithFrame:CGRectMake(WIDTH, backimage.size.height-oneimage.size.height, oneimage.size.width, oneimage.size.height)];
    three.image = oneimage;
    three.alpha = 0.8;
    [self addSubview:three];
//
//    four = [[FLAnimatedImageView alloc] initWithFrame:CGRectMake(WIDTH*2, 0, WIDTH*2, backimage.size.height)];
//    four.image = oneimage;
//    four.alpha = 0.8;
//
//    [self addSubview:four];

    [self donghua1];
//    [self twodonghua1];

}

- (void)donghua1{
    UIImage * backimage = UIIMAGE("波浪1");
    UIImage * oneimage = UIIMAGE("波浪2");

        [UIView animateWithDuration:16.0 delay:0 options:UIViewAnimationOptionCurveLinear|UIViewAnimationOptionRepeat animations:^{
//            //        one.frame.origin.x = WIDTH;
            one.frame = CGRectMake(-backimage.size.width, 0, backimage.size.width, backimage.size.height);

        } completion:^(BOOL finished) {
//            [self donghua2];
        }];
    [UIView animateWithDuration:12.0 delay:0 options:UIViewAnimationOptionCurveLinear|UIViewAnimationOptionRepeat animations:^{
        //            //        one.frame.origin.x = WIDTH;
//        one.frame = CGRectMake(-backimage.size.width, 0, backimage.size.width, backimage.size.height);
        three.frame = CGRectMake(-oneimage.size.width,backimage.size.height-oneimage.size.height, oneimage.size.width, oneimage.size.height);
        
    } completion:^(BOOL finished) {

    }];

}
- (void)twodonghua1{
    [UIView animateWithDuration:2.0 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        three.frame = CGRectMake(-WIDTH/4, 25, WIDTH, 100);
        four.frame = CGRectMake(WIDTH- WIDTH/4, 25, WIDTH, 100);
    } completion:^(BOOL finished) {
        [self twodonghua2];
    }];
}
- (void)donghua2{
    [UIView animateWithDuration:6.0 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        //            //        one.frame.origin.x = WIDTH;
        one.frame = CGRectMake(-WIDTH/4*3, -25, WIDTH, 100);
        two.frame = CGRectMake(WIDTH - WIDTH/4*3, -25, WIDTH, 100);

    } completion:^(BOOL finished) {
        [self donghua3];
    }];
}
-(void)twodonghua2{
    [UIView animateWithDuration:4.0 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{

        three.frame = CGRectMake(-WIDTH/4*3, -25, WIDTH, 100);
        four.frame = CGRectMake(WIDTH - WIDTH/4*3, -25, WIDTH, 100);
    } completion:^(BOOL finished) {
        [self twodonghua3];
    }];
}
- (void)donghua3{
    [UIView animateWithDuration:3.0 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        //            //        one.frame.origin.x = WIDTH;
        one.frame = CGRectMake(-WIDTH, 0, WIDTH, 100);
        two.frame = CGRectMake(0, 0, WIDTH, 100);
    } completion:^(BOOL finished) {
        one.frame = CGRectMake(0, 0, WIDTH, 100);
        two.frame = CGRectMake(WIDTH, 0, WIDTH, 100);
        onetime = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(donghua1) userInfo:nil repeats:NO];
    }];
}
-(void)twodonghua3{
    [UIView animateWithDuration:2.0 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{

        three.frame = CGRectMake(-WIDTH, 0, WIDTH, 100);
        four.frame = CGRectMake(0, 0, WIDTH, 100);
    } completion:^(BOOL finished) {

        three.frame = CGRectMake(0, 0, WIDTH, 100);
        four.frame = CGRectMake(WIDTH, 0, WIDTH, 100);
                twotime = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(twodonghua1) userInfo:nil repeats:NO];
        
    }];
}
- (void)setStare:(BOOL)stare{
    _stare = stare;
    UIImage * backimage = UIIMAGE("波浪1");
    UIImage * oneimage = UIIMAGE("波浪2");
                one.frame = CGRectMake(WIDTH, 0, backimage.size.width, backimage.size.height);
            three.frame =CGRectMake(WIDTH, backimage.size.height-oneimage.size.height, oneimage.size.width, oneimage.size.height);

    [self donghua1];
    if (stare == YES) {

    }else{


    }
    
}
@end
