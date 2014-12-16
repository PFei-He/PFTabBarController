//
//  AppDelegate.m
//  Demo
//
//  Created by PFei_He on 14-12-16.
//  Copyright (c) 2014年 PF-Lib. All rights reserved.
//

#import "AppDelegate.h"
#import "A0.h"
#import "B0.h"
#import "C0.h"
#import "D0.h"
#import "E0.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];

    //创建ViewController
    A0 *a = [[A0 alloc] init];
    B0 *b = [[B0 alloc] init];
    C0 *c = [[C0 alloc] init];
    D0 *d = [[D0 alloc] init];
    E0 *e = [[E0 alloc] init];

    //视图控制器的数组
    NSArray *array = [[NSArray alloc] initWithObjects:a, b, c, d, e, nil];

    //创建自定义TabBar
    PFTabBarController *tabBar = [[PFTabBarController alloc] initWithViewControl:array];

    //设置一个属性获取TabBar
    _tabBar = tabBar;

    //初始化TabBar时选中的按钮（不设置则为0）
//    tabBar.selectedNumber = 3;

    //常规按钮的图片数组
    NSArray *normal = [[NSArray alloc] initWithObjects:@"a_off.png", @"b_off.png", @"c_off.png", @"d_off.png", @"e_off.png", nil];

    //选中按钮的图片数组
    NSArray *selected = [[NSArray alloc] initWithObjects:@"a_on.png", @"b_on.png", @"c_on.png", @"d_on.png", @"e_on.png", nil];

    //TabBar的文字数组
    NSArray *label = [[NSArray alloc] initWithObjects:@"one", @"two", @"three", @"four", @"five", nil];

    //调用自定义的方法设置TabBar上的视图
    [tabBar tabBarWithImage:@"background.png" normal:normal selected:selected label:label];

    //设置自定义的TabBar为主控制器
    self.window.rootViewController = tabBar;

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
