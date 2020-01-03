//
//  HRBaseSimpleCell.h
//  HRCommonTool
//
//  Created by pxsl on 2019/12/12.
//  Copyright © 2019 CCAPP. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HRBaseModel;

NS_ASSUME_NONNULL_BEGIN

@interface HRBaseSimpleCell : UITableViewCell

@property (strong, nonatomic) HRBaseModel *dataModel;

+ (instancetype)baseSimpleTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
