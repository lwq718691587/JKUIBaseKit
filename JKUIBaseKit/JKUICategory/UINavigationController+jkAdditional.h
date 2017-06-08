//
//  UINavigationController+jkAdditional.h
//  JKUIBaseKit
//
//  Created by 刘伟强 on 2017/6/8.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (jkAdditional)

//设置导航栏背景图片
-(void)setNavBackgroundImage:(UIImage *)navBackgroundImage;

/**
 设置导航栏标题颜色 和 字号
 
 @param titleColor 颜色
 @param titleFont 字号
 */
- (void)setTitleColor:(UIColor *)titleColor
            titleFont:(UIFont *)titleFont;


@end
