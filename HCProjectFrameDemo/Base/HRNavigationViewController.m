//
//  HRNavigationViewController.m
//  HRCommonTool
//
//  Created by pxsl on 2019/12/9.
//  Copyright © 2019 CCAPP. All rights reserved.
//

#import "HRNavigationViewController.h"

@interface HRNavigationViewController ()

@end

@implementation HRNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (animated) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:YES];
}

@end
