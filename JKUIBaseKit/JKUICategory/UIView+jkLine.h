//
//  UIView+jkLine.h
//  Pods
//
//  Created by A on 2017/5/31.
//
//

#import <UIKit/UIKit.h>

@interface UIView(jkLine)

- (CAShapeLayer *) lineLayer;

/**
 *  给View 视图添加线   默认lineWidth 为1
 *
 *  @param rect 选取区域
 *  @param color 颜色
 *
 *  @return CAShapeLayer 当前对象
 */

- (CAShapeLayer *) drawline:(CGRect)rect color:(UIColor *)color;


@end
