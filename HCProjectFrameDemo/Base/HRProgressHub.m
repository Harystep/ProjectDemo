//
//  HRProgressHub.m
//  HRCommonTool
//
//  Created by pxsl on 2019/10/8.
//  Copyright © 2019 CCAPP. All rights reserved.
//

#import "HRProgressHub.h"

#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height
#define kMarX 16.0

@interface HRProgressHub ()

@property (strong, nonatomic) UIView *contentView;

@property (strong, nonatomic) UILabel *titleL;

@end

static HRProgressHub *_instance;

@implementation HRProgressHub


+ (HRProgressHub *)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[HRProgressHub alloc] init];
    });
    return _instance;
}


- (void)showTextMsg:(NSString *)content {
    _instance.hidden = NO;
    _instance.backgroundColor = [UIColor darkGrayColor];
    [_instance setCornerRadius:10.0];
    UILabel *titleL = [[UILabel alloc] init];
    titleL.font = kFontSize(15);
    titleL.textColor = [UIColor whiteColor];
    titleL.textAlignment = NSTextAlignmentCenter;
    titleL.numberOfLines = 0;
    titleL.lineBreakMode = NSLineBreakByCharWrapping;
    CGSize contentSize = [self compareContentSize:content withFont:15 widthLimited:(kWidth - 30 * 2)];
    titleL.text = content;
    [_instance addSubview:titleL];
    CGFloat instanceWidth = contentSize.width + 16;
    CGFloat instanceHeight = contentSize.height + 16;
    dispatch_async(dispatch_get_main_queue(), ^{
        _instance.frame = CGRectMake((kWidth - instanceWidth) / 2.0, (kHeight - instanceHeight) / 2.0, instanceWidth, instanceHeight);
        titleL.frame = CGRectMake(6, 5, contentSize.width + 4, contentSize.height + 4);
    });
    
    UIWindow *win = [UIApplication sharedApplication].keyWindow;
    [win addSubview:_instance];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [titleL removeFromSuperview];
        _instance.hidden = YES;
    });
    
}

- (CGSize)compareContentSize:(NSString *)title withFont:(CGFloat)font widthLimited:(CGFloat)limitWidth{
    UIFont *fnt = [UIFont systemFontOfSize:font];
    CGSize postJobSize = [title boundingRectWithSize:CGSizeMake(limitWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:fnt,NSFontAttributeName, nil] context:nil].size;
    return postJobSize;
}


@end
