

#import "UIView+Extension.h"

@implementation UIView (Extension)

- (void)setX:(CGFloat)x{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)x {
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y {
    return self.frame.origin.y;
}

- (void)setCenterX:(CGFloat)centerX {
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY {
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY {
    return self.center.y;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height {
    return self.frame.size.height;
}


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

- (UIViewController *)viewController {
    for (UIView *view = self; view; view = view.superview) {
        UIResponder *nextResponder = [view nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

@end
