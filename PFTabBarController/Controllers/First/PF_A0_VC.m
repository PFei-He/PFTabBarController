//
//  PF_A0_VC.m
//  PFTabBarController
//
//  Created by PFei_He on 14-7-2.
//  Copyright (c) 2014年 PFei_He. All rights reserved.
//

#import "PF_A0_VC.h"
#import "PF_A1_VC.h"

@interface PF_A0_VC ()

@end

@implementation PF_A0_VC

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

    self.view.backgroundColor = [UIColor redColor];

    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(140, 200, 40, 20);
    [button setTitle:@"点击" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)click
{
    PF_A1_VC *A1 = [[PF_A1_VC alloc] init];
    [self.navigationController pushViewController:A1 animated:YES];
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
