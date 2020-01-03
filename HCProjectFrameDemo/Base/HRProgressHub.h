//
//  HRProgressHub.h
//  HRCommonTool
//
//  Created by pxsl on 2019/10/8.
//  Copyright © 2019 CCAPP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HRProgressHub : UIView

+ (instancetype)sharedInstance;

- (void)showTextMsg:(NSString *)content;

@end


