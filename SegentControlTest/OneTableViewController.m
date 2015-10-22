//
//  OneTableViewController.m
//  SegentControlTest
//
//  Created by 周文超 on 15/9/9.
//  Copyright (c) 2015年 com.xinyuan. All rights reserved.
//

#import "OneTableViewController.h"
#import "TwoViewController.h"

//app的高度
#define WNXAppWidth ([UIScreen mainScreen].bounds.size.width)
//app的宽度
#define WNXAppHeight ([UIScreen mainScreen].bounds.size.height + 64)

@interface OneTableViewController ()<UITableViewDataSource>

@property (nonatomic, strong) UIView *twoView;

//推荐View
@property (nonatomic, strong) UITableView *rmedView;

@end

@implementation OneTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setUpUI];

    //注册一个cell
    [self.rmedView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"one_cell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setUpUI
{

    self.rmedView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 1)];

    //设置背景色
    [self.view setBackgroundColor: [UIColor colorWithRed:51/255.0 green:52/255.0 blue:53/255.0 alpha:1.0]];

    UITableView *tableV = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WNXAppWidth, WNXAppHeight) style:UITableViewStylePlain];
    tableV.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.rmedView = tableV;
    self.rmedView.dataSource = self;
    [self.view addSubview:self.rmedView];
    self.rmedView.backgroundColor = self.view.backgroundColor;
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *identifier = @"one_cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"第一个测试数据%tu",indexPath.row];
    return cell;
}

@end
