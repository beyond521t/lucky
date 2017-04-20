//
//  OutCell.h
//  DoubleTableView
//
//  Created by 陶柏同 on 2017/4/20.
//  Copyright © 2017年 LaoTao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstModel.h"

@interface OutCell : UITableViewCell

/** 头像 */
@property (weak, nonatomic) IBOutlet UIImageView *headImg;

/** 昵称 */
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

/** 详情 */
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;

/** 时间 */
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

/** 评论 表示图 */
@property (weak, nonatomic) IBOutlet UITableView *inTableView;

/**
 * 为cell进行初始化赋值
 */
- (void)initCellWithModel:(FirstModel *)model;

@end
