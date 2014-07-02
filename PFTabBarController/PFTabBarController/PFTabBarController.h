//
//  PFTabBarController.h
//  PFTabBarController
//
//  Created by PFei_He on 14-7-2.
//  Copyright (c) 2014年 PFei_He. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PFTabBarController : UITabBarController

///初始化TabBar时选中的按钮
@property (nonatomic) NSUInteger selectedNumber;

///设置系统TabBar的隐藏
@property (nonatomic) BOOL tabBarHidden;
///设置自定TabBar的隐藏
@property (nonatomic) BOOL customTabBarHidden;

/**
 *  @brief 初始化ViewController
 *  @param ViewControl: 视图控制器
 */
- (id)initWithViewControl:(NSArray *)tabBarArray;

/**
 *  @brief 初始化TabBar
 *  @param image:       背景
 *  @param normal:      常规的图片
 *  @param selected:    选中的图片
 *  @param label:       文字
 */
- (id)tabBarWithImage:(NSString *)imageNamed
               normal:(NSArray *)normal
             selected:(NSArray *)selected
                label:(NSArray *)label;

/**
 *  @brief 获取TabBar选中的Button
 */
- (void)onSelected:(UIButton *)button;

/**
 *  @brief 设置系统TabBar的隐藏
 */
- (void)tabBarHidden:(BOOL)tabBarHidden;

/**
 *  @brief 设置自定TabBar的隐藏
 */
- (void)customTabBarHidden:(BOOL)customTabBarHidden;

@end
