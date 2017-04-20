//
//  FirstModel.m
//  DoubleTableView
//
//  Created by 陶柏同 on 2017/4/20.
//  Copyright © 2017年 LaoTao. All rights reserved.
//

#import "FirstModel.h"
#import "SecondModel.h"

@implementation FirstModel

- (CGFloat)height {
    
    CGFloat hei = 0;
    for (int i = 0; i < _commentArray.count; i++) {
        SecondModel *model = _commentArray[i];
        hei += [FirstModel boundingRectWithString:model.info width:([UIScreen mainScreen].bounds.size.width - 70) height:300 font:14].height;
        
        //暂定每个cell 为 文本高度 加上这个固定高度值
        hei += 30;
    }
    //内联tableView的高度 加上cell其他内容的高度，这里暂定
    return hei + 80;
}


//动态调节高度
+ (CGSize)boundingRectWithString:(NSString *)textStr width:(CGFloat)width height:(CGFloat)height font:(NSInteger)font{
    CGSize size;
    
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:font],NSFontAttributeName, nil];
    size = [textStr boundingRectWithSize:CGSizeMake(width, height) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:dict context:nil].size;
    
    return size;
}
@end
