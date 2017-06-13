//
//  UIView+UIView_Additional.m
//  I500user
//
//  Created by shanWu on 15/4/9.
//  Copyright (c) 2015年 家伟 李. All rights reserved.
//

#import "UIView+jkAdditional.h"
#import <objc/runtime.h>

@implementation UIView (jkAdditional)

- (CGFloat)left {
    return self.frame.origin.x;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setLeft:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)top {
    return self.frame.origin.y;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setTop:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)centerX {
    return self.center.x;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)centerY {
    return self.center.y;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)width {
    return self.frame.size.width;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)height {
    return self.frame.size.height;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)ttScreenX {
    CGFloat x = 0;
    for (UIView* view = self; view; view = view.superview) {
        x += view.left;
    }
    return x;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)ttScreenY {
    CGFloat y = 0;
    for (UIView* view = self; view; view = view.superview) {
        y += view.top;
    }
    return y;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)screenViewX {
    CGFloat x = 0;
    for (UIView* view = self; view; view = view.superview) {
        x += view.left;
        
        if ([view isKindOfClass:[UIScrollView class]]) {
            UIScrollView* scrollView = (UIScrollView*)view;
            x -= scrollView.contentOffset.x;
        }
    }
    
    return x;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)screenViewY {
    CGFloat y = 0;
    for (UIView* view = self; view; view = view.superview) {
        y += view.top;
        
        if ([view isKindOfClass:[UIScrollView class]]) {
            UIScrollView* scrollView = (UIScrollView*)view;
            y -= scrollView.contentOffset.y;
        }
    }
    return y;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGRect)screenFrame {
    return CGRectMake(self.screenViewX, self.screenViewY, self.width, self.height);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGPoint)origin {
    return self.frame.origin;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGSize)size {
    return self.frame.size;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}


///////////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIView*)descendantOrSelfWithClass:(Class)cls {
    if ([self isKindOfClass:cls])
        return self;
    
    for (UIView* child in self.subviews) {
        UIView* it = [child descendantOrSelfWithClass:cls];
        if (it)
            return it;
    }
    
    return nil;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIView*)ancestorOrSelfWithClass:(Class)cls {
    if ([self isKindOfClass:cls]) {
        return self;
        
    } else if (self.superview) {
        return [self.superview ancestorOrSelfWithClass:cls];
        
    } else {
        return nil;
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)removeAllSubviews {
    while (self.subviews.count) {
        UIView* child = self.subviews.lastObject;
        [child removeFromSuperview];
    }
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGPoint)offsetFromView:(UIView*)otherView {
    CGFloat x = 0, y = 0;
    for (UIView* view = self; view && view != otherView; view = view.superview) {
        x += view.left;
        y += view.top;
    }
    return CGPointMake(x, y);
}

#pragma mark -
#pragma mark custom add method
- (UITableViewCell *)tableViewCell{
    UIView *superView = self.superview;
    while (superView != nil && ![superView isKindOfClass:[UITableViewCell class]]) {
        superView = superView.superview;
    }
    return (UITableViewCell *)superView;
}

- (UITableView *)tableView{
    UIView *superView = self.superview;
    while (superView != nil && ![superView isKindOfClass:[UITableView class]]) {
        superView = superView.superview;
    }
    return (UITableView *)superView;
}

- (void)animatedShowShadow{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    animation.fromValue = (id)[[UIColor clearColor] CGColor];
    animation.toValue = (id)[[UIColor colorWithRed:0 green:0 blue:0 alpha:0.6] CGColor];
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.duration = 0.5;
    [self.layer addAnimation:animation forKey:@"FadeAnimation"];
}

- (void)backgroundColorAnimationOnlayerColor:(UIColor *)color toColor:(UIColor *)toColor{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    animation.fromValue = (id)color.CGColor;
    animation.toValue = (id)toColor.CGColor;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.duration = 0.5;
    [self.layer addAnimation:animation forKey:@"FadeAnimation"];
}

- (NSObject *)attachment {
    return objc_getAssociatedObject(self, @"kViewAttachment");
}

- (void)setAttachment:(NSObject *)attachment {
    objc_setAssociatedObject(self, @"kViewAttachment",nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject(self, @"kViewAttachment",attachment, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (UIView *)findViewWithClassName:(NSString *)aName {
    
    if([[[self class] description] isEqualToString:aName])
        return self;
    
    for(UIView *subview in self.subviews) {
        UIView *huntedSubview = [subview findViewWithClassName:aName];
        
        if(huntedSubview != nil)
            return huntedSubview;
    }
    return nil;
}

+(id)jkLoadFromXib
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:self options:nil]lastObject];
}


+ (id)jkPodLoadFromXibWithBundleName:(NSString *)bundleName{

    NSBundle *b= [NSBundle bundleWithURL:[[NSBundle bundleForClass:[self class]] URLForResource:bundleName withExtension:@"bundle"]];
    return [[b loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] lastObject];
}

+ (CGFloat)factorForiPhone5Width{
    return (CGFloat)320 / 375;
}
+ (CGFloat)factorForiPhone6PWidth{
    return (CGFloat)414 / 375;
}
+ (CGFloat)factorForiPhone6Width{
    return 1;
}
+ (CGFloat)factorForiPadWidth{
    return (CGFloat)768 / 375;
}
+ (CGFloat)Fxw:(CGFloat)xw{
    switch ((NSInteger)[UIScreen mainScreen].bounds.size.width) {
        case 320:
            return [self factorForiPhone5Width] * xw;
        case 375:
            return [self factorForiPhone6Width]* xw;
        case 414:
            return [self factorForiPhone6PWidth]* xw;
        case 768:
            return [self factorForiPadWidth]* xw;
        default:
            return [self factorForiPhone6Width]* xw;
    }
}

+ (CGFloat)factorForiPhone5Height{
    return (CGFloat)568 / 667;
}
+ (CGFloat)factorForiPhone6PHeight{
    return (CGFloat)736 / 667;
}
+ (CGFloat)factorForiPhone6Height{
    return 1;
}
+ (CGFloat)factorForiPhone4sHeight{
    return (CGFloat)480 / 667;
    
}
+ (CGFloat)factorForiPadHeight{
    return (CGFloat)1024 / 667;
    
}
+ (CGFloat)Fyh:(CGFloat)yh{
    switch ((NSInteger)[UIScreen mainScreen].bounds.size.height) {
        case 568:
            return [self factorForiPhone5Height]*yh;
            break;
        case 667:
            return [self factorForiPhone6Height]*yh;
        case 736:
            return [self factorForiPhone6PHeight]*yh;
        case 1024:
            return [self factorForiPadHeight]* yh;
        default:
            return [self factorForiPhone5Height]*yh;
    }
}

@end
