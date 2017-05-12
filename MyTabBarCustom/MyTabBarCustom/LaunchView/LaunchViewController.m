//
//  LaunchViewController.m
//  MyTabBarCustom
//
//  Created by shen on 2017/5/12.
//  Copyright © 2017年 shen. All rights reserved.
//

#import "LaunchViewController.h"

#import "LaunchAd.h"

@interface LaunchViewController ()
    
    @property (nonatomic, strong)  LaunchAd *Launch;
    @end

@implementation LaunchViewController
    
    
-(void)viewWillAppear:(BOOL)animated{
    if(self.Launch.timer&&self.Launch.TimeInteger>0&&self.Launch.isClick){
        dispatch_resume(self.Launch.timer);
    }
    self.Launch.isClick = NO;
}
-(void)viewWillDisappear:(BOOL)animated{
    if(self.Launch.timer&&self.Launch.TimeInteger>0&&self.Launch.isClick){
        dispatch_suspend(self.Launch.timer);
    }
}
    
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
}
    /**
     *  LaunchViewController
     *
     *  @param imageFrame            广告图片的位置
     *  @param ImageURL         加载广告的URL 可以是图片 也可以是GIF
     *  @param timeSecond       广告的时长
     *  @param hideSkip         是否隐藏“跳过按钮” YES隐藏  NO显示
     *  @param imageLoadGood 广告图片加载完成 回调
     *  @param clickImage       点击广告 回调
     *  @param theAdEnds         广告播放结束 回调
     *
     *  @return LaunchViewController
     */
+(void)showWithFrame:(CGRect)imageFrame ImageURL:(NSString *)ImageURL advertisingURL:(NSString *)advertisingURL timeSecond:(NSInteger)timeSecond hideSkip:(BOOL)hideSkip imageLoadGood:(ImageLoadingGood)imageLoadGood clickImage:(ClickImage)clickImage theAdEnds:(TheAdEnds)theAdEnds{
    LaunchViewController *launchVC = [[LaunchViewController alloc]init];
    
    launchVC.Launch = [LaunchAd initImageWithframe:imageFrame imageURL:ImageURL timeSecond:timeSecond hideSkip:hideSkip LaunchAdCallback:^(UIImage *image, NSString *ImageURL) {
        if(imageLoadGood){
            
            imageLoadGood(image,ImageURL);
        }
        
    } ImageClick:^{
        if(clickImage){
            
            clickImage(launchVC);
        }
    } endPlays:^{
        if(theAdEnds){
            
            theAdEnds();
        }
        
    }];
    [launchVC.view addSubview:launchVC.Launch];
    
    [[UIApplication sharedApplication].delegate window].rootViewController = launchVC;
    
    
    
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
