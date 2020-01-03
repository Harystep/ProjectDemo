//
//  UIView+Radius.m
//  WHSProject
//
//  Created by 八点半 on 2019/2/15.
//  Copyright © 2019 CCAPP. All rights reserved.
//

#import "UIView+Radius.h"

@implementation UIView (Radius)

- (void)setViewShadowColor:(UIView *)shadowView {
    shadowView.layer.shadowColor = [UIColor blackColor].CGColor;
    shadowView.layer.shadowOpacity = 0.1f;
    shadowView.layer.shadowRadius = 5.0f;
    shadowView.layer.shadowOffset = CGSizeMake(0,-3);//Defaults to (0, -3). Animatable.
    shadowView.layer.borderWidth = 1;//距离2px
    
    shadowView.layer.borderColor = [UIColor colorWithHexString:@"0xFFFFFF"].CGColor;
}

-(void)setCornerRadius:(CGFloat)redius{
    self.layer.cornerRadius = redius;
    self.layer.masksToBounds = YES;
    // 开启离屏渲染
    self.layer.rasterizationScale = [[UIScreen mainScreen] scale];
    self.layer.shouldRasterize = YES;
}
- (void)setViewBorderWidthWithColor:(CGFloat)width withColor:(UIColor *)color {
    self.layer.borderWidth = width;
    self.layer.borderColor = color.CGColor;
}

- (void)setViewBorderWidthWithColor:(CGFloat)width withColor:(UIColor *)color withCornerRadius:(CGFloat)radius{
    self.layer.borderWidth = width;
    self.layer.borderColor = color.CGColor;
    [self setCornerRadius:radius];
}

- (void)setFontBold:(NSString *)boldStr withFont:(CGFloat)font {
    UILabel *fontL = (UILabel *)self;
    fontL.font = [UIFont fontWithName:boldStr size:font];
}

- (void)setFontBold:(CGFloat)font {
    UILabel *fontL = (UILabel *)self;
    fontL.font = [UIFont fontWithName:@"Helvetica-Bold" size:font];
}
@end
