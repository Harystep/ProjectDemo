//
//  UIResponder+HBRouter.m
//  Humberto
//
//  Created by lighthouse on 2019/8/28.
//  Copyright © 2019年 Humberto. All rights reserved.
//

#import "UIResponder+HBRouter.h"

@implementation UIResponder (HBRouter)

- (void)routerWithEventName:(NSString *)eventName userInfo:(NSDictionary *)userInfo block:(void (^)(id result))block {
    if (self.nextResponder) {
        [[self nextResponder] routerWithEventName:eventName userInfo:userInfo block:block];
    }
}

- (void)routerWithEventName:(NSString *)eventName userInfo:(NSDictionary *)userInfo {
    if (self.nextResponder) {
        [[self nextResponder] routerWithEventName:eventName userInfo:userInfo];
    }
}

- (void)routerWithEventName:(NSString *)eventName {
    if (self.nextResponder) {
        [[self nextResponder] routerWithEventName:eventName];
    }
}

@end
