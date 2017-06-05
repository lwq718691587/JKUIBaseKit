//
//  UIView+jkAttributedString.h
//  Pods
//
//  Created by A on 2017/5/31.
//
//
//  UIView关于AttributedString 相关的处理

#import <UIKit/UIKit.h>

@interface UIView(jkAttributedString)

/**
 *  区域字体变动
 *
 *  @param range: 选取区域
 *  @param font:  字体设置
 *
 *  @return label的rect
 */

- (void) rangeText:(NSRange) range font:(UIFont *) font;

- (void) rangeText:(NSRange) range font:(UIFont *) font color: (UIColor *) color;

- (void) rangeTextSpace:(CGFloat) space;

- (void) rangeText:(NSRange)range space:(CGFloat) space;

/**
 *  区域字体变动 插入图片，以及图片大小
 *
 *  @param range: 选取区域
 *  @param image: 需要插入的图片
 *  @param imageRect: 图片位置显示大小
 *
 *  @return label的rect
 */
- (void) rangeText:(NSRange)range image:(UIImage *) image imageRect:(CGRect) imageRect;

@end

@interface NSString(jkAttributedStringUtil)
/**
 *  计算文字区域，来获得View 控件大小
 *
 *  @param size:  区域大小 (宽)
 *  @param font:  字体大小
 *  @param sapce: 行高
 *
 *  @return label的rect
 */
- (CGRect) boundingRectWithSize:(CGSize)size font: (UIFont *) font lineSpace: (CGFloat) sapce;

@end
