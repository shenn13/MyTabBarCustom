//
//  PlusViewController.m
//  MyTabBarCustom
//
//  Created by shen on 2017/5/11.
//  Copyright © 2017年 shen. All rights reserved.
//

#import "PlusViewController.h"

@interface PlusViewController ()
    
    @end

@implementation PlusViewController
    
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor cyanColor];
    
    [self setupNavigationbarBack];
    
}
    
-(void)viewWillAppear:(BOOL)animated{
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bar_ios7"] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}
    
    //在页面消失的时候就让navigationbar还原样式
-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewDidDisappear:animated];
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
    
}

#pragma mark -初始化导航栏
    
- (void)setupNavigationbarBack {
    
    UIButton *leftButton = [[UIButton alloc] init];
    leftButton.frame = CGRectMake(0, 0, 12, 21);
    leftButton.adjustsImageWhenHighlighted = NO;
    [leftButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [leftButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    UIBarButtonItem *leftButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    UIBarButtonItem * spaceItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem.width = -7;
    
    self.navigationItem.leftBarButtonItems = @[spaceItem,leftButtonItem];
    
}
    
#pragma mark -导航栏返回按钮
- (void)backAction {
    
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
    
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
    
    /*
     #pragma mark - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     // Get the new view controller using [segue destinationViewController].
     // Pass the selected object to the new view controller.
     }
     */
    
    @end
