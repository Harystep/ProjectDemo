//
//  UIView+Radius.h
//  WHSProject
//
//  Created by 八点半 on 2019/2/15.
//  Copyright © 2019 CCAPP. All rights reserved.
//



NS_ASSUME_NONNULL_BEGIN

@interface UIView (Radius)
/** 为视图设置投影 */
- (void)setViewShadowColor:(UIView *)shadowView;

/*为视图设置圆角*/
- (void)setCornerRadius:(CGFloat)redius;

- (void)setViewBorderWidthWithColor:(CGFloat)width withColor:(UIColor *)color;

- (void)setViewBorderWidthWithColor:(CGFloat)width withColor:(UIColor *)color withCornerRadius:(CGFloat)radius;

- (void)setFontBold:(NSString *)boldStr withFont:(CGFloat)font;

- (void)setFontBold:(CGFloat)font;

@end

NS_ASSUME_NONNULL_END
