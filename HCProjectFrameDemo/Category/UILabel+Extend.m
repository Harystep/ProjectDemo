

#import "UILabel+Extend.h"

@implementation UILabel (Extend)

//修改行距
- (void)setText:(NSString*)text lineSpacing:(CGFloat)lineSpacing {
    if (lineSpacing < 0.01 || !text) {
        self.text = text;
        return;
    }
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    [attributedString addAttribute:NSFontAttributeName value:self.font range:NSMakeRange(0, [text length])];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpacing];
    [paragraphStyle setLineBreakMode:self.lineBreakMode];
    [paragraphStyle setAlignment:self.textAlignment];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [text length])];
    self.attributedText = attributedString;
}

- (void)setLabelTextColor:(UIColor *)color text:(NSString *)text withFont:(CGFloat)font {
    self.font = kFontSize(font);
    self.textColor = color;
    if (text != nil) {
        self.text = text;
    }
}

- (void)setLabelFont:(CGFloat)font withTextAlignment:(NSTextAlignment)textAlignment withTextColor:(UIColor *)color {
    
    self.textColor = color;
    self.font = [UIFont systemFontOfSize:font];
    self.textAlignment = textAlignment;
}

@end
