//
//  FirstModel.h
//  DoubleTableView
//
//  Created by 陶柏同 on 2017/4/20.
//  Copyright © 2017年 LaoTao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FirstModel : NSObject

/** 名字 */
@property (nonatomic, copy) NSString *name;

/** 详情 */
@property (nonatomic, copy) NSString *info;

/** 时间/时间戳 */ //时间戳需要为double， 32位系统NSInteger保存时间戳有问题
@property (nonatomic, copy) NSString *time;

/** 用来计算 tableView的高度 */
@property (nonatomic, assign) CGFloat height;

/** 评论的数组 */
@property (nonatomic, strong) NSArray *commentArray;

+ (CGSize)boundingRectWithString:(NSString *)textStr width:(CGFloat)width height:(CGFloat)height font:(NSInteger)font;

@end
