//
//  UIViewController+Extend.h
//  HczyJtb
//
//  Created by pxsl on 2019/8/9.
//  Copyright © 2019 apple. All rights reserved.

#import <UIKit/UIKit.h>

@interface UIViewController (Extend)

- (UIButton *)createButtonOnTargetVC:(UIViewController *)targetVc withFrame:(CGRect)rect;
- (UIButton *)createButtonOnTargetView:(UIView *)targetView withFrame:(CGRect)rect;

- (UILabel *)createLabelOnTargetVC:(UIViewController *)targetVc withFrame:(CGRect)rect;
- (UILabel *)createLabelOnTargetView:(UIView *)targetView withFrame:(CGRect)rect;

- (UIView *)createViewOnTargetVC:(UIViewController *)targetVc withFrame:(CGRect)rect;
- (UIView *)createViewOnTargetView:(UIView *)targetView withFrame:(CGRect)rect;

- (UIImageView *)createImageViewOnTargetVC:(UIViewController *)targetVc withFrame:(CGRect)rect;
- (UIImageView *)createImageViewOnTargetView:(UIView *)targetView withFrame:(CGRect)rect;

- (UIScrollView *)createScrollViewOnTargetVC:(UIViewController *)targetVc withFrame:(CGRect)rect;
- (UIScrollView *)createScrollViewOnTargetView:(UIView *)targetView withFrame:(CGRect)rect;

- (UITableView *)createTableViewOnTargetVC:(UIViewController *)targetVc withFrame:(CGRect)rect;
- (UITableView *)createTableViewOnTargetView:(UIView *)targetView withFrame:(CGRect)rect;
- (UITableView *)createTableViewOnTargetView:(UIView *)targetView withFrame:(CGRect)rect withStyle:(UITableViewStyle)style;

- (UITextField *)createTextFieldOnTargetView:(UIView *)targetView withFrame:(CGRect)rect withPlaceholder:(NSString *)placeholder;

- (UIView *)createNoneDataViewOnView:(UIView *)targetView;

- (UIView *)createNoneDataViewOnTargetView:(UIView *)targetView withImage:(UIImage *)image withContent:(NSString *)content;

@end

