//
//  HRBaseDataModel.m
//  HRCommonTool
//
//  Created by pxsl on 2019/12/12.
//  Copyright © 2019 CCAPP. All rights reserved.
//

#import "HRBaseDataModel.h"
#import "HRBaseModel.h"

@interface HRBaseDataModel ()

@property (strong, nonatomic) NSMutableArray *demoArr;

@end

@implementation HRBaseDataModel


- (void)requestDate:(NSDictionary *)parmars withResultData:(HRBaseResultDataModel)dataModel {
    //在此发起网络请求，处理网络数据，数据转模型在此完成（模拟网络数据）
    [self requestOperate:parmars];
    self.resultBlock = dataModel;
}

- (void)requestMoreDate:(NSDictionary *)parmars withResultData:(HRBaseResultDataModel)dataModel {
    [self requestOperate:parmars];
    self.resultBlock = dataModel;
}

- (void)requestOperate:(NSDictionary *)parmras {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSMutableArray *dataArr = [NSMutableArray array];
        for (NSDictionary *dic in self.demoArr) {
            HRBaseModel *model = [HRBaseModel baseInfoWithDic:dic];
            [dataArr addObject:model];
        }
        self.resultBlock(1, dataArr);
    });
}

- (NSMutableArray *)demoArr {
    if (_demoArr == nil) {
        _demoArr = [NSMutableArray array];
        NSDictionary *dic1 = @{@"title":@"123", @"name":@"小明", @"age":@(9)};
        NSDictionary *dic2 = @{@"title":@"456", @"name":@"校长", @"age":@(40)};
        NSDictionary *dic3 = @{@"title":@"789", @"name":@"主任", @"age":@(30)};
        [_demoArr addObject:dic1];
        [_demoArr addObject:dic2];
        [_demoArr addObject:dic3];
    }
    return _demoArr;
}


@end
