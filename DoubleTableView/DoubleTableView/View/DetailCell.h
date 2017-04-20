//
//  DetailCell.h
//  DoubleTableView
//
//  Created by 陶柏同 on 2017/4/20.
//  Copyright © 2017年 LaoTao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondModel.h"

@interface DetailCell : UITableViewCell

/** 评论内容 */
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;

- (void)initCellWithModel:(SecondModel *)model;

@end
