//
//  BaseViewController.m
//  MyTabBarCustom
//
//  Created by shen on 2017/5/11.
//  Copyright © 2017年 shen. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()
@property (nonatomic, retain) UIView* overlayView;
@property (nonatomic, retain) UIView* bgview;
@property (nonatomic, retain) UIActivityIndicatorView *loadingIndicator;
@property (nonatomic, retain) UIImageView *loadingImageView;
@end

@implementation BaseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (iOS7) {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    self.view.backgroundColor = ViewController_BackGround;
    //导航栏返回 按钮 打开注释掉的代码正常使用
//    NSArray *viewControllers = self.navigationController.viewControllers;
//    if (viewControllers.count > 1){
    
        [self.navigationItem setHidesBackButton:NO animated:NO];
        UIBarButtonItem *leftBarButtonItem = [ControlFactory createBackBarButtonItemWithTarget:self action:@selector(backAction)];
        if (iOS7) {
            
            UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
            negativeSpacer.width = -15;
            self.navigationItem.leftBarButtonItems = @[negativeSpacer, leftBarButtonItem];
            
        }else{
            self.navigationItem.leftBarButtonItem = leftBarButtonItem;
        }
        UISwipeGestureRecognizer *gesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(backSweepGesture:)];
    
        gesture.direction = UISwipeGestureRecognizerDirectionRight;
        [self.view addGestureRecognizer:gesture];
//    }else{
    
//        [self.navigationItem setHidesBackButton:YES animated:NO];
    
//    }

}
- (void)backSweepGesture:(UISwipeGestureRecognizer*)gesture{
    
   [self dismissViewControllerAnimated:YES completion:nil];
//    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark Action
- (void)backAction{
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
//    [self.navigationController popViewControllerAnimated:YES];
}

-(void)setCustomerTitle:(NSString *)title{
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 44)];
    titleLabel.text = title;
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = [UIFont systemFontOfSize:18];
    self.navigationItem.titleView = titleLabel;
    
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
