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

- (CAShapeLayer *) drawline:(CGRect)rect color:(UIColor *)color;

@end
