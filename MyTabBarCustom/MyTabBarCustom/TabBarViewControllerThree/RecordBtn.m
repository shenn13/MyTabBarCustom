////
////  RecordBtn.m
////  MyTabBarCustom
////
////  Created by shen on 2019/10/10.
////  Copyright © 2019 shen. All rights reserved.
////
//
//#import "RecordBtn.h"
//#import "CYLTabBarController.h"
//#import "PlusViewController.h"
//#import "NavigationViewController.h"
//
//@implementation RecordBtn
//
//+ (void)load {
//    //请在 `-application:didFinishLaunchingWithOptions:` 中进行注册，否则iOS10系统下存在Crash风险。
//    //[super registerPlusButton];
//}
//
//- (instancetype)initWithFrame:(CGRect)frame {
//    if (self = [super initWithFrame:frame]) {
//        self.titleLabel.textAlignment = NSTextAlignmentCenter;
//        self.adjustsImageWhenHighlighted = NO;
//    }
//    return self;
//}
////上下结构的 button
//- (void)layoutSubviews {
//    [super layoutSubviews];
//
//    // 控件大小,间距大小
//    // 注意：一定要根据项目中的图片去调整下面的0.7和0.9，Demo之所以这么设置，因为demo中的 plusButton 的 icon 不是正方形。
//    CGFloat const imageViewEdgeWidth   = self.bounds.size.width * 0.7;
//    CGFloat const imageViewEdgeHeight  = imageViewEdgeWidth * 0.9;
//
//    CGFloat const centerOfView    = self.bounds.size.width * 0.5;
//    CGFloat const labelLineHeight = self.titleLabel.font.lineHeight;
//    CGFloat const verticalMargin  = (self.bounds.size.height - labelLineHeight - imageViewEdgeHeight) * 0.5;
//
//    // imageView 和 titleLabel 中心的 Y 值
//    CGFloat const centerOfImageView  = verticalMargin + imageViewEdgeHeight * 0.5;
//    CGFloat const centerOfTitleLabel = imageViewEdgeHeight  + verticalMargin * 2 + labelLineHeight * 0.5 + 5;
//
//    //imageView position 位置
//    self.imageView.bounds = CGRectMake(0, 0, imageViewEdgeWidth, imageViewEdgeHeight);
//    self.imageView.center = CGPointMake(centerOfView, centerOfImageView);
//
//    //title position 位置
//    self.titleLabel.bounds = CGRectMake(0, 0, self.bounds.size.width, labelLineHeight);
//    self.titleLabel.center = CGPointMake(centerOfView, centerOfTitleLabel);
//}
//
//
//+ (id)plusButton {
//    RecordBtn *button = [[RecordBtn alloc] init];
//    UIImage *buttonImage = [UIImage imageNamed:@"tabar_plus_normal"];
//    [button setImage:buttonImage forState:UIControlStateNormal];
//    [button setTitle:@"发布" forState:UIControlStateNormal];
//    [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
//
//    [button setTitle:@"发布" forState:UIControlStateSelected];
//    [button setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
//
//    button.titleLabel.font = [UIFont systemFontOfSize:9.5];
//    [button sizeToFit]; // or set frame in this way `button.frame = CGRectMake(0.0, 0.0, 250, 100);`
//    //    button.frame = CGRectMake(0.0, 0.0, 250, 100);
//    //    button.backgroundColor = [UIColor redColor];
//
//    // if you use `+plusChildViewController` , do not addTarget to plusButton.
//    [button addTarget:button action:@selector(clickPublish) forControlEvents:UIControlEventTouchUpInside];
//    return button;
//}
//
//-(void)clickPublish{
//
//    CYLTabBarController *tabBarController = [self cyl_tabBarController];
//    UIViewController *viewController = tabBarController.selectedViewController;
//
//    PlusViewController *hmpositionVC = [[PlusViewController alloc] init];
//    NavigationViewController *nav = [[NavigationViewController alloc] initWithRootViewController:hmpositionVC];
//    [viewController presentViewController:nav animated:YES completion:nil];
//}
//
////中间按钮的位置
//+ (NSUInteger)indexOfPlusButtonInTabBar {
//    return 2;
//}
//
////constantOfPlusButtonCenterYOffset 为0，同时 multiplierOfTabBarHeight 的值是0.5，表示 PlusButton 居中，小于0.5表示 PlusButton 偏上，大于0.5则表示偏下。
//+ (CGFloat)multiplierOfTabBarHeight:(CGFloat)tabBarHeight {
//    return  0.3;
//}
//
//+ (CGFloat)constantOfPlusButtonCenterYOffsetForTabBarHeight:(CGFloat)tabBarHeight {
//    return  -0;
//}
//
//@end
