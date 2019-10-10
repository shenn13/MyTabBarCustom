//
//  TabBarSelectTableViewController.m
//  MyTabBarCustom
//
//  Created by shen on 2017/5/11.
//  Copyright © 2017年 shen. All rights reserved.
//

#import "TabBarSelectTableViewController.h"

#import "TabBarViewController.h"
#import "TabBarTwoViewController.h"
//#import "TabBarThreeViewController.h"

@interface TabBarSelectTableViewController (){
    
    NSArray *_dataArr;
}

@end

@implementation TabBarSelectTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"TabBar";
    
//    _dataArr = @[@"TabBar样式一",@"TabBar样式二",@"TabBar样式三"];
       _dataArr = @[@"TabBar样式一",@"TabBar样式二"];
}

#pragma mark - TableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = _dataArr[indexPath.row];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        [self presentViewController:[TabBarViewController new] animated:YES completion:nil];
    }
    if (indexPath.row == 1) {
 
        [self presentViewController:[TabBarTwoViewController new] animated:YES completion:nil];
    }
//    if (indexPath.row == 2) {
//
//        [self presentViewController:[TabBarThreeViewController new] animated:YES completion:nil];
//    }
    
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;{
    return 80;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
