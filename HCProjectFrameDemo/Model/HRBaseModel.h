//
//  HRBaseModel.h
//  HRCommonTool
//
//  Created by pxsl on 2019/12/12.
//  Copyright © 2019 CCAPP. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HRBaseModel : NSObject

@property (copy, nonatomic) NSString *title;

@property (assign, nonatomic) NSInteger age;

@property (copy, nonatomic) NSString *name;

+ (instancetype)baseInfoWithDic:(NSDictionary *)dict;

- (instancetype)initWithDic:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
