//
//  FourthViewController.m
//  2UINavigationController
//
//  Created by LZXuan on 14/12/10.
//  Copyright (c) 2014年 xuan. All rights reserved.
//

#import "FourthViewController.h"
#import "MyControl.h"
@interface FourthViewController ()

@end

@implementation FourthViewController

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
    self.view.backgroundColor = [UIColor blueColor];
    [self showUI];
}

- (void)showUI {
    NSArray *arr = @[@"返回上一级",@"返回第一张(root)",@"返回到指定的viewController",@"跳转到下一张"];
    for (int i = 0; i < arr.count; i++) {
        UIButton *button = [MyControl creatButtonWithFrame:CGRectMake(10, 64+40*i, 300, 30) target:self sel:@selector(btnClick:) tag:401+i image:nil title:arr[i]];
        button.backgroundColor = [UIColor yellowColor];
        
        [self.view addSubview:button];
    }
}
- (void)btnClick:(UIButton *)button {
    switch (button.tag) {
        case 401://返回上一级
        {
            //导航pop
            [self.navigationController popViewControllerAnimated:YES];
        }
            break;
        case 402://返回到第一张 返回导航的root控制器
        {
            [self.navigationController popToRootViewControllerAnimated:YES];
        }
            break;
        case 403://返回指定的 视图控制器
        {
            //获取导航的子视图控制器数组
            NSArray *arr = self.navigationController.viewControllers;
            //返回第二张子视图控制器
            [self.navigationController popToViewController:arr[1] animated:YES];
        }
            break;
        case 404://下一张
        {
            FourthViewController *fvc = [[FourthViewController alloc] init];
            [self.navigationController pushViewController:fvc animated:YES];
            [fvc release];
        }
            break;
            
        default:
            break;
    }
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
