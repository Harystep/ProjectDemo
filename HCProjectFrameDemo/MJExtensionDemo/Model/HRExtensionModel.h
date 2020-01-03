//
//  HRMJExtensionModel.h
//  HRCommonTool
//
//  Created by pxsl on 2019/12/13.
//  Copyright © 2019 CCAPP. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HRExtensionModel : NSObject

@property (copy, nonatomic) NSString *title;

@property (copy, nonatomic) NSString *time;

@property (strong, nonatomic) NSArray *names;

@end

@interface HRNameModel : NSObject

@property (copy, nonatomic) NSString *name;

@property (assign, nonatomic) NSInteger age;

@property (assign, nonatomic) NSInteger ad_id;

@end

@interface HRExtensionIDModel : NSObject

@property (copy, nonatomic) NSString *title;

@property (copy, nonatomic) NSString *time;

@property (assign, nonatomic) NSInteger ad_id;

@end

@interface Bag : NSObject
@property (copy, nonatomic) NSString *name;
@property (assign, nonatomic) double price;
@end

@interface HRMapExtensionModel : NSObject

@property (copy, nonatomic) NSString *ID;
@property (copy, nonatomic) NSString *desc;
@property (copy, nonatomic) NSString *nowName;
@property (copy, nonatomic) NSString *oldName;
@property (copy, nonatomic) NSString *nameChangedTime;
@property (strong, nonatomic) Bag *bag;

@end



NS_ASSUME_NONNULL_END
