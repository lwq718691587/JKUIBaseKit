//
//  UINavigationController+jkAdditional.m
//  JKUIBaseKit
//
//  Created by 刘伟强 on 2017/6/8.
//

#import "UINavigationController+jkAdditional.h"

@implementation UINavigationController (jkAdditional)


-(void)setNavBackgroundImage:(UIImage *)navBackgroundImage{
    [self.navigationBar setBackgroundImage:navBackgroundImage forBarMetrics:UIBarMetricsDefault];
    self.navigationBar.shadowImage = [[UIImage alloc] init];
    self.navigationBar.translucent  = NO;
}

- (void)setTitleColor:(UIColor *)titleColor titleFont:(UIFont *)titleFont{
    self.navigationBar.titleTextAttributes =@{NSForegroundColorAttributeName:  titleColor ,NSFontAttributeName:titleFont};
}

@end
