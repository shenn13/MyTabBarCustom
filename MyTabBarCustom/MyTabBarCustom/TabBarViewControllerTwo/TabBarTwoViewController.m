//
//  TabBarTwoViewController.m
//  MyTabBarCustom
//
//  Created by shen on 2017/5/11.
//  Copyright © 2017年 shen. All rights reserved.
//

#import "TabBarTwoViewController.h"
#import "NavigationViewController.h"
#import "UIImage+Extension.h"

@interface TabBarTwoViewController ()


@end

@implementation TabBarTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addSubViewsControllers];
    [self customTabbarItem];
}

-(void)addSubViewsControllers{
    
    NSArray *classControllers = @[@"HomeViewController",@"FindViewController",@"CardViewController",@"MeViewController"];
    NSMutableArray *conArr = [NSMutableArray array];
    
    for (int i = 0; i < classControllers.count; i ++) {
        Class cts = NSClassFromString(classControllers[i]);
        UIViewController *vc = [[cts alloc] init];
        NavigationViewController *naVC = [[NavigationViewController alloc] initWithRootViewController:vc];
        [conArr addObject:naVC];
    }
    self.viewControllers = conArr;
}

-(void)customTabbarItem{
    
    NSArray *titles = @[@"首页",@"发现",@"卡劵",@"我的"];
    NSArray *normalImages = @[@"tabbar_home_normal", @"tabbar_find_normal", @"tabbar_voucher_normal", @"tabbar_my_normal"];
    NSArray *selectImages = @[@"tabbar_home_select", @"tabbar_find_select", @"tabbar_voucher_select", @"tabbar_my_select"];
    
    for (int i = 0; i < titles.count; i++) {
        UIViewController *vc = self.viewControllers[i];
        UIImage *normalImage = [UIImage imageWithOriginalImageName:normalImages[i]];
        UIImage *selectImage = [UIImage imageWithOriginalImageName:selectImages[i]];
        vc.tabBarItem = [[UITabBarItem alloc] initWithTitle:titles[i] image:normalImage selectedImage:selectImage];
    }
    //设置TabBar的颜色
//    [self.tabBar setBarTintColor:kNavigationBarBg];
    
}

/************************************
//想让TabBarItem跳动可以打开下面的代码
 ************************************/


- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    NSLog(@"item name = %@", item.title);
    NSInteger index = [self.tabBar.items indexOfObject:item];
    [self animationWithIndex:index];
    if([item.title isEqualToString:@"发现"]){
        NSLog(@"---------发现");
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
