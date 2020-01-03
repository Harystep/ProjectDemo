//
//  HRBaseDataModel.h
//  HRCommonTool
//
//  Created by pxsl on 2019/12/12.
//  Copyright © 2019 CCAPP. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^HRBaseResultDataModel)(NSInteger status, id _Nullable subValue);

@interface HRBaseDataModel : NSObject

@property (copy, nonatomic) HRBaseResultDataModel resultBlock;
/*
 请求数据
 parmars：请求参数
 HRBaseResultDataModel：返回数据回调
 **/
- (void)requestDate:(NSDictionary *_Nullable)parmars withResultData:(HRBaseResultDataModel _Nullable )dataModel;

- (void)requestMoreDate:(NSDictionary *_Nonnull)parmars withResultData:(HRBaseResultDataModel _Nonnull )dataModel;

@end

