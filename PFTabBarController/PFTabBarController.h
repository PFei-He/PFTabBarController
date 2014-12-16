//
//  PFTabBarController.h
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

#import <UIKit/UIKit.h>

@interface PFTabBarController : UITabBarController

///初始化TabBar时选中的按钮
@property (nonatomic) NSUInteger    selectedNumber;

///设置系统TabBar的隐藏
@property (nonatomic) BOOL          tabBarHidden;

///设置自定TabBar的隐藏
@property (nonatomic) BOOL          customTabBarHidden;

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
- (id)tabBarWithImage:(NSString *)imageNamed normal:(NSArray *)normal selected:(NSArray *)selected label:(NSArray *)label;

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
