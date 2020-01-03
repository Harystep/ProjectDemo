//  UIViewController+Extend.m
//  HczyJtb
//  Created by pxsl on 2019/8/9.
//  Copyright © 2019 apple. All rights reserved.

#import "UIViewController+Extend.h"

@implementation UIViewController (Extend)

- (UIView *)createViewOnTargetVC:(UIViewController *)targetVc withFrame:(CGRect)rect {
    UIView *view = [[UIView alloc] init];
    view.frame = rect;
    [targetVc.view addSubview:view];
    return view;
}

- (UIView *)createViewOnTargetView:(UIView *)targetView withFrame:(CGRect)rect {
    UIView *view = [[UIView alloc] init];
    view.frame = rect;
    [targetView addSubview:view];
    return view;
}

- (UILabel *)createLabelOnTargetVC:(UIViewController *)targetVc withFrame:(CGRect)rect {
    UILabel *label = [[UILabel alloc] init];
    label.frame = rect;
    [targetVc.view addSubview:label];
    return label;
}

- (UILabel *)createLabelOnTargetView:(UIView *)targetView withFrame:(CGRect)rect {
    UILabel *label = [[UILabel alloc] init];
    label.frame = rect;
    [targetView addSubview:label];
    return label;
}

- (UIImageView *)createImageViewOnTargetVC:(UIViewController *)targetVc withFrame:(CGRect)rect {
    UIImageView *imageIv = [[UIImageView alloc] init];
    imageIv.frame = rect;
    [targetVc.view addSubview:imageIv];
    return imageIv;
}
- (UIImageView *)createImageViewOnTargetView:(UIView *)targetView withFrame:(CGRect)rect {
    UIImageView *imageIv = [[UIImageView alloc] init];
    imageIv.frame = rect;
    [targetView addSubview:imageIv];
    return imageIv;
}

- (UIButton *)createButtonOnTargetVC:(UIViewController *)targetVc withFrame:(CGRect)rect {
    UIButton *btn = [[UIButton alloc] init];
    btn.frame = rect;
    [targetVc.view addSubview:btn];
    return btn;
}

- (UIButton *)createButtonOnTargetView:(UIView *)targetView withFrame:(CGRect)rect {
    UIButton *btn = [[UIButton alloc] init];
    btn.frame = rect;
    [targetView addSubview:btn];
    return btn;
}

- (UIScrollView *)createScrollViewOnTargetVC:(UIViewController *)targetVc withFrame:(CGRect)rect {
    UIScrollView *scView = [[UIScrollView alloc] init];
    scView.frame = rect;
    [targetVc.view addSubview:scView];
    return scView;
}

- (UIScrollView *)createScrollViewOnTargetView:(UIView *)targetView withFrame:(CGRect)rect {
    UIScrollView *scView = [[UIScrollView alloc] init];
    scView.frame = rect;
    [targetView addSubview:scView];
    return scView;
}

- (UITableView *)createTableViewOnTargetVC:(UIViewController *)targetVc withFrame:(CGRect)rect {
    UITableView *tbView = [[UITableView alloc] init];
    tbView.frame = rect;
//    tbView.delegate = targetVc;
//    tbView.dataSource = targetVc;
    [targetVc.view addSubview:tbView];
    tbView.separatorStyle = UITableViewCellSeparatorStyleNone;
    return tbView;
}
- (UITableView *)createTableViewOnTargetView:(UIView *)targetView withFrame:(CGRect)rect {
    UITableView *tbView = [[UITableView alloc] init];
    tbView.frame = rect;
    [targetView addSubview:tbView];
    tbView.separatorStyle = UITableViewCellSeparatorStyleNone;
    return tbView;
}

- (UITableView *)createTableViewOnTargetView:(UIView *)targetView withFrame:(CGRect)rect withStyle:(UITableViewStyle)style{
    UITableView *tbView = [[UITableView alloc] initWithFrame:rect style:style];
    [targetView addSubview:tbView];
    tbView.separatorStyle = UITableViewCellSeparatorStyleNone;
    return tbView;
}

- (UITextField *)createTextFieldOnTargetView:(UIView *)targetView withFrame:(CGRect)rect withPlaceholder:(NSString *)placeholder {
    UITextField *textF = [[UITextField alloc] init];
    textF.frame = rect;
    [targetView addSubview:textF];
    textF.placeholder = placeholder;
    return textF;
}

- (UIView *)createNoneDataViewOnView:(UIView *)targetView {
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake((targetView.width-100)/2, (targetView.height-200)/2, 100, 130)];
    [targetView addSubview:view];
    UIImageView *noHaveImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    noHaveImage.image = [UIImage imageNamed:@"zanwushuju"];
    [view addSubview:noHaveImage];
    UILabel *labi = [[UILabel alloc]initWithFrame:CGRectMake(0, 110, 100, 20)];
    labi.textAlignment = NSTextAlignmentCenter;
    labi.textColor = kColorHex(@"666666");
    labi.font = kFontSize(13);
    labi.text = @"暂无数据";
    view.hidden = YES;
    [view addSubview:labi];
    return view;
}

- (UIView *)createNoneDataViewOnTargetView:(UIView *)targetView withImage:(UIImage *)image withContent:(NSString *)content {
    UIImageView *noHaveImage = [[UIImageView alloc]initWithImage:image];
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, (kScreenHeight - noHaveImage.height - 30)/2, kScreenWidth, noHaveImage.height + 30)];
    [targetView addSubview:view];
    noHaveImage.frame = CGRectMake((view.width - noHaveImage.width)/2, 0, noHaveImage.width, noHaveImage.height);
    [view addSubview:noHaveImage];
    
    UILabel *labi = [[UILabel alloc]initWithFrame:CGRectMake(0, noHaveImage.height + 10, view.width, 20)];
    labi.textAlignment = NSTextAlignmentCenter;
    labi.textColor = kColorHex(@"#343434");
    labi.font = kFontSize(15);
    labi.text = content;
    [view addSubview:labi];
    view.hidden = YES;
    return view;
}

-(NSDate *)getPriousorYearDateFromDate:(NSDate *)date withYear:(NSInteger)year withMonth:(NSInteger)month withDay:(NSInteger)day{
    //获取上一年时间
    NSDateComponents *comps = [[NSDateComponents alloc]init];
    [comps setYear:year];
    [comps setMonth:month];
    [comps setDay:day];
    NSCalendar *calender = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];// NSGregorianCalendar
    NSDate *mDate = [calender dateByAddingComponents:comps toDate:date options:0];
    return mDate;
}

@end
