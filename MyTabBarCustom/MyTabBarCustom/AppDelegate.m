//
//  AppDelegate.m
//  MyTabBarCustom
//
//  Created by shen on 2017/5/11.
//  Copyright © 2017年 shen. All rights reserved.
//

#import "AppDelegate.h"

#import "LaunchViewController.h"
#import "LaunchAdViewController.h"

#import "TabBarSelectTableViewController.h"
#import "NavigationViewController.h"


@interface AppDelegate ()
    
@end

@implementation AppDelegate
    
    
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
//    [self launchView];
//    [RecordBtn registerPlusButton];
    
    TabBarSelectTableViewController *vc = [[TabBarSelectTableViewController alloc] init];
    NavigationViewController *naVC = [[NavigationViewController alloc] initWithRootViewController:vc];
    self.window.rootViewController = naVC;
    
    [self.window makeKeyWindow];
    
    return YES;
}
    
//- (void)launchView{
//
//    NSString *gifImageURL = @"https://upload-images.jianshu.io/upload_images/1674941-a2a784576a9721a2.gif?imageMogr2/auto-orient/strip|imageView2/2/w/349";
//    ///设置启动页
//    [LaunchViewController showWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height - 150) ImageURL:gifImageURL advertisingURL:@"http://www.jianshu.com/p/5e2db17ec3f0" timeSecond:5 hideSkip:YES imageLoadGood:^(UIImage *image, NSString *imageURL) {
//
//        /// 广告加载结束
//        NSLog(@"%@ %@",image,imageURL);
//
//    } clickImage:^(UIViewController *launchVC){
//
//        /// 点击广告
//        //2.在webview中打开
//        LaunchAdViewController *VC = [[LaunchAdViewController alloc] init];
//        VC.urlStr = @"http://www.jianshu.com/p/5e2db17ec3f0";
//        VC.title = @"广告";
//        VC.AppDelegateSele= -1;
//
//        VC.WebBack= ^() {
//            //广告展示完成回调,设置window根控制器
//            TabBarSelectTableViewController *vc = [[TabBarSelectTableViewController alloc] init];
//            NavigationViewController *naVC = [[NavigationViewController alloc] initWithRootViewController:vc];
//            self.window.rootViewController = naVC;
//
//        };
//        NavigationViewController *naVC = [[NavigationViewController alloc]initWithRootViewController:VC];
//
//        [launchVC presentViewController:naVC animated:YES completion:nil];
//
//    } theAdEnds:^{
//        //广告展示完成回调,设置window根控制器
//        TabBarSelectTableViewController *vc = [[TabBarSelectTableViewController alloc] init];
//        NavigationViewController *naVC = [[NavigationViewController alloc] initWithRootViewController:vc];
//        self.window.rootViewController = naVC;
//
//    }];
//
//
//}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}
    
    
- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}
    
    
- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}
    
    
- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}
    
    
- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
    
    
    @end
