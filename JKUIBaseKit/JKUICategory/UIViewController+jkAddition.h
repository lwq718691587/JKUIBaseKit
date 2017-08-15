//
//  UIViewController+jkAddition.h
//  Pods
//
//  Created by A on 2017/6/5.
//
//
//  UIViewController  Navigation

#import <UIKit/UIKit.h>

typedef void(^NavigationButtonEvent)(UIButton *);
typedef NS_ENUM(NSInteger, Navtiontype) {
    BarButton_Left = 0,
    BarButton_Right
};
@interface UIViewController(jkAddition)


/**
 用一个label 作为一个 标题
 
 @param title 标题
 @param color 颜色
 @param font 字体
 */
- (void)setNavTitle:(NSString * )title
              color:(UIColor *)color
               font:(UIFont *)font;

/**
 创建导航栏左右btn
 
 @param title 标题
 @param image 图片
 @param color 字体颜色
 @param font 字体
 @param action 相应事件
 @param type 左 或 右
 */
- (void)creatNavigationBarButton:(NSString *)title
                           image:(UIImage *)image
                      titleColor:(UIColor *)color
                       titleFont:(UIFont *)font
                          action:(SEL )action
                            type:(Navtiontype)type;


/**
 设置返回按钮

 @param image 返回按钮的图片
 @param leftMargin 距左端的距离 一般为负数
 @param action 返回的方法
 */
-(void)setBackArrowImage:(UIImage *)image
              leftMargin:(CGFloat)leftMargin
                  action:(SEL  )action;

/**
 *  返回按钮
 *
 *  @param content 返回按钮的样式， 可以传入 UIImage, NSString, NSAttributedString, UIButton，UIBarButtonItem
 *
 */
- (void) navigationGoBackButton:(id ) content;

/**
 *  左边按钮
 *
 *  @param content 返回按钮的样式， 可以传入 UIImage, NSString, NSAttributedString, UIButton，UIBarButtonItem
 *  @param buttonEventBlcok   事件回调的Block
 *
 */
- (void) navigationLeftButton: (id ) content
                        event:(NavigationButtonEvent ) buttonEventBlcok;

- (void) navigationRightButton:(id ) content
                         event:(NavigationButtonEvent ) buttonEventBlcok;


/**
 *  左边按钮
 *
 *  @param contentArray 返回按钮的样式， 可以传入 UIImage, NSString, NSAttributedString, UIButton，UIBarButtonItem   数组
 *  @param SELStringArray 事件方法的数组  SEL 名字 @selector(SELString)
 *
 */
- (void) navigationLeftButtons:(NSArray<id> * ) contentArray
                        events:(NSArray<NSString *> * ) SELStringArray;

- (void) navigationRightButtons:(NSArray<id> * ) contentArray
                         events:(NSArray<NSString *> * ) SELStringArray;


@end
