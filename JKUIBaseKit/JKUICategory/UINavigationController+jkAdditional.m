//
//  UINavigationController+jkAdditional.m
//  JKUIBaseKit
//
//  Created by 刘伟强 on 2017/6/8.
//

#import "UINavigationController+jkAdditional.h"

@implementation UINavigationController (jkAdditional)


-(void)setNavBackgroundImage:(UIImage *)navBackgroundImage{
    [self.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    self.navigationBar.shadowImage = [[UIImage alloc] init];
    self.navigationBar.translucent  = NO;
    UIColor *backgroundColor = [UIColor colorWithPatternImage:navBackgroundImage];
    [self.navigationBar setBarTintColor:backgroundColor];
    [self.navigationBar setBackgroundColor:backgroundColor];
}

- (void)setTitleColor:(UIColor *)titleColor titleFont:(UIFont *)titleFont{
    self.navigationBar.titleTextAttributes =@{NSForegroundColorAttributeName:  titleColor ,NSFontAttributeName:titleFont};
}

@end
