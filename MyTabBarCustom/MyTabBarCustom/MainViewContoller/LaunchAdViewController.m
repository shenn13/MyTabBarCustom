//
//  LaunchAdViewController.m
//  MyTabBarCustom
//
//  Created by shen on 2017/5/12.
//  Copyright © 2017年 shen. All rights reserved.
//

#import "LaunchAdViewController.h"
#import <WebKit/WKWebView.h>
@interface LaunchAdViewController ()

@end

@implementation LaunchAdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self HomeWebView];
}

- (void)HomeWebView
{
    WKWebView *webView = [[WKWebView alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
    [self.view addSubview:webView];
    
    
    NSURL *url = [NSURL URLWithString:self.urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [webView loadRequest:request];
    
    
    if(self.AppDelegateSele == -1)
    {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    }
    
}

- (void)back
{
    
    if(self.WebBack){
        
        self.WebBack();
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (NSString *)urlStr
{
    if(_urlStr == nil)
    {
        _urlStr = [NSString string];
    }
    return _urlStr;
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
