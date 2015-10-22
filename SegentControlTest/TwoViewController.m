//
//  TwoViewController.m
//  SegentControlTest
//
//  Created by 周文超 on 15/9/9.
//  Copyright (c) 2015年 com.xinyuan. All rights reserved.
//

#import "TwoViewController.h"

//app的高度
#define WNXAppWidth ([UIScreen mainScreen].bounds.size.width)
//app的宽度
#define WNXAppHeight ([UIScreen mainScreen].bounds.size.height)

@interface TwoViewController ()<UITableViewDataSource>

//推荐View
@property (nonatomic, strong) UITableView *rmedView;
@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setUpUI];

    //注册一个cell
    [self.rmedView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"two_cell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setUpUI{

    //设置背景色
    [self.view setBackgroundColor: [UIColor colorWithRed:51/255.0 green:52/255.0 blue:53/255.0 alpha:1.0]];
    UITableView *tableV = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WNXAppWidth, WNXAppHeight) style:UITableViewStylePlain];
    tableV.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.rmedView = tableV;
    self.rmedView.dataSource = self;
    [self.view addSubview:self.rmedView];
    self.rmedView.backgroundColor = self.view.backgroundColor;
}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"two_cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.backgroundColor = [UIColor orangeColor];
    cell.textLabel.text = [NSString stringWithFormat:@"第二个测试数据%tu",indexPath.row];
    return cell;
}

@end
