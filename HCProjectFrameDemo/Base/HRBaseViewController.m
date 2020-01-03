//
//  HRBaseViewController.m
//  HczyJtb
//
//  Created by pxsl on 2019/9/3.
//  Copyright © 2019 Wuhan Hanchen Zhongyi Information Technoogy Co., Ltd. All rights reserved.
//

#import "HRBaseViewController.h"

@interface HRBaseViewController ()

@end

@implementation HRBaseViewController

- (NSMutableArray *)dataArr {
    if (_dataArr == nil) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 40, 40); // icon_v2_black_left
    [btn setImage:[UIImage imageNamed:@"icon_back"] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
    [btn addTarget:self action:@selector(backOperate) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftbar =  [[UIBarButtonItem alloc]initWithCustomView:btn];
    self.backBtn = btn;
    btn.hidden = YES;
    self.navigationItem.leftBarButtonItems = @[leftbar];
    self.view.backgroundColor = [UIColor whiteColor];
    
}

- (void)setTableStyle:(UITableViewStyle)tableStyle {
    UITableView *tbView;
    if (tableStyle == UITableViewStyleGrouped) {
        tbView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStyleGrouped];
    } else {
        tbView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
    }
    tbView.showsVerticalScrollIndicator = NO;
    tbView.backgroundColor = [UIColor whiteColor];
    tbView.delegate = self;
    tbView.dataSource = self;
    tbView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tbView = tbView;
    tbView.rowHeight = UITableViewAutomaticDimension;
    [self.view addSubview:tbView];
    if (@available(iOS 11.0, *)) {
        tbView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    self.noHaveView = [self createNoneDataViewOnView:self.view];
    self.noHaveView.hidden = YES;
}

- (void)setHeader:(BOOL)header {
    if (header) {
        __weakSelf(weakSelf);
        self.tbView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [weakSelf getBaseOperateInfo];
        }];
        self.tbView.mj_header.automaticallyChangeAlpha = YES;
    } else {
        self.tbView.mj_header = nil;
    }
}

- (void)setFooter:(BOOL)footer {
    if (footer) {
        __weakSelf(weakSelf);
        self.tbView.mj_footer = [MJRefreshBackStateFooter footerWithRefreshingBlock:^{
            [weakSelf getMoreDataOperateInfo];
        }];
        self.tbView.mj_footer.automaticallyChangeAlpha = YES;
    } else {
        self.tbView.mj_footer = nil;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HRCell" forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HRCell"];
    }
    return cell;
}


- (void)backOperate {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
