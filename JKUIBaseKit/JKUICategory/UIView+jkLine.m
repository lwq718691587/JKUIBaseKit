//
//  UIView+jkLine.m
//  Pods
//
//  Created by A on 2017/5/31.
//
//

#import "UIView+jkLine.h"
#import <objc/runtime.h>

static const void * lineLayerKey = &lineLayerKey;

@implementation UIView(jkLine)


- (CAShapeLayer *) lineLayer {
    CAShapeLayer *lineLayer = objc_getAssociatedObject(self, lineLayerKey);
    if (lineLayer == nil) {
        lineLayer = [[CAShapeLayer alloc] init];
        lineLayer.position      = CGPointMake(0, 0);
        lineLayer.lineWidth     = 1;
        
        objc_setAssociatedObject(self, lineLayerKey, lineLayer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        [self.layer addSublayer:lineLayer];
    }
    
    return lineLayer;
}

- (CAShapeLayer *) drawline:(CGRect)rect color:(UIColor *)color {
    self.lineLayer.path = [UIBezierPath bezierPathWithRect:rect].CGPath;
    self.lineLayer.fillColor = color.CGColor;
    
    return self.lineLayer;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
