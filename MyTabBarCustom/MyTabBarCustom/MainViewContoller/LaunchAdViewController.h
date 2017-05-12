//
//  LaunchAdViewController.h
//  MyTabBarCustom
//
//  Created by shen on 2017/5/12.
//  Copyright © 2017年 shen. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^WebBack)();

@interface LaunchAdViewController : UIViewController
@property (nonatomic,copy)NSString *urlStr;

@property (nonatomic,assign)int AppDelegateSele;

@property (nonatomic,copy) WebBack WebBack;
@end
