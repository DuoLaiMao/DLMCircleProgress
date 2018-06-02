//
//  DLMCircleProgress.m
//  SuperHigh
//
//  Created by YangJian on 2018/5/31.
//  Copyright © 2018年 超级高考. All rights reserved.
//

#import "DLMCircleProgress.h"

@interface DLMCircleProgress ()

@property (assign, nonatomic) CGFloat progressWidth;  //进度条宽度

@property (strong, nonatomic) CAShapeLayer *backgroundLayer;
@property (strong, nonatomic) CAShapeLayer *progressLayer;

@end

@implementation DLMCircleProgress

+ (instancetype)circleProgressWithBarWidth:(CGFloat)width;
{
    DLMCircleProgress *bar = [[DLMCircleProgress alloc] init];
    if (bar) {
        bar.transform = CGAffineTransformMakeRotation(-M_PI_2);
        bar.progressWidth = width;
        [bar.layer addSublayer:bar.backgroundLayer];
        [bar.layer addSublayer:bar.progressLayer];
    }
    
    return bar;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGRect rect = self.bounds;
    rect.origin.x = self.progressWidth / 2;
    rect.origin.y = self.progressWidth / 2;
    rect.size.width -= self.progressWidth;
    rect.size.height -= self.progressWidth;
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:rect];
    self.backgroundLayer.path = path.CGPath;
    self.progressLayer.path = path.CGPath;
}

- (void)setProgressBackgroundColor:(UIColor *)progressBackgroundColor
{
    self.backgroundLayer.strokeColor = progressBackgroundColor.CGColor;
}

- (void)setProgressColor:(UIColor *)progressColor
{
    self.progressLayer.strokeColor = progressColor.CGColor;
}

- (void)updateProgress:(CGFloat)progress
{
    self.progressLayer.strokeEnd = progress;
}

#pragma mark - setter && getter
- (CAShapeLayer *)backgroundLayer
{
    if (!_backgroundLayer) {
        _backgroundLayer = [CAShapeLayer layer];
        _backgroundLayer.lineWidth = self.progressWidth;
        _backgroundLayer.lineCap = kCALineCapRound;
        _backgroundLayer.fillColor = [UIColor clearColor].CGColor;
    }
    return _backgroundLayer;
}
- (CAShapeLayer *)progressLayer
{
    if (!_progressLayer) {
        _progressLayer = [CAShapeLayer layer];
        _progressLayer.lineWidth = self.progressWidth;
        _progressLayer.lineCap = kCALineCapRound;
        _progressLayer.fillColor = [UIColor clearColor].CGColor;
        _progressLayer.strokeEnd = 0.f;
    }
    return _progressLayer;
}

@end
