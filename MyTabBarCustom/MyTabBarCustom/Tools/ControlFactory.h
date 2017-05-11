//
//  ControlFactory.h
//  MyTabBarCustom
//
//  Created by shen on 2017/5/11.
//  Copyright © 2017年 shen. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface ControlFactory : NSObject

+ (UIBarButtonItem*)createBackBarButtonItemWithTarget:(id)target action:(SEL)action;

+ (UIBarButtonItem*)createCloseBarButtonItemWithTarget:(id)target action:(SEL)action;

//+ (UIBarButtonItem*)createBarButtonItemWithTitle:(NSString*)title addTarget:(id)target action:(SEL)action;


+ (UIBarButtonItem*)createBarButtonItemWithTitle2:(NSString*)title addTarget:(id)target action:(SEL)action;

+ (UITabBarItem*) createTabbarItem:(NSString*)title withImage:(NSString*)unimg withHeightLightImage:(NSString*)highImg;

//+ (UILabel*) createThemeLabel;

@end
