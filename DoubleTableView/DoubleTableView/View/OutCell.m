//
//  OutCell.m
//  DoubleTableView
//
//  Created by 陶柏同 on 2017/4/20.
//  Copyright © 2017年 LaoTao. All rights reserved.
//

#import "OutCell.h"
#import "DetailCell.h"

@interface OutCell ()<UITableViewDataSource, UITableViewDelegate>
{
    //主要为 内部表示图使用而创建
    //_model表示 内部表示图，数据源
    FirstModel *_model;
}
@end

@implementation OutCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    if (_inTableView) {
        _inTableView.delegate = self;
        _inTableView.dataSource = self;
        
        //方便观察区域
        _inTableView.layer.borderWidth = 1;
        _inTableView.layer.borderColor = [UIColor orangeColor].CGColor;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //数据源中的评论数量，为表示图的数据个数
//    NSLog(@"=====%ld", _model.commentArray.count);
    return _model.commentArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    SecondModel *model = _model.commentArray[indexPath.row];
    CGSize size = [FirstModel boundingRectWithString:model.info width:([UIScreen mainScreen].bounds.size.width - 80 - 16) height:100 font:14];
    if (model.info.length > 0) {
        return size.height + 30;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIde = @"detailCellIde";
    DetailCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIde];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"DetailCell" owner:self options:nil] firstObject];
    }
    
    //获取评论 内容，进行显示
    SecondModel *model = _model.commentArray[indexPath.row];
    [cell initCellWithModel:model];
    
    return cell;
}

- (void)initCellWithModel:(FirstModel *)model {
    //进行内部传递过来的model 数据 临时保存
    _model = model;
//    _headImg =
//    _nameLabel.text = model.name;
//    _infoLabel.text = model.info;
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
