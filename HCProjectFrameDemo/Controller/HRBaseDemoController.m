//
//  HRTestDemo1.m
//  HRCommonTool
//
//  Created by pxsl on 2019/12/9.
//  Copyright © 2019 CCAPP. All rights reserved.
//

#import "HRBaseDemoController.h"
#import "HRBaseDataModel.h"
#import "HRBaseSimpleCell.h"

@interface HRBaseDemoController ()

@property (strong, nonatomic) HRBaseDataModel *dataModel;

@end

@implementation HRBaseDemoController

- (void)viewWillAppear:(BOOL)animated{
    
    //设置导航栏背景图片为一个空的image，这样就透明了
//
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"activity_bg"] forBarMetrics:UIBarMetricsDefault];
    
    //去掉透明后导航栏下边的黑边
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
}

- (void)viewWillDisappear:(BOOL)animated{
    
    //    如果不想让其他页面的导航栏变为透明 需要重置
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [self setSubViews];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *array = self.dataArr[section];
    return array.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.dataArr.count >= indexPath.section) {
        HRBaseSimpleCell *cell = [HRBaseSimpleCell baseSimpleTableView:tableView indexPath:indexPath];
        NSArray *array = self.dataArr[indexPath.section];
        cell.dataModel = array[indexPath.row];
        return cell;
    } else {
        return nil;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [HCRouter router:@"mjextensionDemo" viewController:self animated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 10)];
    view.backgroundColor = kColorHex(@"#f6f6f6");
    return view;
}
#pragma mark -- 响应路由方法
- (void)routerWithEventName:(NSString *)eventName userInfo:(NSDictionary *)userInfo block:(void (^)(id _Nonnull))block {
    NSLog(@"点击回调");
    [[HRProgressHub sharedInstance] showTextMsg:@"我又回来啦111"];
    block(@"12313");
}

- (void)routerWithEventName:(NSString *)eventName userInfo:(NSDictionary *)userInfo {
    NSLog(@"点击操作");
    [[HRProgressHub sharedInstance] showTextMsg:@"点击操作"];
}

- (void)routerWithEventName:(NSString *)eventName {
    NSLog(@"点击 你想干啥");
}

- (void)setSubViews {
    
    self.tableStyle = UITableViewStyleGrouped;
    self.tbView.frame = CGRectMake(0, kHRStatusBarAndNavigationBarHeight, kScreenWidth, kScreenHeight - kHRStatusBarAndNavigationBarHeight);
    [self.tbView registerTableViewIndentifiers:@[@"HRBaseSimpleCell"]];
    self.tbView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.header = YES;
    self.footer = YES;
    
    [self.tbView.mj_header beginRefreshing];
}

- (void)getBaseOperateInfo {
    __weakSelf(weakSelf);
    //发起网络请求
    [self.dataModel requestDate:@{} withResultData:^(NSInteger status, id  _Nullable subValue) {
        NSLog(@"%@", subValue);
        [weakSelf.dataArr removeAllObjects];
        [weakSelf.dataArr addObject:subValue];
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.tbView.mj_header endRefreshing];
            [weakSelf.tbView reloadData];
        });
        
    }];
}

- (void)getMoreDataOperateInfo {
    __weakSelf(weakSelf);
    [self.dataModel requestMoreDate:@{} withResultData:^(NSInteger status, id  _Nullable subValue) {
        NSLog(@"%@", subValue);
        [weakSelf.dataArr addObject:subValue];
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.tbView.mj_footer endRefreshing];
            [weakSelf.tbView reloadData];
        });
        
    }];
}

- (HRBaseDataModel *)dataModel {
    if (!_dataModel) {
        _dataModel = [[HRBaseDataModel alloc] init];
    }
    return _dataModel;
}

@end

