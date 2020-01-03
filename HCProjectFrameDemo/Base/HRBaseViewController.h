//
//  HRBaseViewController.h
//  HczyJtb
//
//  Created by pxsl on 2019/9/3.
//  Copyright © 2019 Wuhan Hanchen Zhongyi Information Technoogy Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HRBaseViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView *tbView;

@property (assign, nonatomic) UITableViewStyle tableStyle;

@property (strong, nonatomic) NSMutableArray *dataArr;

@property (strong, nonatomic) UIButton *backBtn;

@property (strong, nonatomic) UIView *noHaveView;

@property (assign, nonatomic) BOOL header;

@property (assign, nonatomic) BOOL footer;

- (void)getBaseOperateInfo;
- (void)getMoreDataOperateInfo;

@end


