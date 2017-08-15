//
//  UIButton+JKUIImageTitle.h
//  JKControlSugar
//
//  Created by 刘伟强 on 2017/8/8.
//  Copyright © 2017年 JK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (JKUIImageTitle)

-(void)makeLeftImageRightTitle:(CGFloat)spacing;
-(void)makeLeftTitleRightImage:(CGFloat)spacing;
-(void)makeTopImageBottomTitle:(CGFloat)spacing;
-(void)makeTopTitleBottomImage:(CGFloat)spacing;

@end
