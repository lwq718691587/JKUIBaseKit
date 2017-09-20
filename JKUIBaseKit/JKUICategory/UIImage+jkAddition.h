//
//  UIImage+WSK.h
//  CorePlotDemo
//
//  Created by JoyTouch9 on 14-12-11.
//  Copyright (c) 2014年 HTY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Addition)


/**
 拍照 图片方向问题

 @return <#return value description#>
 */
- (UIImage *)normalizedImage;

+ (UIImage *)jkImageName:(NSString *)imageName withClass:(id)boundClass bundleName:(NSString *)bundleName;

/**
 *  抓取屏幕。
 *  @param  scale 屏幕放大倍数，1为原尺寸。
 *  return  屏幕后的Image。
 */
+ (UIImage *)grabScreenWithScale:(CGFloat)scale;

/**
 *  抓取UIView及其子类。
 *  @param  view  UIView及其子类。
 *  @param  scale 屏幕放大倍数，1为原尺寸。
 *  return  抓取图片后的Image。
 */
+ (UIImage *)grabImageWithView:(UIView *)view scale:(CGFloat)scale;

/**
 *  合并两个Image。
 *  @param  image1 图片2
 *  @param  image2 图片1。
 *  @param  frame1 图片1放置的位置
 *  @param  frame2 图片2放置的位置。
 *  @param  size   返回图片的尺寸。
 *  return  合并后的两个图片的Image。
 */
+ (UIImage *)mergeWithImage1:(UIImage *)image1 image2:(UIImage *)image2 frame1:(CGRect)frame1 frame2:(CGRect)frame2 size:(CGSize)size;

/**
 *  把一个Image盖在另一个Image上面。
 *  @param  image  底图。
 *  @param  mask   盖在上面的图。
 *  return  Image  结果Image
 */
+ (UIImage *)maskImage:(UIImage *)image withMask:(UIImage *)mask;

/**
 *  把一个Image尺寸缩放到另一个尺寸。
 *  @param  image 图片
 *  @param  size  尺寸
 *  return  尺寸更改后的Image。
 */
+ (UIImage *)scaleImage:(UIImage *)image toSize:(CGSize)size;

/**
 *  改变一个Image的色彩。
 *  @param  image 被改变的Image。
 *  @param  color 要改变的目标色彩。
 *  return  色彩更改后的Image。
 */
+(UIImage *)colorizeImage:(UIImage *)image withColor:(UIColor *)color;

//按frame裁减图片
+ (UIImage *)captureView:(UIView *)view frame:(CGRect)frame;

/**
 *  剪裁图片 左上角为（0。0）坐标
 *
 *  @param rect <#rect description#>
 *
 *  @return <#return value description#>
 */
- (UIImage *)imageAtRect:(CGRect)rect;
/**
 *  改变图片的大小
 *
 *  @param targetSize <#targetSize description#>
 *
 *  @return <#return value description#>
 */
- (UIImage *)imageByScalingProportionallyToMinimumSize:(CGSize)targetSize;

- (UIImage *)imageByScalingProportionallyToSize:(CGSize)targetSize;
- (UIImage *)imageByScalingToSize:(CGSize)targetSize;
- (UIImage *)imageRotatedByRadians:(CGFloat)radians;
- (UIImage *)imageRotatedByDegrees:(CGFloat)degrees;


//通过色值生成图片
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

//通过url获取图片
+ (UIImage*)imageWithContentsOfURL:(NSURL*)url;

//按照指定的大小缩放图片
- (UIImage*)scaleToSize:(CGSize)size;

- (UIImage *)originImageScaleToSize:(CGSize)size;


@end
