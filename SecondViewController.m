//
//  SecondViewController.m
//  2UINavigationController
//
//  Created by LZXuan on 14/12/10.
//  Copyright (c) 2014年 xuan. All rights reserved.
//

#import "SecondViewController.h"
#import "MyControl.h"
#import "ThirdViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

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
    self.view.backgroundColor =  [UIColor orangeColor];
    [self showUI];
}
- (void)showUI {
    NSArray *arr = @[@"返回上一级",@"跳转到下一个"];
    for (int i = 0; i < 2; i++) {
        UIButton * button = [MyControl creatButtonWithFrame:CGRectMake(10, 64+40*i, 300, 30) target:self sel:@selector(btnClick:) tag:201+i image:nil title:arr[i]];
        button.backgroundColor = [UIColor yellowColor];
        
        [self.view addSubview:button];
    }
}
- (void)btnClick:(UIButton *)button {
    switch (button.tag) {
        case 201:
            //导航来管理返回上一级
            [self.navigationController popViewControllerAnimated:YES];//返回上一级
            
            break;
        case 202:
        {
            ThirdViewController *tvc = [[ThirdViewController alloc] init];
            //导航控制 跳转到 tvc的界面
            [self.navigationController pushViewController:tvc animated:YES];
            
            [tvc release];
            
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
