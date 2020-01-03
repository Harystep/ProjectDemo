

#import "UIButton+Button.h"
#import <objc/runtime.h>

static const void *blockKey = &blockKey;


@implementation UIButton (Button)
@dynamic touchBlock;

//set 用Runtime 强制给类目添加属性
-(void)setTouchBlock:(CustomTouch)touchBlock{
    objc_setAssociatedObject(self, blockKey, touchBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
//get
-(CustomTouch)touchBlock{
    return objc_getAssociatedObject(self, blockKey);
}

-(void)addActionWith:(CustomTouch)touchClock{
    self.touchBlock = touchClock;
    if (!self.touchBlock) {
        return;
    }
    [self addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)btnClick:(UIButton*)button{
    if (self.touchBlock) {
        self.touchBlock(button);
    }
}
-(void)setCornerRadius:(CGFloat)redius{
    self.layer.cornerRadius = redius;
    self.layer.masksToBounds = YES;
    // 开启离屏渲染
    self.layer.rasterizationScale = [[UIScreen mainScreen] scale];
    self.layer.shouldRasterize = YES;
}

- (void)setLayerBorderWidthWithColor:(CGFloat)width withColor:(UIColor *)color {
    self.layer.borderWidth = width;
    self.layer.borderColor = color.CGColor;
}

- (void)setBtnTitleChangeSizeWithImage {
    self.titleEdgeInsets = UIEdgeInsetsMake(0, -(self.imageView.width), 0, (self.imageView.width));
    self.imageEdgeInsets = UIEdgeInsetsMake(0, (self.titleLabel.width) + 2, 0, -(self.titleLabel.width));
}

- (void)setButtonTextColor:(UIColor *)color text:(NSString *)text withFont:(CGFloat)font {
    self.titleLabel.font = kFontSize(font);
    if (text != nil) {
        [self setTitle:text forState:UIControlStateNormal];
    }
    [self setTitleColor:color forState:UIControlStateNormal];
}

@end
