//
//  ViewController.m
//  DoubleTableView
//
//  Created by 陶柏同 on 2017/4/20.
//  Copyright © 2017年 LaoTao. All rights reserved.
//

#import "ViewController.h"
#import "OutCell.h"
#import "FirstModel.h"
#import "SecondModel.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    NSMutableArray *_mArray;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //创建数据源
    _mArray = [NSMutableArray array];
    for (int i = 0; i < 5; i++) {
        FirstModel *model = [[FirstModel alloc] init];
        
        //随机创建评论
        if (i > 1) {
            NSInteger num = arc4random() % 4;
            
            NSMutableArray *tmpArray = [NSMutableArray array];
            for (int j = 0; j < num; j++) {
                SecondModel *sModel = [[SecondModel alloc] init];
                [tmpArray addObject:sModel];
            }
            model.commentArray = tmpArray;
        }
        
        [_mArray addObject:model];
    }
    
    
    _outTableView.delegate = self;
    _outTableView.dataSource = self;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    //model内部 动态计算 高度
    FirstModel *model = _mArray[indexPath.row];
//    NSLog(@"*****%.2f", model.height);
    return model.height;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_outTableView == tableView) {
        return _mArray.count;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_outTableView == tableView) {
        static NSString *cellIde = @"outCellIde";
        OutCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIde];
        if (cell == nil) {
            cell = [[NSBundle mainBundle] loadNibNamed:@"OutCell" owner:self options:nil].firstObject;
        }
        //填充数据内容
        [cell initCellWithModel:_mArray[indexPath.row]];
        
        return cell;
        
    }
    return nil;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
