
#import <UIKit/UIKit.h>

@interface UILabel (Extend)

/**
 修改行距
 */
- (void)setText:(NSString*)text lineSpacing:(CGFloat)lineSpacing;

- (void)setLabelFont:(CGFloat)font withTextAlignment:(NSTextAlignment)textAlignment withTextColor:(UIColor *)color;

- (void)setLabelTextColor:(UIColor *)color text:(NSString *)text withFont:(CGFloat)font;

@end
