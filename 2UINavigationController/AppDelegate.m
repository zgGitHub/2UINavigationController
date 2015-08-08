//
//  AppDelegate.m
//  2UINavigationController
//
//  Created by LZXuan on 14/12/10.
//  Copyright (c) 2014年 xuan. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"

@implementation AppDelegate
- (void)dealloc {
    self.window = nil;
    [super dealloc];
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    
    //这是一个管理级的 控制器 专门来负责管理 子视图控制器的切换
    //好像一种上下级管理
    
    FirstViewController * fvc = [[FirstViewController alloc] init];
    
    //创建一个导航控制器  需要给它设置一个根视图控制器
    UINavigationController *navC = [[UINavigationController alloc] initWithRootViewController:fvc];//这里 会对fvc指向的对象 +1 但是不需要我们管理
    [fvc release];//这里 就把上面我们写alloc 对应release
    
    //把导航设置为 window的根视图控制器
    self.window.rootViewController = navC;
    [navC release];//要注意释放
    
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
