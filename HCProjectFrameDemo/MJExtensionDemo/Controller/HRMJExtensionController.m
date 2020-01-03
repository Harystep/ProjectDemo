//
//  HRMJExtensionController.m
//  HRCommonTool
//
//  Created by pxsl on 2019/12/13.
//  Copyright © 2019 CCAPP. All rights reserved.
//

#import "HRMJExtensionController.h"
#import "HRExtensionModel.h"

@interface HRMJExtensionController ()

@end

@implementation HRMJExtensionController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setConfigureView];
    
    [self testExtensionDemo];
    
//    [self testReplaceExtensionIDDemo];
    
    [self testMappingExtensionDemo];
}
#pragma mark -- 模型数据另外嵌套模型数组
- (void)testExtensionDemo {
    
    NSDictionary *dic = @{
                          @"title":@"吃饭",
                          @"time":@"2019-12-12",
                          @"names":@[
                                        @{
                                             @"name":@"小明",
                                             @"age":@(20),
                                             @"id":@(01)
                                         },
                                        @{
                                            @"name":@"小张",
                                            @"age":@(25),
                                            @"id":@(02)
                                            }
                                     ]
                          };
    HRExtensionModel *model = [HRExtensionModel mj_objectWithKeyValues:dic];
    HRNameModel *name = model.names.firstObject;
    NSLog(@"%@", name);
    
    NSDictionary *modelDic = model.mj_keyValues;
    NSLog(@"modelDic-->%@", modelDic);
}

- (void)testMappingExtensionDemo {
    NSDictionary *dict = @{
                           @"title":@"hfksfk",
                           @"id" : @"20",
                           @"description" : @"kids",
                           @"name" : @{
                                   @"nowName" : @"lufy",
                                   @"oldName" : @"kitty",
                                   @"info" : @[
                                           @"test-data",
                                           @{
                                               @"nameChangedTime" : @"2013-08"
                                               }
                                           ]
                                   },
                           @"other" : @{
                                   @"bag" : @{
                                           @"name" : @"a red bag",
                                           @"price" : @100.7
                                           }
                                   }
                           };
    
    HRMapExtensionModel *model = [HRMapExtensionModel mj_objectWithKeyValues:dict];
    NSLog(@"%@", model);
}

#pragma mark -- 更换键值
- (void)testReplaceExtensionIDDemo {
    NSDictionary *dic = @{
                          @"title":@"吃饭",
                          @"time":@"2019-12-12",
                          @"id":@(123)
                          };
    HRExtensionIDModel *model = [HRExtensionIDModel mj_objectWithKeyValues:dic];
    NSLog(@"%tu", model.ad_id);
}

- (void)setConfigureView {
    self.backBtn.hidden = NO;
    
}

@end
