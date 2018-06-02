//
//  DLMCircleProgress.h
//  SuperHigh
//
//  Created by YangJian on 2018/5/31.
//  Copyright © 2018年 超级高考. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DLMCircleProgress : UIView


/**
 生成一个环形进度条

 @param width 进度条宽度
 @return 环形进度条
 */
+ (instancetype)circleProgressWithBarWidth:(CGFloat)width;

//进度条背景色
@property (strong, nonatomic) UIColor *progressBackgroundColor;

//进度条颜色
@property (strong, nonatomic) UIColor *progressColor;


/**
 更新进度

 @param progress 进度取值0.0-1.0
 */
- (void)updateProgress:(CGFloat)progress;


@end
