////
////  TabBarThreeViewController.m
////  MyTabBarCustom
////
////  Created by shen on 2019/10/10.
////  Copyright © 2019 shen. All rights reserved.
////
//
//#import "TabBarThreeViewController.h"
//#import "TabBar.h"
//#import "NavigationViewController.h"
//#import "HomeViewController.h"
//#import "FindViewController.h"
//#import "CardViewController.h"
//#import "MeViewController.h"
//#import "PlusViewController.h"
//
//
//#import <CYLTabBarController.h>
//
//@interface TabBarThreeViewController ()<UITabBarControllerDelegate,CYLTabBarControllerDelegate>
//
//@property (nonatomic, strong) UITabBarController *tabBarController;
//
//@end
//
//@implementation TabBarThreeViewController
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    // Do any additional setup after loading the view.
//    [self setupViewControllers];
//    [self customizeInterface];
//}
//
//
//- (void)setupViewControllers {
//    HomeViewController *firstViewController = [[HomeViewController alloc] init];
//    UIViewController *firstNavigationController = [[NavigationViewController alloc]
//                                                   initWithRootViewController:firstViewController];
////    [firstViewController cyl_setHideNavigationBarSeparator:YES];
//    // [firstViewController cyl_setNavigationBarHidden:YES];
//    FindViewController *secondViewController = [[FindViewController alloc] init];
//    UIViewController *secondNavigationController = [[NavigationViewController alloc]
//                                                    initWithRootViewController:secondViewController];
////    [secondViewController cyl_setHideNavigationBarSeparator:YES];
//    // [secondViewController cyl_setNavigationBarHidden:YES];
//    
//    CardViewController *thirdViewController = [[CardViewController alloc] init];
//    UIViewController *thirdNavigationController = [[NavigationViewController alloc]
//                                                   initWithRootViewController:thirdViewController];
////    [thirdViewController cyl_setHideNavigationBarSeparator:YES];
//    MeViewController *fourthViewController = [[MeViewController alloc] init];
//    UIViewController *fourthNavigationController = [[NavigationViewController alloc]
//                                                    initWithRootViewController:fourthViewController];
////    [fourthNavigationController cyl_setHideNavigationBarSeparator:YES];
//    
//    CYLTabBarController *tabBarController = [[CYLTabBarController alloc] init];
//    
//    [self customizeTabBarForController:tabBarController];
//    
//    [tabBarController setViewControllers:@[
//                                           firstNavigationController,
//                                           secondNavigationController,thirdNavigationController,fourthNavigationController
//                                           ]];
//    self.tabBarController = tabBarController;
//    self.tabBarController.delegate = self;
//    
//}
//
//- (void)customizeTabBarForController:(CYLTabBarController *)tabBarController {
//    
//    NSDictionary *dict1 = @{
//                            CYLTabBarItemTitle : @"首页",
//                            CYLTabBarItemImage : @"tabbar_home_normal",
//                            CYLTabBarItemSelectedImage : @"tabbar_home_select",
//                            };
//    NSDictionary *dict2 = @{
//                            CYLTabBarItemTitle : @"发现",
//                            CYLTabBarItemImage : @"tabbar_find_normal",
//                            CYLTabBarItemSelectedImage : @"tabbar_find_select",
//                            };
//    NSDictionary *dict3 = @{
//                            CYLTabBarItemTitle : @"个人中心",
//                            CYLTabBarItemImage : @"tabbar_voucher_normal",
//                            CYLTabBarItemSelectedImage : @"tabbar_voucher_select",
//                            };
//    NSDictionary *dict4 = @{
//                            CYLTabBarItemTitle : @"设置",
//                            CYLTabBarItemImage : @"tabbar_my_normal",
//                            CYLTabBarItemSelectedImage : @"tabbar_my_select",
//                            };
//    
//    NSArray *tabBarItemsAttributes = @[ dict1, dict2, dict3, dict4];
//    tabBarController.tabBarItemsAttributes = tabBarItemsAttributes;
//    
//}
//
//- (void)customizeInterface {
//    
//    // 普通状态下的文字属性
//    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
//    normalAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
//    
//    // 选中状态下的文字属性
//    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
//    selectedAttrs[NSForegroundColorAttributeName] = [UIColor redColor];
//    
//    // 设置文字属性
//    UITabBarItem *tabBar = [UITabBarItem appearance];
//    [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
//    [tabBar setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
//    
//    // 设置背景图片
//    UITabBar *tabBarAppearance = [UITabBar appearance];
//    [tabBarAppearance setBackgroundImage:[UIImage imageNamed:@""]];
//}
//
//
////缩放动画
//- (void)addScaleAnimationOnView:(UIView *)animationView {
//    //需要实现的帧动画，这里根据需求自定义
//    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
//    animation.keyPath = @"transform.scale";
//    animation.values = @[@1.0,@1.3,@0.9,@1.15,@0.95,@1.02,@1.0];
//    animation.duration = 1;
//    animation.calculationMode = kCAAnimationCubic;
//    [animationView.layer addAnimation:animation forKey:nil];
//}
//
////旋转动画
//- (void)addRotateAnimationOnView:(UIView *)animationView {
//    [UIView animateWithDuration:0.32 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
//        animationView.layer.transform = CATransform3DMakeRotation(M_PI, 0, 1, 0);
//    } completion:nil];
//    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [UIView animateWithDuration:0.70 delay:0 usingSpringWithDamping:1 initialSpringVelocity:0.2 options:UIViewAnimationOptionCurveEaseOut animations:^{
//            animationView.layer.transform = CATransform3DMakeRotation(2 * M_PI, 0, 1, 0);
//        } completion:nil];
//    });
//}
//
//
//- (void)tabBarController:(UITabBarController *)tabBarController didSelectControl:(UIControl *)control {
//    UIView *animationView;
//    // 如果 PlusButton 也添加了点击事件，那么点击 PlusButton 后不会触发该代理方法。
//    if ([control isKindOfClass:[CYLExternPlusButton class]]) {
//        UIButton *button = CYLExternPlusButton;
//        animationView = button.imageView;
//    } else if ([control isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
//        for (UIView *subView in control.subviews) {
//            if ([subView isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")]) {
//                animationView = subView;
//            }
//        }
//    }
//    
//    if ([self cyl_tabBarController].selectedIndex % 2 == 0) {
//        [self addScaleAnimationOnView:animationView];
//    } else {
//        [self addRotateAnimationOnView:animationView];
//    }
//}
///*
//#pragma mark - Navigation
//
//// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//}
//*/
//
//@end
