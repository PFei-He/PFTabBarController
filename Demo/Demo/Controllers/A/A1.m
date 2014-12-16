//
//  A1.m
//  Demo
//
//  Created by PFei_He on 14-12-16.
//  Copyright (c) 2014年 PF-Lib. All rights reserved.
//

#import "A1.h"

@interface A1 ()

@end

@implementation A1

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark - Views Management

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor yellowColor];
}

- (void)viewWillAppear:(BOOL)animated
{
    //利用AppDelegate的代理获取视图的最底层
    app = (AppDelegate *)[UIApplication sharedApplication].delegate;

    //隐藏自定义TabBar（方法调用）
    [app.tabBar customTabBarHidden:YES];

    //隐藏自定义TabBar（属性调用）
//    app.tabBar.customTabBarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
    //显示自定义TabBar（方法调用）
    [app.tabBar customTabBarHidden:NO];

    //显示自定义TabBar（属性调用）
//    app.tabBar.customTabBarHidden = NO;
}

#pragma mark - Memory Management

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
