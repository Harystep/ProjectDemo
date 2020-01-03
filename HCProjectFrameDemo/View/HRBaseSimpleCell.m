//
//  HRBaseSimpleCell.m
//  HRCommonTool
//
//  Created by pxsl on 2019/12/12.
//  Copyright © 2019 CCAPP. All rights reserved.
//

#import "HRBaseSimpleCell.h"
#import "HRBaseModel.h"

@interface HRBaseSimpleCell ()

@property (strong, nonatomic) UILabel *titleL;

@property (strong, nonatomic) UILabel *nameL;

@property (strong, nonatomic) UILabel *ageL;

@property (strong, nonatomic) NSMutableArray *titleArr;

@end

@implementation HRBaseSimpleCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (instancetype)baseSimpleTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath {
    HRBaseSimpleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HRBaseSimpleCell" forIndexPath:indexPath];
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createSubViews];
    }
    return self;
}

- (void)createSubViews {
    self.nameL = [self createLabelOnTargetView:self.contentView withFrame:CGRectMake(kHRMarginX, 10, 100, 15)];
    [self.nameL setLabelTextColor:kColorHex(@"#333333") text:@"" withFont:15];
    self.titleL = [self createLabelOnTargetView:self.contentView withFrame:CGRectMake(kHRMarginX, CGRectGetMaxY(self.nameL.frame) + 5, 100, 15)];
    [self.titleL setLabelTextColor:kColorHex(@"#666666") text:@"" withFont:15];
    self.ageL = [self createLabelOnTargetView:self.contentView withFrame:CGRectMake(kScreenWidth - 100 - kHRMarginX, 10, 100, 30)];
    [self.ageL setLabelTextColor:kColorHex(@"#FF7513") text:@"" withFont:15];
    self.ageL.textAlignment = NSTextAlignmentRight;
    
    UIView *sepV = [self createViewOnTargetView:self.contentView withFrame:CGRectMake(0, 49, kScreenWidth, 1)];
    sepV.backgroundColor = kColorHex(@"#f6f6f6");
    
    for (int i = 0; i < 2; i ++) {
        UIButton *clickBtn1 = [self createButtonOnTargetView:self.contentView withFrame:CGRectMake(CGRectGetMaxX(self.nameL.frame) + 20 + (40 + 20) * i, 10, 40, 30)];
        clickBtn1.backgroundColor = kColorHex(@"#FF7513");
        clickBtn1.tag = i + 1;
        [clickBtn1 addTarget:self action:@selector(clickBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [clickBtn1 setCornerRadius:3];
        [clickBtn1 setButtonTextColor:kColorHex(@"#ffffff") text:self.titleArr[i] withFont:13];
    }
}

- (void)clickBtnClick:(UIButton *)sender {
    switch (sender.tag) {
        case 1://点击操作
//            [sender routerWithEventName:@"" userInfo:@{}];
            [sender routerWithEventName:@"" userInfo:@{} block:^(id  _Nonnull result) {//需要回调的操作
                NSLog(@"欢迎回来:%@", result);
            }];
            break;
        case 2://点击跳转页面
            [HCRouter router:@"Demo1" viewController:self.viewController];
//            [HCRouter router:@"" params:@{} viewController:self.viewController];//需要传参跳转
            break;
            
        default:
            break;
    }
}

- (void)setDataModel:(HRBaseModel *)dataModel {
    _dataModel = dataModel;
    self.titleL.text = dataModel.title;
    self.nameL.text = dataModel.name;
    self.ageL.text = [NSString stringWithFormat:@"%tu岁", dataModel.age];
}

- (NSMutableArray *)titleArr {
    if (_titleArr == nil) {
        _titleArr = [NSMutableArray arrayWithObjects:@"操作", @"跳转", nil];
        
    }
    return _titleArr;
}

@end
