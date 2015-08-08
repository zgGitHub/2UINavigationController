//
//  FirstViewController.m
//  2UINavigationController
//
//  Created by LZXuan on 14/12/10.
//  Copyright (c) 2014年 xuan. All rights reserved.
//

#import "FirstViewController.h"
#import "MyControl.h"
#import "SecondViewController.h"


@interface FirstViewController ()

@end

@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    [self showUI];
}
- (void)showUI {

    UIButton *button = [MyControl creatButtonWithFrame:CGRectMake(10, 64, 300, 30) target:self sel:@selector(btnClick:) tag:101 image:nil title:@"跳转到下一张"];
    button.backgroundColor = [UIColor yellowColor];
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 8;
    
    [self.view addSubview:button];
}
- (void)btnClick:(UIButton *)btn {
    SecondViewController *sec = [[SecondViewController alloc] init];
    
    CATransition *anima = [CATransition animation];
    /*
     *  动画的开始与结束的快慢,有五个预置分别为(下同):
     *  kCAMediaTimingFunctionLinear            线性,即匀速
     *  kCAMediaTimingFunctionEaseIn            先慢后快
     *  kCAMediaTimingFunctionEaseOut           先快后慢
     *  kCAMediaTimingFunctionEaseInEaseOut     先慢后快再慢
     *  kCAMediaTimingFunctionDefault           实际效果是动画中间比较快.
     */
    [anima setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    
    
    //设置动画时间
    anima.duration = 5;
    
    //@"cube"－ 立方体效果  @"suckEffect"－收缩效果，如一块布被抽走   @"oglFlip"－上下翻转效果   @"rippleEffect"－滴水效果  @"pageCurl"－向上翻一页  @"pageUnCurl"－向下翻一页 @"rotate" 旋转效果 @"cameraIrisHollowOpen"     相机镜头打开效果(不支持过渡方向)  @"cameraIrisHollowClose"    相机镜头关上效果(不支持过渡方向)
    //动画类型
    //kCATransitionFade    新视图逐渐显示在屏幕上，旧视图逐渐淡化出视野
    //kCATransitionMoveIn  新视图移动到旧视图上面，好像盖在上面
    //kCATransitionPush    新视图将旧视图退出去
    //kCATransitionReveal  将旧视图移开显示下面的新视图
    
    anima.type = @"rotate";
    //anima.type = @"cameraIrisHollowOpen";
    //各种动画方向
    /*  当type为@"rotate"(旋转)的时候,它也有几个对应的subtype,分别为:
     *  90cw    逆时针旋转90°
     *  90ccw   顺时针旋转90°
     *  180cw   逆时针旋转180°
     *  180ccw  顺时针旋转180°
     */
    
    anima.subtype = @"90ccw";
    //anima.subtype = @"fromLeft";
    //anima.subtype = kCATransitionFromLeft;
    //放到 导航的view 的layer   两个子视图控制器的view 都在 导航的view上
    [self.navigationController.view.layer addAnimation:anima forKey:nil];
    
    [self.navigationController pushViewController:sec animated:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
