//
//  ViewController.m
//  SegentControlTest
//
//  Created by 周文超 on 15/9/9.
//  Copyright (c) 2015年 com.xinyuan. All rights reserved.
//

#import "ViewController.h"
#import "OneTableViewController.h"
#import "TwoViewController.h"

#define ViewFrame CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height + 64 )

@interface ViewController ()

//** 导航titileView */
@property (nonatomic, weak) UISegmentedControl *titleView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.automaticallyAdjustsScrollViewInsets = NO;

    // 创建sementcontrol
    [self setUpNavigationItem];

    // 添加控制器到父控制器
    [self addChildViewControllers];

    // 默认选中第一个
    [self switchController:0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 添加sementcontrol
- (void)setUpNavigationItem
{
    //设置导航条titleView
    UISegmentedControl *titleV = [[UISegmentedControl alloc] initWithItems:@[@"推荐", @"附近"]];
    [titleV setTintColor:[UIColor colorWithRed:26/255.0 green:163/255.0 blue:146/255.0 alpha:1.0]];
    titleV.frame = CGRectMake(0, 0, self.view.bounds.size.width * 0.5, 30);
    //文字设置
    NSMutableDictionary *attDic = [NSMutableDictionary dictionary];
    attDic[NSFontAttributeName] = [UIFont boldSystemFontOfSize:16];
    attDic[NSForegroundColorAttributeName] = [UIColor orangeColor];
    [titleV setTitleTextAttributes:attDic forState:UIControlStateNormal];
    [titleV setTitleTextAttributes:attDic forState:UIControlStateSelected];

    //事件
    titleV.selectedSegmentIndex = 0;
    [titleV addTarget:self action:@selector(titleViewChange:) forControlEvents:UIControlEventValueChanged];
    _titleView = titleV;
    self.navigationItem.titleView = _titleView;
    self.view.backgroundColor = [UIColor whiteColor];
}

// 添加控制器数组
- (void)addChildViewControllers{

    [self addChildViewController:[[OneTableViewController alloc] init]];
    [self addChildViewController:[[TwoViewController alloc] init]];
}

// 监听点击
- (void)titleViewChange:(UISegmentedControl *)sender{
    [self switchController:sender.selectedSegmentIndex];
}

// 切换控制器
- (void)switchController:(NSUInteger)index{
    for (int i = 0; i< self.childViewControllers.count; i++) {
        if (i != index) {
            UIViewController *vc = self.childViewControllers[i];
            if ([vc isViewLoaded]) {  // view被创建了，才去访问它
                [vc.view removeFromSuperview];
            }
        }
    }
    [self.childViewControllers[index] view].frame = ViewFrame;
    [self.view addSubview:[self.childViewControllers[index] view]];
}

/**
 没有建立外层和内层控制器的父子关系，带来的严重后果
 1.旋转等重大事件无法传递到内部的一些小控制器
 2.内层的控制器无法拿到navigationController属性，无法进行push操作
 3.内层的控制器无法dismiss

 解决方案：
 1.通过addChildViewController方法建立外层和内层控制器的父子关系
 2.凡是用addChildViewController添加的子控制器，都会存在于childViewControllers数组

 规律-经验：
 如果2个控制器的view是父子关系，那么这2个控制器也应该是父子关系
 */

@end
