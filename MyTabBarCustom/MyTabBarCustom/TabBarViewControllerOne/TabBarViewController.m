//
//  TabBarViewController.m
//  MyTabBarCustom
//
//  Created by shen on 2017/5/11.
//  Copyright © 2017年 shen. All rights reserved.
//

#import "TabBarViewController.h"
#import "TabBar.h"
#import "NavigationViewController.h"
#import "HomeViewController.h"
#import "FindViewController.h"
#import "CardViewController.h"
#import "MeViewController.h"
#import "PlusViewController.h"
@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 初始化所有控制器
    [self setUpChildVC];

    TabBar *tabBar = [[TabBar alloc] init];
    [self setValue:tabBar forKey:@"tabBar"];

    [tabBar setDidClickPublishBtn:^{
        PlusViewController *hmpositionVC = [[PlusViewController alloc] init];
        NavigationViewController *nav = [[NavigationViewController alloc] initWithRootViewController:hmpositionVC];
        [self presentViewController:nav animated:YES completion:nil];
        
    }];
}

- (void)setUpChildVC {
    
    HomeViewController *homeVC = [[HomeViewController alloc] init];
    [self setChildVC:homeVC title:@"首页" image:@"tabbar_home_normal" selectedImage:@"tabbar_home_select"];
    
    FindViewController *fishpidVC = [[FindViewController alloc] init];
    [self setChildVC:fishpidVC title:@"发现" image:@"tabbar_find_normal" selectedImage:@"tabbar_find_select"];
    
    CardViewController *messageVC = [[CardViewController alloc] init];
    [self setChildVC:messageVC title:@"卡券" image:@"tabbar_voucher_normal" selectedImage:@"tabbar_voucher_select"];
    
    MeViewController *myVC = [[MeViewController alloc] init];
    [self setChildVC:myVC title:@"我的" image:@"tabbar_my_normal" selectedImage:@"tabbar_my_select"];
    
}

- (void) setChildVC:(UIViewController *)childVC title:(NSString *) title image:(NSString *) image selectedImage:(NSString *) selectedImage {
    
    childVC.tabBarItem.title = title;
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = [UIColor blackColor];
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    [childVC.tabBarItem setTitleTextAttributes:dict forState:UIControlStateNormal];
    childVC.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVC.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    NavigationViewController *nav = [[NavigationViewController alloc] initWithRootViewController:childVC];
    [self addChildViewController:nav];
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    
    NSLog(@"item name = %@", item.title);
    
    
    NSInteger index = [self.tabBar.items indexOfObject:item];
    [self animationWithIndex:index];
    
    
    if([item.title isEqualToString:@"发现"])
    {
        // 也可以判断标题,然后做自己想做的事
    }
}
- (void)animationWithIndex:(NSInteger) index {
    
    NSMutableArray * tabbarbuttonArray = [NSMutableArray array];
    
    for (UIView *tabBarButton in self.tabBar.subviews) {
        
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [tabbarbuttonArray addObject:tabBarButton];
        }
    }
    CABasicAnimation*pulse = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    pulse.timingFunction= [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pulse.duration = 0.2;
    pulse.repeatCount= 1;
    pulse.autoreverses= YES;
    pulse.fromValue= [NSNumber numberWithFloat:0.7];
    pulse.toValue= [NSNumber numberWithFloat:1.3];
    [[tabbarbuttonArray[index] layer] addAnimation:pulse forKey:nil];
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
