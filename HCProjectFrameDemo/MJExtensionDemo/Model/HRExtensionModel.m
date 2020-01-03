//
//  HRMJExtensionModel.m
//  HRCommonTool
//
//  Created by pxsl on 2019/12/13.
//  Copyright © 2019 CCAPP. All rights reserved.
//

#import "HRExtensionModel.h"

@implementation HRExtensionModel

+ (NSDictionary *)mj_objectClassInArray {
    return @{
             @"names" : @"HRNameModel",
             };
}

- (NSString *)description {
    return [NSString stringWithFormat:@"{%@:<%p>}\n title:%@\n time:%@\n names:%@", self.class, self, self.title, self.time, self.names];
}

@end

@implementation HRNameModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{
             @"ad_id" : @"id",
             };
}
- (NSString *)description {
    return [NSString stringWithFormat:@"{%@:<%p>}\n name:%@\n age:%tu\n ad_id:%tu", self.class, self, self.name, self.age, self.ad_id];
}

@end


@implementation HRExtensionIDModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{
             @"ad_id" : @"id",
            };
}

- (NSString *)description {
    return [NSString stringWithFormat:@"{%@:<%p>}\n title:%@\n time:%@\n ad_id:%tu", self.class, self, self.title, self.time, self.ad_id];
}

@end

@implementation HRMapExtensionModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{
             @"ID" : @"id",
             @"desc":@"description",
             @"nowName":@"name.nowName",
             @"oldName":@"name.oldName",
             @"nameChangedTime":@"name.info[1].nameChangedTime",
             @"bag":@"other.bag"
             };
}

- (NSString *)description {
    return [NSString stringWithFormat:@"{%@:<%p>}\n ID:%@\n desc:%@\n nowName:%@\n oldName:%@\n nameChangedTime:%@\n bag:%@", self.class, self, self.ID, self.desc, self.nowName, self.oldName, self.nameChangedTime, self.bag];
}

@end


@implementation Bag

- (NSString *)description {
    return [NSString stringWithFormat:@"{%@:<%p>}\n name:%@\n price:%tu", self.class, self, self.name, self.price];
}

@end
