

#import <UIKit/UIKit.h>

@interface UIView (Extension)
/** X坐标 */
@property(nonatomic, assign)CGFloat x;

/** Y坐标 */
@property(nonatomic, assign)CGFloat y;

/** x中心点 */
@property(nonatomic, assign)CGFloat centerX;

/** y中心点 */
@property(nonatomic, assign)CGFloat centerY;

/** 坐标 */
@property(nonatomic, assign)CGPoint origin;

/** 宽度 */
@property(nonatomic, assign)CGFloat width;

/** 高度 */
@property(nonatomic, assign)CGFloat height;

/** 尺寸 */
@property(nonatomic, assign)CGSize size;

/**
 Returns the view's view controller (may be nil).
 */
@property (nullable, nonatomic, readonly) UIViewController *viewController;


- (UIView *)createViewOnTargetView:(UIView *)targetView withFrame:(CGRect)rect;

- (UILabel *)createLabelOnTargetView:(UIView *)targetView withFrame:(CGRect)rect;

- (UIImageView *)createImageViewOnTargetView:(UIView *)targetView withFrame:(CGRect)rect;

- (UIButton *)createButtonOnTargetView:(UIView *)targetView withFrame:(CGRect)rect;

- (UIScrollView *)createScrollViewOnTargetView:(UIView *)targetView withFrame:(CGRect)rect;

- (UITableView *)createTableViewOnTargetView:(UIView *)targetView withFrame:(CGRect)rect;

- (UITextField *)createTextFieldOnTargetView:(UIView *)targetView withFrame:(CGRect)rect withPlaceholder:(NSString *)placeholder;

@end
