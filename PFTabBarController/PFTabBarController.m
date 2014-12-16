//
//  PFTabBarController.m
//  PFTabBarController
//
//  Created by PFei_He on 14-7-2.
//  Copyright (c) 2014年 PF-Lib. All rights reserved.
//
//  https://github.com/PFei-He/PFTabBarController
//
//  vesion: 0.1.0
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "PFTabBarController.h"

//动态获取设备高度
#define iPhone_Height (([UIScreen mainScreen].bounds.size.height == 568) ? 568 : 480)

@interface PFTabBarController ()
{
    UIView          *tabBarView;            //自定义TabBar的视图
    UIImageView     *tabBarImageView;       //自定义TabBar的图层

    NSMutableArray  *tabBarControlArray;    //自定义TabBarControl的数组
    NSMutableArray  *tabBarButtonArray;     //自定义按钮的数组
}

@end

@implementation PFTabBarController

@synthesize selectedNumber = _selectedNumber;

#pragma mark - Property Methods

//设置系统TabBar的隐藏（属性方法）
- (void)setTabBarHidden:(BOOL)tabBarHidden
{
    UIView *tab = self.view;
    if ([tab.subviews count] < 1) return;

    UIView *view;
    if ([[tab.subviews objectAtIndex:0] isKindOfClass:[UITabBar class]]) {
        view = [tab.subviews objectAtIndex:1];
    } else view = [tab.subviews objectAtIndex:0];

    if (tabBarHidden) {
        view.frame = tab.bounds;
        self.tabBar.hidden = tabBarHidden;
    } else view.frame = CGRectMake(tab.bounds.origin.x, tab.bounds.origin.y, tab.bounds.size.width, tab.bounds.size.height);
}

//设置自定TabBar的隐藏（属性方法）
- (void)setCustomTabBarHidden:(BOOL)customTabBarHidden
{
    if (customTabBarHidden) {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.35];
        tabBarImageView.frame = CGRectMake(-320, iPhone_Height - 49, 320, 49);
        [UIView commitAnimations];
    } else {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.35];
        tabBarImageView.frame = CGRectMake(0, iPhone_Height - 49, 320, 49);
        [UIView commitAnimations];
    }
}

#pragma mark - Public Methods

//初始化ViewController
- (id)initWithViewControl:(NSArray *)tabBarArray
{
    tabBarControlArray = [[NSMutableArray alloc] initWithCapacity:5];
    for (UINavigationController *navigationController in tabBarArray) {
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:navigationController];
        [tabBarControlArray addObject:nav];
    }
    self.viewControllers = tabBarControlArray;

    return self;
}

//初始化TabBar
- (id)tabBarWithImage:(NSString *)imageNamed normal:(NSArray *)normal selected:(NSArray *)selected label:(NSArray *)label
{
    [self tabBarHidden:YES];

    //TabBar的背景
    if (!tabBarImageView) tabBarImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageNamed]];
    tabBarImageView.frame = CGRectMake(0, iPhone_Height - 49, self.view.frame.size.width, 49);
    tabBarImageView.userInteractionEnabled = YES;
    [self.view addSubview:tabBarImageView];

    //TabBar上Button的Array
    tabBarButtonArray = [[NSMutableArray alloc] initWithCapacity:5];

    for (int i = 0; i < [normal count]; i++) {
        //自定义TabBar的按钮
        NSString *normalButton = [[NSString alloc] initWithFormat:@"%@", [normal objectAtIndex:i]];
        NSString *selectedButton = [[NSString alloc] initWithFormat:@"%@", [selected objectAtIndex:i]];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake((i * 64), 0, 64, 38);
        [button setImage:[UIImage imageNamed:normalButton] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:selectedButton] forState:UIControlStateSelected];
        button.tag = i;

        //用户自定义应用打开时选择的页面
        if (self.selectedNumber) {
            if (i == self.selectedNumber) {
                button.selected = YES;
                self.selectedIndex = i;
            }
        } else {//若没有选择，默认为第一个
            if(i == 0) {
                button.selected = YES;
                self.selectedIndex = i;
            }
        }

        [button addTarget:self action:@selector(onSelected:) forControlEvents:UIControlEventTouchUpInside];
        [tabBarButtonArray addObject:button];
        [tabBarImageView addSubview:button];

        //自定义TabBar的文字
        UILabel *tabBarLabel = [[UILabel alloc] initWithFrame:CGRectMake((i * 64), 38, 64, 7)];
        tabBarLabel.text = label[i];
        tabBarLabel.font = [UIFont systemFontOfSize:8.0f];
        tabBarLabel.textAlignment = 1;
        tabBarLabel.textColor = [UIColor grayColor];
        tabBarLabel.backgroundColor = [UIColor clearColor];
        [tabBarImageView addSubview:tabBarLabel];
    }
    return self;
}

//获取TabBar选中的Button
- (void)onSelected:(UIButton *)button
{
    self.selectedIndex = button.tag;
    for (int i = 0; i < 5; i++) {
        UIButton *button = [tabBarButtonArray objectAtIndex:i];
        button.selected = NO;
    }
    button.selected = YES;
}

//设置系统TabBar的隐藏（实例方法）
- (void)tabBarHidden:(BOOL)tabBarHidden
{
    UIView *tab = self.view;
    if ([tab.subviews count] < 1) return;

    UIView *view;
    if ([[tab.subviews objectAtIndex:0] isKindOfClass:[UITabBar class]]) {
        view = [tab.subviews objectAtIndex:1];
    } else view = [tab.subviews objectAtIndex:0];

    if (tabBarHidden) {
        view.frame = tab.bounds;
        self.tabBar.hidden = tabBarHidden;
    } else view.frame = CGRectMake(tab.bounds.origin.x, tab.bounds.origin.y, tab.bounds.size.width, tab.bounds.size.height);
}

//设置自定TabBar的隐藏（实例方法）
- (void)customTabBarHidden:(BOOL)customTabBarHidden
{
    if (customTabBarHidden) {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.35];
        tabBarImageView.frame = CGRectMake(-320, iPhone_Height - 49, 320, 49);
        [UIView commitAnimations];
    } else {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.35];
        tabBarImageView.frame = CGRectMake(0, iPhone_Height - 49, 320, 49);
        [UIView commitAnimations];
    }
}

#pragma mark - Orientation Management

//TabBar可否跟随设备的翻转而翻转
- (BOOL)shouldAutorotate
{
    return NO;
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
