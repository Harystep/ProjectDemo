//
//  HRBaseModel.m
//  HRCommonTool
//
//  Created by pxsl on 2019/12/12.
//  Copyright © 2019 CCAPP. All rights reserved.
//

#import "HRBaseModel.h"

@implementation HRBaseModel

+ (instancetype)baseInfoWithDic:(NSDictionary *)dict{
    return [[self alloc] initWithDic:dict];
}

- (instancetype)initWithDic:(NSDictionary *)dict{
    if (self = [super init]) {
        self.title = dict[@"title"];
        self.age = [dict[@"age"] integerValue];
        self.name = dict[@"name"];
    }
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"{%@:<%p>} title:%@\n name:%@\n age:%tu", self.class, self, self.title, self.name, self.age];
}

@end
